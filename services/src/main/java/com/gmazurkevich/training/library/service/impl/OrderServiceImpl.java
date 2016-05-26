package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.OrderDao;
import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDao orderDao;

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
		orderDao.insert(order);
	}

	@Override
	public List<Order> find(OrderFilter filter) {
		return null;
	}

	@Override
	public void saveOrUpdate(Order order) {
		if (order.getId() == null) {
			orderDao.insert(order);
		} else {
			orderDao.update(order);
		}
	}

	@Override
	public long count(OrderFilter filter) {
		return orderDao.count(filter);
	}

}
