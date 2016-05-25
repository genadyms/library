package com.gmazurkevich.training.library.webapp.page;

import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.request.mapper.parameter.PageParameters;

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
        if (getPage().getClass().equals(HomePage.class)) {
            add(new MenuPanel("menu-panel"));
        } else {
            add(new MenuPanelLoggedUser("menu-panel"));
        }

    }

}
