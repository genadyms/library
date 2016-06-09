package com.gmazurkevich.training.library.webapp.page.book;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Comment;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.comment.CommentEditPage;
import com.gmazurkevich.training.library.webapp.page.comment.panel.CommentListPanel;

public class BookInfoPage extends AbstractPage {
	private Book book;

	public BookInfoPage(Book book) {
		this.book = book;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		add(new Label("title", book.getTitle()));
		add(new CommentListPanel("list-panel", book));

		Link createNew = new Link("create") {
			@Override
			public void onClick() {
				Comment comment = new Comment();
				comment.setBook(book);
				setResponsePage(new CommentEditPage(comment));
			}
		};
		add(createNew);
		if (AuthorizedSession.get().getRoles() == null || !AuthorizedSession.get().getRoles().contains("ADMIN"))
			createNew.setVisibilityAllowed(false);
	}
}