package com.gmazurkevich.training.library.service.impl;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.CopyBookDao;
import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.IssueService;
import com.gmazurkevich.training.library.service.OrderService;

@Service
public class CopyBookServiceImpl implements CopyBookService {
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
	}

	@Override
	public void delete(Long id) {
		copyBookDao.delete(id);
	}

	@Override
	public void save(CopyBook copyBook) {

		copyBookDao.insert(copyBook);
	}

	@Override
	public List<CopyBook> find(CopyBookFilter filter) {
		return copyBookDao.find(filter);
	}

	@Override
	public Long count(CopyBookFilter filter) {
		return copyBookDao.count(filter);
	}

	@Override
	public Date getFreeDateFrom(CopyBook copyBook) {
		Issue issue = issueService.getActiveIssue(copyBook);
		if (issue != null) {
			return issue.getPlannedDateReturn();
		}
		Order order = orderService.getActiveOrder(copyBook);
		if (order != null) {
			return order.getDateReturn();
		}
		return new Date();
	}
	// @Override
	// public Date getFreeDateFrom(CopyBook copyBook) {
	// try {
	// Issue issue = issueService.getActiveIssue(copyBook);
	// if (issue != null) {
	// return issue.getPlannedDateReturn();
	// }
	// Order order = orderService.getActiveOrder(copyBook);
	// if (order != null) {
	// return order.getDateReturn();
	// }
	// } catch (javax.persistence.NoResultException e) {
	//
	// }
	// return new Date();
	// }
}
