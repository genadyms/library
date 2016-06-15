package com.gmazurkevich.training.library.service.impl;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.OrderDao;
import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.IssueService;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.service.util.NextDateUtil;

@Service
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDao orderDao;

	@Inject
	private IssueService issueService;

	@Override
	public Order get(Long id) {
		return orderDao.get(id);
	}

	@Override
	public void update(Order order) {
		orderDao.update(order);
	}

	@Override
	public void delete(Long id) throws DeleteActiveOrderException {
		Order order = get(id);
		if (order.getLibrarian() != null || order.getHandled() != null)
			throw new DeleteActiveOrderException();
		orderDao.delete(id);
	}

	@Override
	public void save(Order order) {
		CopyBook copyBook = order.getCopyBook();
//		Issue issue = issueService.getActiveIssue(copyBook)
//		if(issueService.getActiveIssue(copyBook)!=null){
//			 Calendar cal = Calendar.getInstance();
//		     cal.setTime(issue.getDateReturn());
//		     cal.add(Calendar.DATE, 1); //minus number would decrement the days
//		    order.setDateReserve(cal.getTime());
//			getActiveOrder(copyBook)!=null) throw new CopyBookBusyException(); 
//		}
		
		orderDao.insert(order);
	}

	@Override
	public List<Order> find(OrderFilter filter) {
		return orderDao.find(filter);
	}

	@Override
	public long count(OrderFilter filter) {
		return orderDao.count(filter);
	}

	// @Override
	// public Order getOrderFetchAll(Long id) {
	// Long idTest = id;
	// return orderDao.getOrderFetchAll(id);
	// }

	@Override
	public Order geLastActiveOrder(CopyBook copyBook) {
		OrderFilter filter = new OrderFilter();
		filter.setCopyBook(copyBook);
		filter.setStatusActive(true);
		List<Order> result = orderDao.find(filter);
		for(Order curr : result) {
			System.out.println("-----------------------");
			System.out.println(curr.getCreated());
			System.out.println(curr.getDateReserve());
			System.out.println(curr.getDateReturn());
			System.out.println(curr.getCopyBook().getId());
			System.out.println(NextDateUtil.getNextDate(curr.getDateReturn()));
			System.out.println("-----------------------");
		}
		Order res = null;
		if(!result.isEmpty()){
			res = result.get(result.size()-1);
			System.out.println("=====================================");
			System.out.println(res.getCreated());
			System.out.println(res.getDateReserve());
			System.out.println(res.getDateReturn());
			System.out.println(res.getCopyBook().getId());
			System.out.println(NextDateUtil.getNextDate(res.getDateReturn()));
			System.out.println("=====================================");
			
		}
		return res;
//		return result.isEmpty() ? null : result.get(0);
	}
}
