package com.gmazurkevich.training.library.webapp.page.book.panel;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.PersistenceException;

import org.apache.wicket.datetime.markup.html.basic.DateLabel;
import org.apache.wicket.extensions.markup.html.repeater.data.sort.OrderByBorder;
import org.apache.wicket.extensions.markup.html.repeater.data.sort.SortOrder;
import org.apache.wicket.extensions.markup.html.repeater.util.SortableDataProvider;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.CheckBox;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.navigation.paging.PagingNavigator;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.BookService;


public class BooksListPanel extends Panel {

	@Inject
	private BookService bookService;

	public BooksListPanel(String id) {
		super(id);
		BooksDataProvider booksDataProvider = new BooksDataProvider();
		
		////////////////////////////////////////////////////////////////
		 DataView<Book> dataView = new DataView<Book>("rows", booksDataProvider, 5) {
	            @Override
	            protected void populateItem(Item<Book> item) {
	                Book book = item.getModelObject();

	                item.add(new Label("id", book.getId()));
	                item.add(new Label("title", book.getTitle()));
	                item.add(new Label("publishing office", book.getPublishingOffice()));
//	                item.add(DateLabel.forDatePattern("created", Model.of(book.getCreated()), "dd-MM-yyyy"));

//	                item.add(new Link<Void>("edit-link") {
//	                    @Override
//	                    public void onClick() {
//	                        setResponsePage(new ProductEditPage(book));
//	                    }
//	                });
//
//	                item.add(new Link<Void>("delete-link") {
//	                    @Override
//	                    public void onClick() {
//	                        try {
//	                            productService.delete(book);
//	                        } catch (PersistenceException e) {
//	                            System.out.println("caughth persistance exception");
//	                        }
//
//	                        setResponsePage(new ProductsPage());
//	                    }
//	                });

//	                CheckBox checkbox = new CheckBox("active", Model.of(book.getActive()));
//	                checkbox.setEnabled(false);
//	                item.add(checkbox);
	            }
	        };
	        add(dataView);
//	        add(new PagingNavigator("paging", dataView));
//
//	        add(new OrderByBorder("sort-id", Product_.id, productsDataProvider));
//	        add(new OrderByBorder("sort-name", Product_.name, productsDataProvider));
//	        add(new OrderByBorder("sort-price", Product_.basePrice, productsDataProvider));

		/////////////////////////////////////////////////////////////////
	}

	private class BooksDataProvider extends SortableDataProvider<Book, Serializable> {

		private BookFilter bookFilter;

		BooksDataProvider() {
			bookFilter = new BookFilter();

			System.out.println(bookService.find(bookFilter).size());
		}

		@Override
		public Iterator<? extends Book> iterator(long first, long count) {
			List<Book> books = bookService.find(bookFilter);
			System.out.println("______________");
			System.out.println(bookService.getBook(414L).getTitle());
			return books.iterator();
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
