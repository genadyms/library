package com.gmazurkevich.training.library.webapp.page.copybook;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.copybook.panel.CopyBooksListPanel;

public class CopyBooksPage extends AbstractPage {

	public  CopyBooksPage() {
		super();
		add(new CopyBooksListPanel("list-panel"));

		add(new Link("create") {
			@Override
			public void onClick() {
				setResponsePage(new CopyBookEditPage(new CopyBook()));
			}
		});
	}

}