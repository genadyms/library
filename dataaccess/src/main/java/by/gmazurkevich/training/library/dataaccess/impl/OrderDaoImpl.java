package by.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.OrderDao;
import by.gmazurkevich.training.library.datamodel.Order;

@Repository
public class OrderDaoImpl extends AbstractDaoImpl<Order, Long> implements OrderDao {

	protected OrderDaoImpl() {
		super(Order.class);
	}

}
