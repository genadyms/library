package com.gmazurkevich.training.library.webapp.page.user;

import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.user.panel.UsersListPanel;

public class UsersPage extends AbstractPage {

    public UsersPage() {
        super();

//        UserCredentials loggedUser = AuthorizedSession.get().getLoggedUser();
//        Roles roles = AuthorizedSession.get().getRoles();

        add(new UsersListPanel("list-panel"));
    }

}
