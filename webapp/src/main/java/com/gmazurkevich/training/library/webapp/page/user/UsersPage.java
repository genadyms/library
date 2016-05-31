package com.gmazurkevich.training.library.webapp.page.user;

import org.apache.wicket.authroles.authorization.strategies.role.annotations.AuthorizeInstantiation;
import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.user.panel.UsersListPanel;

@AuthorizeInstantiation(value = { "ADMIN"})
public class UsersPage extends AbstractPage {

    public UsersPage() {
        super();

//        UserCredentials loggedUser = AuthorizedSession.get().getLoggedUser();
//        Roles roles = AuthorizedSession.get().getRoles();

        add(new UsersListPanel("list-panel"));
       
    }

}
