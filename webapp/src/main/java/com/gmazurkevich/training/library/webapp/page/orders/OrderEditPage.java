package com.gmazurkevich.training.library.webapp.page.orders;

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

public class OrderEditPage extends AbstractPage {

	@Inject
	private OrderService orderService;

	private Order order;

	public OrderEditPage(PageParameters parameters) {
		super(parameters);
	}

	public OrderEditPage(Order order) {
		super();
		this.order = order;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		Form<Order> form = new OrderForm<Order>("form", new CompoundPropertyModel<Order>(order));
		add(form);

		DateTextField handledField = new DateTextField("handled");
		handledField.add(new DatePicker());
		form.add(handledField);

		DateTextField closedField = new DateTextField("closed");
		closedField.add(new DatePicker());
		form.add(closedField);
		
		form.add(new SubmitLink("save") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				orderService.saveOrUpdate(order);
				setResponsePage(new OrdersPage());
			}
		});

		add(new FeedbackPanel("feedback"));
	}

	private class OrderForm<T> extends Form<T> {

		public OrderForm(String id, IModel<T> model) {
			super(id, model);
		}
	}

}
