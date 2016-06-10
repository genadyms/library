package com.gmazurkevich.training.library.webapp.page.orders;

import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.orders.panel.OrdersListPanel;

public class OrdersPage extends AbstractPage {

	private static final long serialVersionUID = 1L;

	public OrdersPage() {
		super();
		add(new OrdersListPanel("list-panel"));
	}
}
