package com.gmazurkevich.training.library.webapp.component.menu;

import org.apache.wicket.authroles.authorization.strategies.role.annotations.AuthorizeAction;
import org.apache.wicket.markup.html.panel.Panel;

@AuthorizeAction( roles ={"ADMIN"}, action = org.apache.wicket.authorization.Action.RENDER )
public class MenuBooksAdminPanel extends Panel {

	public MenuBooksAdminPanel(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		// add(new Label("test-label"));

		// add(new Link("link-home") {
		// @Override
		// public void onClick() {
		// setResponsePage(new HomePage());
		// }
		// });
		//
		// add(new Link("link-books") {
		// @Override
		// public void onClick() {
		// setResponsePage(new BooksPage());
		// }
		// });
		//
		//
		// add(new Link("link-departments") {
		// @Override
		// public void onClick() {
		// setResponsePage(new DepartmentsPage());
		// }
		// });
		//
		// Link link = new Link("link-login") {
		// @Override
		// public void onClick() {
		// setResponsePage(new LoginPage());
		// }
		// };
		// add(link);
		// link.setVisible(!AuthorizedSession.get().isSignedIn());
	}

}
