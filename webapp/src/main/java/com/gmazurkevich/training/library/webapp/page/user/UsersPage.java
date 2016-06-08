package com.gmazurkevich.training.library.webapp.page.user;

import org.apache.wicket.authroles.authorization.strategies.role.annotations.AuthorizeInstantiation;
import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.app.WicketApplication;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.BookEditPage;
import com.gmazurkevich.training.library.webapp.page.user.panel.UsersListPanel;

@AuthorizeInstantiation(value = { "ADMIN", "LIBRARIAN" })
public class UsersPage extends AbstractPage {

	public UsersPage() {
		super();

		// UserCredentials loggedUser = AuthorizedSession.get().getLoggedUser();
		// Roles roles = AuthorizedSession.get().getRoles();

		add(new UsersListPanel("list-panel"));
		add(new Link("create") {
			@Override
			public void onClick() {
				setResponsePage(new UsersEditPage(new UserProfile(), new UserCredentials()));
			}
		});
		
	}

}
