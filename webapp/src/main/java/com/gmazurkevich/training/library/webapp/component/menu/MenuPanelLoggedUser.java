package com.gmazurkevich.training.library.webapp.component.menu;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.webapp.page.catalog.CatalogsPage;
import com.gmazurkevich.training.library.webapp.page.comment.CommentsPage;
import com.gmazurkevich.training.library.webapp.page.orders.OrdersPage;

public class MenuPanelLoggedUser extends MenuPanel {

	public MenuPanelLoggedUser(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		
		add(new Link("link-catalog") {
			@Override
			public void onClick() {
				setResponsePage(new CatalogsPage());
			}
		});
		
		add(new Link("link-comments") {
			@Override
			public void onClick() {
				setResponsePage(new CommentsPage());
			}
		});
		
		add(new Link("link-orders") {
			@Override
			public void onClick() {
				setResponsePage(new OrdersPage());
			}
		});
	}
}
