package com.gmazurkevich.training.library.webapp.page.orders.panel;

import java.io.Serializable;
import java.util.Iterator;

import javax.inject.Inject;
import javax.persistence.PersistenceException;
import javax.persistence.metamodel.SingularAttribute;

import org.apache.wicket.datetime.markup.html.basic.DateLabel;
import org.apache.wicket.extensions.markup.html.repeater.data.sort.OrderByBorder;
import org.apache.wicket.extensions.markup.html.repeater.data.sort.SortOrder;
import org.apache.wicket.extensions.markup.html.repeater.util.SortableDataProvider;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.navigation.paging.PagingNavigator;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;

import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.datamodel.Order_;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.service.impl.DeleteActiveOrderException;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;
import com.gmazurkevich.training.library.webapp.page.orders.OrderEditPage;

public class OrdersListPanel extends Panel {

	@Inject
	private OrderService orderService;

	public OrdersListPanel(String id) {
		super(id);

		OrdersDataProvider ordersDataProvider = new OrdersDataProvider();
		DataView<Order> dataView = new DataView<Order>("rows", ordersDataProvider, 5) {
			@Override
			protected void populateItem(Item<Order> item) {
				Order order = item.getModelObject();

				item.add(new Label("id", order.getId()));
				item.add(DateLabel.forDatePattern("created", Model.of(order.getCreated()), "dd-MM-yyyy"));
				item.add(DateLabel.forDatePattern("handled", Model.of(order.getHandled()), "dd-MM-yyyy"));
				item.add(DateLabel.forDatePattern("closed", Model.of(order.getClosed()), "dd-MM-yyyy"));

				item.add(new Link<Void>("edit-link") {
					@Override
					public void onClick() {
						setResponsePage(new OrderEditPage(order));
					}
				});

				item.add(new Link<Void>("delete-link") {
					@Override
					public void onClick() {
						try {
							orderService.delete(order.getId());
						} catch (PersistenceException | DeleteActiveOrderException e) {
							System.out.println("caughth persistance exception");
						}

						setResponsePage(new BooksPage());
					}
				});

			}
		};
		add(dataView);
		add(new PagingNavigator("paging", dataView));

		add(new OrderByBorder("sort-created", Order_.created, ordersDataProvider));
		add(new OrderByBorder("sort-handled", Order_.handled, ordersDataProvider));
		add(new OrderByBorder("sort-closed", Order_.closed, ordersDataProvider));

	}

	private class OrdersDataProvider extends SortableDataProvider<Order, Serializable> {

		private OrderFilter orderFilter;

		public OrdersDataProvider() {
			super();
			orderFilter = new OrderFilter();
			setSort((Serializable) Order_.created, SortOrder.ASCENDING);
		}

		@Override
		public Iterator<Order> iterator(long first, long count) {
			Serializable property = getSort().getProperty();
			SortOrder propertySortOrder = getSortState().getPropertySortOrder(property);

			orderFilter.setSortProperty((SingularAttribute) property);
			orderFilter.setSortOrder(propertySortOrder.equals(SortOrder.ASCENDING) ? true : false);

			orderFilter.setLimit((int) count);
			orderFilter.setOffset((int) first);
			return orderService.find(orderFilter).iterator();
		}

		@Override
		public long size() {
			return orderService.count(orderFilter);
		}

		@Override
		public IModel<Order> model(Order object) {
			return new Model(object);
		}

	}

}
