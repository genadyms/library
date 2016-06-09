package com.gmazurkevich.training.library.webapp.page.copybook;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.copybook.panel.CopyBooksListPanel;

public class CopyBooksPage extends AbstractPage {
	private static final long serialVersionUID = 1L;
	private Book book;

	public CopyBooksPage(Book book) {
		super();
		this.book = book;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		add(new CopyBooksListPanel("list-panel", book));

		add(new Link("create") {
			@Override
			public void onClick() {
				CopyBook newCopyBook = new CopyBook();
				newCopyBook.setBook(book);
				setResponsePage(new CopyBookEditPage(newCopyBook));
			}
		});
	}

}