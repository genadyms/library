package com.gmazurkevich.training.library.webapp.page.copybook.panel;

import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;

import javax.inject.Inject;
import javax.persistence.metamodel.SingularAttribute;

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

import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.CopyBook_;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.IssueService;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.webapp.page.copybook.CopyBookEditPage;
import com.gmazurkevich.training.library.webapp.page.copybook.CopyBooksPage;
import com.gmazurkevich.training.library.webapp.page.orders.OrderCopyBookPage;

public class CopyBooksListPanel extends Panel {

	@Inject
	private CopyBookService copyBookService;
	@Inject
	private OrderService orderService;
	@Inject
	private IssueService issueService;

	private Book book;

	public CopyBooksListPanel(String id, Book book) {
		super(id);
		this.book = book;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		CopyBooksDataProvider copyBooksDataProvider = new CopyBooksDataProvider();
		DataView<CopyBook> dataView = new DataView<CopyBook>("rows", copyBooksDataProvider, 5) {

			@Override
			protected void populateItem(Item<CopyBook> item) {
				CopyBook copyBook = item.getModelObject();
				Order order = orderService.getActiveOrder(copyBook);
				Issue issue = issueService.getActiveIssue(copyBook);
				Date busyTo = null;
				if (order != null)
					busyTo = order.getClosed();
				if (issue != null)
					busyTo = issue.getPlannedDateReturn();
				item.add(new Label("id", copyBook.getId()));
				item.add(new Label("book", book.getTitle()));
				item.add(new Label("department", copyBook.getDepartment().getName()));
				item.add(new Label("busyTo", busyTo));

				item.add(new Link<Void>("edit-link") {
					@Override
					public void onClick() {
						setResponsePage(new CopyBookEditPage(copyBook));
					}
				});

				item.add(new Link<Void>("delete-link") {
					@Override
					public void onClick() {
						copyBookService.delete(copyBook.getId());
					}
				});

				item.add(new Link<Void>("order-link") {
					@Override
					public void onClick() {
						setResponsePage(new OrderCopyBookPage(copyBook));
					}
				});
			}

		};
		add(dataView);
		add(new PagingNavigator("paging", dataView));
		add(new OrderByBorder("sort-id", CopyBook_.id, copyBooksDataProvider));
		add(new OrderByBorder("sort-book", CopyBook_.book, copyBooksDataProvider));
		add(new OrderByBorder("sort-department", CopyBook_.department, copyBooksDataProvider));

	}

	private class CopyBooksDataProvider extends SortableDataProvider<CopyBook, Serializable> {

		private CopyBookFilter copyBookFilter;

		public CopyBooksDataProvider() {
			super();
			copyBookFilter = new CopyBookFilter();
			copyBookFilter.setBook(book);
			setSort((Serializable) CopyBook_.id, SortOrder.ASCENDING);
		}

		@Override
		public Iterator<CopyBook> iterator(long first, long count) {
			Serializable property = getSort().getProperty();
			SortOrder propertySortOrder = getSortState().getPropertySortOrder(property);

			copyBookFilter.setSortProperty((SingularAttribute) property);
			copyBookFilter.setSortOrder(propertySortOrder.equals(SortOrder.ASCENDING) ? true : false);

			copyBookFilter.setLimit((int) count);
			copyBookFilter.setOffset((int) first);
			return copyBookService.find(copyBookFilter).iterator();
		}

		@Override
		public long size() {
			return copyBookService.count(copyBookFilter);
		}

		@Override
		public IModel<CopyBook> model(CopyBook object) {
			return new Model(object);
		}

	}

}
