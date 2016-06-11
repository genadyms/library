package com.gmazurkevich.training.library.webapp.component.menu;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.catalog.CatalogsPage;
import com.gmazurkevich.training.library.webapp.page.comment.CommentsPage;
import com.gmazurkevich.training.library.webapp.page.copybook.CopyBooksPage;
import com.gmazurkevich.training.library.webapp.page.issue.IssuePage;
import com.gmazurkevich.training.library.webapp.page.issue.IssuesPage;
import com.gmazurkevich.training.library.webapp.page.login.LoginPage;
import com.gmazurkevich.training.library.webapp.page.orders.OrdersPage;
import com.gmazurkevich.training.library.webapp.page.user.UsersPage;

public class MenuPanelLoggedUser extends MenuPanel {

	public MenuPanelLoggedUser(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		// add(new Link("link-copybooks") {
		// @Override
		// public void onClick() {
		// setResponsePage(new CopyBooksPage());
		// }
		// });

		add(new Link("link-comments") {
			@Override
			public void onClick() {
				setResponsePage(new CommentsPage());
			}
		});

		add(new Link("link-orders") {
			@Override
			public void onClick() {
				setResponsePage(new OrdersPage());
			}
		});
		add(new Link("link-issue") {
			@Override
			public void onClick() {
				setResponsePage(new IssuesPage());
			}
		});
		Link linkUsers = new Link("link-users") {
			@Override
			public void onClick() {
				setResponsePage(new UsersPage());
			}
		};
		add(linkUsers);
		linkUsers.setVisible(AuthorizedSession.get().getRoles().contains(UserRole.ADMIN.toString())
				|| AuthorizedSession.get().getRoles().contains(UserRole.LIBRARIAN.toString()));
		Link link = new Link("link-logout") {
			@Override
			public void onClick() {
				getSession().invalidate();
				setResponsePage(LoginPage.class);
			}
		};
		link.setVisible(AuthorizedSession.get().isSignedIn());
		add(link);
	}
}
