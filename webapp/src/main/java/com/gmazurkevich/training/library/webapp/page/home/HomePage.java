package com.gmazurkevich.training.library.webapp.page.home;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.model.Model;

import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.component.catalog.CatalogPanel;
import com.gmazurkevich.training.library.webapp.component.localization.LanguageSelectionComponent;
import com.gmazurkevich.training.library.webapp.component.login.LoginPanel;
import com.gmazurkevich.training.library.webapp.component.menu.MenuPanel;
import com.gmazurkevich.training.library.webapp.component.menu.MenuPanelLoggedUser;
import com.gmazurkevich.training.library.webapp.component.search.SearchPanel;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class HomePage extends AbstractPage {

	public HomePage() {
		super();
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		add(new CatalogPanel("catalog-panel"));
		add(new SearchPanel("search-panel"));
		LoginPanel loginPanel = new LoginPanel("login-panel");
		add(loginPanel);
//		if(AuthorizedSession.get().isSignedIn()) {
//			loginPanel.setVisible(false);
//		}
	}

	private void incrementAndUpdate(Model<Integer> counterModel, Label label, AjaxRequestTarget target) {
		counterModel.setObject(counterModel.getObject() + 1);
		target.add(label);

	}

}
