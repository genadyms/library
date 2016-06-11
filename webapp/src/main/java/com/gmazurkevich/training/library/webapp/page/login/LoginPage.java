package com.gmazurkevich.training.library.webapp.page.login;

import org.apache.wicket.Application;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.util.string.Strings;

import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class LoginPage extends AbstractPage {

	private static final long serialVersionUID = 1L;
	private UserProfile userProfile;

	public LoginPage() {
		super();
	}

	public LoginPage(UserProfile userProfile) {
		this();
		this.userProfile = userProfile;
	}

	private String username;
	private String password;

	@Override
	protected void onInitialize() {
		super.onInitialize();
		if (AuthenticatedWebSession.get().isSignedIn()) {
			setResponsePage(Application.get().getHomePage());
		}
		boolean isRegisteredUser = userProfile != null;
		Label greeting = new Label("hello-user");
		greeting.setVisible(isRegisteredUser);
		add(greeting);
		if(isRegisteredUser){
			greeting.setDefaultModel
			(Model.of(String.format("hello %s, you are registered!", userProfile.getFirstName())));
		}
		final Form<Void> form = new Form<Void>("form");
		form.setDefaultModel(new CompoundPropertyModel<LoginPage>(this));
		form.add(new RequiredTextField<String>("username"));
		form.add(new PasswordTextField("password"));
		form.add(new SubmitLink("submit-btn") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				if (Strings.isEmpty(username) || Strings.isEmpty(password)) {
					return;
				}
				final boolean authResult = AuthenticatedWebSession.get().signIn(username, password);
				if (authResult) {
					setResponsePage(Application.get().getHomePage());
				} else {
					error("authorization error");
				}
			}
		});
		add(form);
	}

}