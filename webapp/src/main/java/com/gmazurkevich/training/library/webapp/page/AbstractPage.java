package com.gmazurkevich.training.library.webapp.page;

import org.apache.wicket.Application;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.component.localization.LanguageSelectionComponent;
import com.gmazurkevich.training.library.webapp.component.menu.MenuPanel;
import com.gmazurkevich.training.library.webapp.component.menu.MenuPanelLoggedUser;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;
import com.gmazurkevich.training.library.webapp.page.home.HomePage;

public abstract class AbstractPage extends WebPage {

    public AbstractPage() {
        super();
    }

    public AbstractPage(PageParameters parameters) {
        super(parameters);
    }

    @Override
    protected void onInitialize() {
        super.onInitialize();
        add(new LanguageSelectionComponent("language-select"));
        if (AuthorizedSession.get().isSignedIn()) {
            add(new MenuPanelLoggedUser("menu-panel"));
        } else {
            add(new MenuPanel("menu-panel"));
        }

    }

}
