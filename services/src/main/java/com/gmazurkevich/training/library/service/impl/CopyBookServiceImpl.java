package com.gmazurkevich.training.library.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.CopyBookDao;
import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.dataaccess.filters.IssueFilter;
import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.datamodel.Order_;
import com.gmazurkevich.training.library.service.AuthorServiceTest;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.IssueService;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.service.util.NextDateUtil;

@Service
public class CopyBookServiceImpl implements CopyBookService {
	private static Logger LOGGER = LoggerFactory.getLogger(CopyBookServiceImpl.class);
	@Inject
	private CopyBookDao copyBookDao;

	@Inject
	private OrderService orderService;

	@Inject
	private IssueService issueService;

	@Override
	public CopyBook get(Long id) {
		return copyBookDao.get(id);
	}

	@Override
	public void update(CopyBook copyBook) {
		copyBookDao.update(copyBook);
		LOGGER.info("Update {}", copyBook);
	}

	@Override
	public void delete(Long id) {
		copyBookDao.delete(id);
		LOGGER.info("Delete copybook with id {}", id);
	}

	@Override
	public void save(CopyBook copyBook) {
		copyBookDao.insert(copyBook);
		LOGGER.info("Save {}", copyBook);
	}

	@Override
	public List<CopyBook> find(CopyBookFilter filter) {
		return copyBookDao.find(filter);
	}

	@Override
	public CopyBook fetchOrderIssue(CopyBook copyBook) {
		CopyBookFilter filter = new CopyBookFilter();
		filter.setFetchBook(true);
		filter.setFetchDepartment(true);
		filter.setFetchIssue(true);
		filter.setFetchOrder(true);
		filter.setCopyBookId(copyBook.getId());
		return copyBookDao.getFetchCopyBook(filter);
	}

	@Override
	public Long count(CopyBookFilter filter) {
		return copyBookDao.count(filter);
	}

	@Override
	public Date getFreeDateFrom(CopyBook copyBook) {
		Date result = new Date();
		List<Date> allReturnDates = new ArrayList<Date>();
		allReturnDates.add(result);
		IssueFilter issueFilter = new IssueFilter();
		issueFilter.setCopyBook(copyBook);
		List<Issue> issues = issueService.find(issueFilter);
		for (Issue curr : issues) {
			if (curr.getDateReturn() != null) {
				allReturnDates.add(curr.getPlannedDateReturn());
			}
		}
		OrderFilter orderFilter = new OrderFilter();
		orderFilter.setCopyBook(copyBook);
		List<Order> orders = orderService.find(orderFilter);
		for (Order order : orders) {
			if (order.getDateReturn() != null) {
				allReturnDates.add(order.getDateReturn());
			}
		}
		if (allReturnDates.size() > 1) {
			Collections.sort(allReturnDates, new Comparator<Date>() {
				@Override
				public int compare(Date date1, Date date2) {
					return (-date1.compareTo(date2));
				}

			});
			result = NextDateUtil.getNextDate(allReturnDates.get(0));
		}
		return result;
	}

}
