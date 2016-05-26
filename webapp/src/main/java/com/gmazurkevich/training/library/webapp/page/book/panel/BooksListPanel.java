package com.gmazurkevich.training.library.webapp.page.book.panel;

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

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Book_;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.webapp.page.book.BookEditPage;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;

public class BooksListPanel extends Panel {

	@Inject
	private BookService bookService;

	public BooksListPanel(String id) {
		super(id);

		BooksDataProvider booksDataProvider = new BooksDataProvider();
		DataView<Book> dataView = new DataView<Book>("rows", booksDataProvider, 5) {
			@Override
			protected void populateItem(Item<Book> item) {
				Book book = item.getModelObject();

				item.add(new Label("id", book.getId()));
				item.add(new Label("title", book.getTitle()));
				item.add(new Label("publishingOffice", book.getPublishingOffice()));
				item.add(DateLabel.forDatePattern("year", Model.of(book.getYear()), "dd-MM-yyyy"));

				item.add(new Link<Void>("edit-link") {
					@Override
					public void onClick() {
						setResponsePage(new BookEditPage(book));
					}
				});

				item.add(new Link<Void>("delete-link") {
					@Override
					public void onClick() {
						try {
							bookService.delete(book);
						} catch (PersistenceException e) {
							System.out.println("caughth persistance exception");
						}

						setResponsePage(new BooksPage());
					}
				});

			}
		};
		add(dataView);
		add(new PagingNavigator("paging", dataView));

		add(new OrderByBorder("sort-id", Book_.id, booksDataProvider));
		add(new OrderByBorder("sort-title", Book_.title, booksDataProvider));
		add(new OrderByBorder("sort-publishing_office", Book_.publishingOffice, booksDataProvider));

	}

	private class BooksDataProvider extends SortableDataProvider<Book, Serializable> {

		private BookFilter bookFilter;

		public BooksDataProvider() {
			super();
			bookFilter = new BookFilter();
			setSort((Serializable) Book_.title, SortOrder.ASCENDING);
		}

		@Override
		public Iterator<Book> iterator(long first, long count) {
			Serializable property = getSort().getProperty();
			SortOrder propertySortOrder = getSortState().getPropertySortOrder(property);

			bookFilter.setSortProperty((SingularAttribute) property);
			bookFilter.setSortOrder(propertySortOrder.equals(SortOrder.ASCENDING) ? true : false);

			bookFilter.setLimit((int) count);
			bookFilter.setOffset((int) first);
			return bookService.find(bookFilter).iterator();
		}

		@Override
		public long size() {
			return bookService.count(bookFilter);
		}

		@Override
		public IModel<Book> model(Book object) {
			return new Model(object);
		}

	}

}
