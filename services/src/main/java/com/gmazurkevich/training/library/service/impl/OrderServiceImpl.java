package com.gmazurkevich.training.library.service.impl;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.OrderDao;
import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.IssueService;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.service.exception.DeleteActiveOrderException;
import com.gmazurkevich.training.library.service.util.NextDateUtil;

@Service
public class OrderServiceImpl implements OrderService {

	private static Logger LOGGER = LoggerFactory.getLogger(OrderServiceImpl.class);
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
		LOGGER.info("Update {}", order);
	}

	@Override
	public void delete(Long id) throws DeleteActiveOrderException {
		Order order = get(id);
		if (order.getLibrarian() != null || order.getHandled() != null) {
			LOGGER.info("throws DeleteActiveOrderException for order with id {}", id);
			throw new DeleteActiveOrderException();
		}
		orderDao.delete(id);
		LOGGER.info("Delete with id {}", id);
	}

	@Override
	public void save(Order order) {
		orderDao.insert(order);
		LOGGER.info("Save {}", order);
	}

	@Override
	public List<Order> find(OrderFilter filter) {
		return orderDao.find(filter);
	}

	@Override
	public long count(OrderFilter filter) {
		return orderDao.count(filter);
	}

	@Override
	public Order geLastActiveOrder(CopyBook copyBook) {
		OrderFilter filter = new OrderFilter();
		filter.setCopyBook(copyBook);
		filter.setStatusActive(true);
		List<Order> result = orderDao.find(filter);
		Order res = null;
		return res;
	}
}
