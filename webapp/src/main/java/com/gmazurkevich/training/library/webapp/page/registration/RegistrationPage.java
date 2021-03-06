package com.gmazurkevich.training.library.webapp.page.registration;

import javax.inject.Inject;

import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextArea;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.PropertyModel;

import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.datamodel.UserState;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.home.HomePage;
import com.gmazurkevich.training.library.webapp.page.login.LoginPage;
import com.googlecode.wicket.jquery.core.Options;
import com.googlecode.wicket.kendo.ui.panel.KendoFeedbackPanel;

public class RegistrationPage extends AbstractPage {
	private static final long serialVersionUID = 1L;
	@Inject
	private UserService userService;
	private UserProfile userProfile;
	private UserCredentials userCredentials;

	public RegistrationPage() {
		super();
		userProfile = new UserProfile();
		userProfile.setRole(UserRole.READER);
		userProfile.setState(UserState.NOT_ACTIVE);
		userCredentials = new UserCredentials();
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		Form<?> form = new Form<Void>("form");
		add(form);
		TextField<String> firstNameField = new TextField<>("firstName",
				new PropertyModel<String>(userProfile, "firstName"));
		firstNameField.setRequired(true);
		form.add(firstNameField);
		TextField<String> lastName = new TextField<>("lastName", new PropertyModel<String>(userProfile, "lastName"));
		lastName.setRequired(true);
		form.add(lastName);
		TextField<String> email = new TextField<>("email", new PropertyModel<String>(userCredentials, "email"));
		email.isRequired();
		form.add(email);
		PasswordTextField pass = new PasswordTextField("password",
				new PropertyModel<String>(userCredentials, "password"));
		pass.isRequired();
		form.add(pass);
		TextField<String> phone = new TextField<>("phone", new PropertyModel<String>(userProfile, "phone"));
		phone.setRequired(true);
		form.add(phone);
		TextArea<String> address = new TextArea<>("address", new PropertyModel<String>(userProfile, "address"));
		address.setRequired(true);
		form.add(address);

		final KendoFeedbackPanel feedbackPanel = new KendoFeedbackPanel("feedback");
		add(new KendoFeedbackPanel("feedback"));
		form.add(new SubmitLink("save") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onSubmit() {
				super.onSubmit();
				String phoneInput = phone.getInput().replaceAll("-", "").replaceAll(")", "").replace("(", "");
				if (Integer.valueOf(phoneInput) < 0) {
					feedbackPanel.error("phone number is not validate!");
				}
				try {

					userService.register(userProfile, userCredentials);
					String message = String.format("You are registered succesfull, %s!", userProfile.getFirstName());
					setResponsePage(new LoginPage(message));
				} catch (javax.persistence.PersistenceException e) {
					feedbackPanel.error("email or password allready use");
				}
			}
		});

	}
}
