package com.gmazurkevich.training.library.webapp.component.menu;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.webapp.page.home.HomePage;

public class MenuPanelLoggedUser extends MenuPanel {

    public MenuPanelLoggedUser(String id) {
        super(id);
    }

    @Override
    protected void onInitialize() {
        super.onInitialize();

        add(new Link("link-logout") {
            @Override
            public void onClick() {
                setResponsePage(new HomePage());
            }
        });
    }
}
