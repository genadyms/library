package com.gmazurkevich.training.library.webapp.page.orders;

import java.util.Date;

import javax.inject.Inject;

import org.apache.wicket.extensions.markup.html.form.DateTextField;
import org.apache.wicket.extensions.yui.calendar.DatePicker;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;
import com.gmazurkevich.training.library.webapp.page.home.HomePage;

public class OrderEditPage extends AbstractPage {

	private static final long serialVersionUID = 1L;

	@Inject
	private OrderService orderService;

	private Order order;

	public OrderEditPage(PageParameters parameters) {
		super(parameters);
	}

	public OrderEditPage(Order order) {
		super();
		this.order = order;// Service.getOrderFetchAll(order.getId());
		// this.order = orderService.getOrderFetchAll(order.getId());
		// order.setClosed(new Date());
		// order.setReserved(new Date());
		// order.setClosed(new Date());
		// orderService.save(order);
		// System.out.println("_____________"+order.getId());
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		Form<Order> form = new OrderForm<Order>("form", new CompoundPropertyModel<Order>(order));
		add(form);

		DateTextField reservedDateField = new DateTextField("reserved");
		reservedDateField.add(new DatePicker());
		form.add(reservedDateField);

		DateTextField handledField = new DateTextField("handled");
		handledField.add(new DatePicker());
		form.add(handledField);

		form.add(new SubmitLink("update") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				submitExecute();
			}

		});

		form.add(new SubmitLink("close") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				order.setClosed(new Date());
				submitExecute();
			}
		});

		add(new FeedbackPanel("feedback"));
	}

	private void submitExecute() {
		orderService.update(order);
		setResponsePage(new OrdersPage());
	}

	private class OrderForm<T> extends Form<T> {
		public OrderForm(String id, IModel<T> model) {
			super(id, model);
		}
	}

}
