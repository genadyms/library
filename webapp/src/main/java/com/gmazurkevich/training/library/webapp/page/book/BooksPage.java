package com.gmazurkevich.training.library.webapp.page.book;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.panel.BooksListPanel;

public class BooksPage extends AbstractPage {

	public BooksPage() {
		super();
		add(new BooksListPanel("list-panel"));

		Link createNew = new Link("create") {
			@Override
			public void onClick() {
				setResponsePage(new BookEditPage(new Book()));
			}
		};
		add(createNew);
		if	(AuthorizedSession.get().getRoles()==null ||!AuthorizedSession.get().getRoles().contains("ADMIN")) createNew.setVisibilityAllowed(false);
	}

}