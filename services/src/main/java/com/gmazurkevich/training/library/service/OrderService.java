package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.impl.DeleteActiveOrderException;

public interface OrderService {
	Order get(Long id);

	@Transactional
	void update(Order order);

	@Transactional
	void delete(Long id) throws DeleteActiveOrderException;

	@Transactional
	void save(Order order);

	List<Order> find(OrderFilter filter);

	long count(OrderFilter orderFilter);

	Order getOrderFetchAll(Long id);

	Order getActiveOrder(CopyBook copyBook);
}
