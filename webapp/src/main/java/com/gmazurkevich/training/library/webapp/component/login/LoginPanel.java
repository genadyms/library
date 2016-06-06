package com.gmazurkevich.training.library.webapp.component.login;

import org.apache.wicket.Application;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.util.string.Strings;

import com.gmazurkevich.training.library.webapp.page.login.LoginPage;

public class LoginPanel extends Panel {

	public LoginPanel(String id) {
		super(id);
	}

//	@Override
//	protected void onInitialize() {
//		super.onInitialize();
//		LoginPage loginPage = (LoginPage) this.getPage();
//		String username = loginPage.username;
//		String password = loginPage.password;
//		final Form<Void> form = new Form<Void>("form");
//		form.setDefaultModel(new CompoundPropertyModel<LoginPage>(loginPage));
//		form.add(new RequiredTextField<String>("username"));
//		form.add(new PasswordTextField("password"));
//
//		form.add(new SubmitLink("submit-btn") {
//			@Override
//			public void onSubmit() {
//				super.onSubmit();
//				
//				if (Strings.isEmpty(username) || Strings.isEmpty(password)) {
//					System.out.println("heare im");
//					return;
//				}
//				final boolean authResult = AuthenticatedWebSession.get().signIn(username, password);
//				if (authResult) {
//					// continueToOriginalDestination();
//					setResponsePage(Application.get().getHomePage());
//				} else {
//					error("authorization error");
//				}
//			}
//		});
//		add(form);
//	}

}
