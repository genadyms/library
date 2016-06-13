package com.gmazurkevich.training.library.webapp.page.user;

import java.util.Arrays;

import javax.inject.Inject;

import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.PropertyModel;

import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.datamodel.UserState;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.common.UserRoleChoiceRenderer;
import com.gmazurkevich.training.library.webapp.common.UserStateChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.googlecode.wicket.kendo.ui.panel.KendoFeedbackPanel;

public class UsersEditPage extends AbstractPage {

	@Inject
	private UserService userService;

	private UserProfile userProfile;

	private UserCredentials userCredentials;

	public UsersEditPage(UserProfile userProfile, UserCredentials userCredentials) {
		super();
		this.userProfile = userProfile;
		this.userCredentials = userCredentials;
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

		DropDownChoice<UserRole> roleField = new DropDownChoice<>("role",
				new PropertyModel<UserRole>(userProfile, "role"), Arrays.asList(UserRole.values()),
				UserRoleChoiceRenderer.INSTANCE);
		roleField.setRequired(true);
		form.add(roleField);

		DropDownChoice<UserState> stateField = new DropDownChoice<>("state",
				new PropertyModel<UserState>(userProfile, "state"), Arrays.asList(UserState.values()),
				UserStateChoiceRenderer.INSTANCE);
		stateField.setRequired(true);
		form.add(stateField);

		TextField<String> phone = new TextField<>("phone", new PropertyModel<String>(userProfile, "phone"));
		phone.setRequired(true);
		form.add(phone);

		TextField<String> address = new TextField<>("address", new PropertyModel<String>(userProfile, "address"));
		address.setRequired(true);
		form.add(address);

		TextField<String> pass = new TextField<>("password", new PropertyModel<String>(userCredentials, "password"));
		pass.isRequired();
		form.add(pass);
		TextField<String> email = new TextField<>("email", new PropertyModel<String>(userCredentials, "email"));
		email.isRequired();
		form.add(email);
		if(!AuthorizedSession.get().getRoles().contains(UserRole.ADMIN.toString())) {
			pass.setVisible(false);
			email.setVisible(false);
			roleField.setEnabled(false);
		}
		form.add(new SubmitLink("save") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				if (userProfile.getId() == null) {
					userService.register(userProfile, userCredentials);
				} else {
					userService.update(userProfile);
				}
				setResponsePage(new UsersPage());
			}
		});
		add(new KendoFeedbackPanel("feedback"));
	}

}
