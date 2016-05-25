package com.gmazurkevich.training.library.webapp.page.book;

import javax.inject.Inject;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.panel.BooksListPanel;


public class BooksPage extends AbstractPage {

	@Inject
	private BookService bookService;

	public BooksPage() {
		super();
		 add(new BooksListPanel("list-panel"));

//	        add(new Link("create") {
//	            @Override
//	            public void onClick() {
//	                setResponsePage(new ProductEditPage(new Product()));
//	            }
//	        });
	}

}
