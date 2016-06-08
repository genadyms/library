package com.gmazurkevich.training.library.webapp.page.login;

import javax.inject.Inject;

import org.apache.wicket.Application;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.extensions.ajax.markup.html.modal.ModalWindow;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.util.string.Strings;

import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class LoginPage extends AbstractPage {

	@Inject
	private UserService userService;

	public LoginPage() {
		super();
	}

	private String username;
	private String password;

	@Override
	protected void onInitialize() {
		super.onInitialize();
		// if already logged then should not see login page at all
		if (AuthenticatedWebSession.get().isSignedIn()) {
			setResponsePage(Application.get().getHomePage());
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
		addModalWindow();
	}

	private void addModalWindow() {
		ModalWindow modalWindow = new ModalWindow("modal");
		add(modalWindow);

		add(new AjaxLink("create") {
			@Override
			public void onClick(AjaxRequestTarget target) {
				modalWindow
						.setContent(new RegisterUserModalPanel(modalWindow, new UserProfile(), new UserCredentials()));
				modalWindow.show(target);
			}
		});

	}
}