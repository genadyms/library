package com.gmazurkevich.training.library.webapp.page.orders;

import javax.inject.Inject;

import org.apache.wicket.behavior.Behavior;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.request.component.IRequestableComponent;
import org.apache.wicket.request.component.IRequestablePage;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class OrderDetailsPage extends AbstractPage {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private OrderService orderService;
	
	@Inject
	private CopyBookService copyBookService;
	
	private Order order;
	
	private CopyBook copyBook;
	
	public OrderDetailsPage(Order order) {
		this.order = orderService.getOrderFetchAll(order.getId());
		this.copyBook = copyBookService.getCopyBookFetchAll(this.order.getCopyBook().getId()); 
	}
	
	@Override
	protected void onInitialize() {
		super.onInitialize();
		add(new Label("title-book", copyBook.getBook().getTitle()));
		add(new Label("firstname-reader", order.getReader().getFirstName()));
		add(new Label("lastname-reader", order.getReader().getLastName()));
		add(new Label("name-department", copyBook.getDepartment().getName()));
		add(new Label("type-department", copyBook.getDepartment().getType()));
		
	}
}
