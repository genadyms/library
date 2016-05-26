package com.gmazurkevich.training.library.webapp.page.orders;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.orders.panel.OrdersListPanel;

public class OrdersPage extends AbstractPage {

	public OrdersPage() {
		super();
		add(new OrdersListPanel("list-panel"));

		add(new Link("create") {
			@Override
			public void onClick() {
				setResponsePage(new OrderEditPage(new Order()));
			}
		});
	}

}
