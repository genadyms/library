package com.gmazurkevich.training.library.webapp.page.book;

import java.util.List;
import java.util.Set;

import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.request.mapper.parameter.PageParameters;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.panel.BooksListPanel;

public class BooksPage extends AbstractPage {
	private BooksListPanel bookListPanel;
	private final static String ID_LIST_PANEL = "list-panel";

	public BooksPage(PageParameters parameters) {
		this.bookListPanel = getBookListPanel(parameters);
	}

	public BooksPage() {
		super();
		this.bookListPanel = new BooksListPanel(ID_LIST_PANEL);
	}

	private BooksListPanel getBookListPanel(PageParameters parameters) {
		if (null!=parameters||(!parameters.isEmpty())) {
			Set<String> keys = parameters.getNamedKeys();
			if (keys.contains("catalog")) {
				return new BooksListPanel(ID_LIST_PANEL, parameters.get("catalog").toLong());
			}
			if (keys.contains("find")) {
				return new BooksListPanel(ID_LIST_PANEL, parameters.get("find").toString());
			}
		}
		return new BooksListPanel(ID_LIST_PANEL);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		add(bookListPanel);
		Link createNew = new Link("create") {
			@Override
			public void onClick() {
				setResponsePage(new BookEditPage(new Book()));
			}
		};
		add(createNew);
		if (AuthorizedSession.get().getRoles() == null || !AuthorizedSession.get().getRoles().contains("ADMIN"))
			createNew.setVisibilityAllowed(false);

	}
}