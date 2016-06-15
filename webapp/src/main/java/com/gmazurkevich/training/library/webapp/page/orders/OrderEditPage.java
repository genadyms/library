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
import com.gmazurkevich.training.library.webapp.page.issue.IssueEditPage;

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
		this.order = order;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		Form<Order> form = new OrderForm<Order>("form", new CompoundPropertyModel<Order>(order));
		add(form);

		DateTextField reserveField = new DateTextField("dateReserve");
		reserveField.add(new DatePicker());
		form.add(reserveField);

		DateTextField returnField = new DateTextField("dateReturn");
		returnField.add(new DatePicker());
		form.add(returnField);

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

		form.add(new SubmitLink("issue") {
			@Override
			public void onSubmit() {
				super.onSubmit();
//				order.setClosed(new Date());
//				orderService.update(order);
//				Order orderFetch = orderService.getOrderFetchAll(order.getId());
//				setResponsePage(new IssueEditPage(orderFetch.getCopyBook(), orderFetch.getReader()));
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
