package com.gmazurkevich.training.library.webapp.page.orders;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.behavior.Behavior;
import org.apache.wicket.extensions.markup.html.form.DateTextField;
import org.apache.wicket.extensions.markup.html.form.palette.Palette;
import org.apache.wicket.extensions.markup.html.form.palette.theme.DefaultTheme;
import org.apache.wicket.extensions.yui.calendar.DatePicker;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.model.util.CollectionModel;
import org.apache.wicket.request.component.IRequestableComponent;
import org.apache.wicket.request.component.IRequestablePage;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.common.CatalogChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.AuthorChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;
import com.gmazurkevich.training.library.webapp.page.copybook.CopyBookEditPage;

public class OrderCopyBookPage extends AbstractPage {
	@Inject
	private OrderService orderService;

	@Inject
	private UserService userService;

	private CopyBook copyBook;

	public OrderCopyBookPage(CopyBook copyBook) {
		super();
		this.copyBook = copyBook;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		String resultOrder = isOkMakeOrder() ? "Ok" : "Order is fault";
		add(new Label("result", resultOrder));
		add(new Link("orders-link"){
			@Override
			public void onClick() {
				setResponsePage(new OrdersPage());
			}
		});
	}

	private boolean isOkMakeOrder() {
		Order order = new Order();
		order.setCopyBook(copyBook);
		order.setReader(userService.getProfile(AuthorizedSession.get().getLoggedUser().getId()));
		order.setCreated(new Date());
		orderService.save(order);
		return (order.getId() != null);
	}
}
