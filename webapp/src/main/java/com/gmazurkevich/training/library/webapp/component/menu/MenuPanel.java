package com.gmazurkevich.training.library.webapp.component.menu;

import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.panel.Panel;

import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;
import com.gmazurkevich.training.library.webapp.page.department.DepartmentsPage;
import com.gmazurkevich.training.library.webapp.page.home.HomePage;
import com.gmazurkevich.training.library.webapp.page.login.LoginPage;

public class MenuPanel extends Panel {

	public MenuPanel(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		add(new Link("link-home") {
			@Override
			public void onClick() {
				setResponsePage(new HomePage());
			}
		});

		add(new Link("link-books") {
			@Override
			public void onClick() {
				setResponsePage(new BooksPage());
			}
		});

		add(new Link("link-departments") {
			@Override
			public void onClick() {
				setResponsePage(new DepartmentsPage());
			}
		});

		Link link = new Link("link-login") {
			@Override
			public void onClick() {
				setResponsePage(new LoginPage());
			}
		};
		add(link);
		link.setVisible(!AuthorizedSession.get().isSignedIn());
	}
}