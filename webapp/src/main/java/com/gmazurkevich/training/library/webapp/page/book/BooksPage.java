package com.gmazurkevich.training.library.webapp.page.book;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.panel.BooksListPanel;

public class BooksPage extends AbstractPage {

	public BooksPage() {
		super();
		add(new BooksListPanel("list-panel"));

		add(new Link("create") {
			@Override
			public void onClick() {
				setResponsePage(new BookEditPage(new Book()));
			}
		});
	}

}