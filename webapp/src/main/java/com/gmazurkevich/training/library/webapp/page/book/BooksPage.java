package com.gmazurkevich.training.library.webapp.page.book;

import java.awt.Panel;

import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.request.mapper.parameter.PageParameters;
import org.apache.wicket.util.string.StringValue;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.panel.BooksListPanel;

public class BooksPage extends AbstractPage {
	private PageParameters parameters;

	public BooksPage(PageParameters parameters) {
		this.parameters = parameters;
	}

	public BooksPage() {
		super();

	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		BooksListPanel blPanel = new BooksListPanel("list-panel");
		if(parameters!=null) {
			StringValue catalog = parameters.get("catalog");
			if(catalog!=null) {
				blPanel.setCatalogId(catalog.toLong());
			}
		}
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