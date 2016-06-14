package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.Order;

public interface OrderDao extends AbstractDao<Order, Long> {

	List<Order> find(OrderFilter filter);

	Long count(OrderFilter filter);

	Order getOrderFetchAll(Long id);

	Order findCopyBook(OrderFilter filter);
}
