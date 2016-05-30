package com.gmazurkevich.training.library.webapp.page.user;

import java.util.Arrays;

import javax.inject.Inject;

import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.CompoundPropertyModel;

import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.datamodel.UserState;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.webapp.common.UserRoleChoiceRenderer;
import com.gmazurkevich.training.library.webapp.common.UserStateChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class UsersEditPage extends AbstractPage {

	@Inject
	private UserService userService;

	private UserProfile profile;
	
	private UserCredentials credentials;

	public UsersEditPage(UserProfile user) {
        super();
        this.profile = user;
        this.credentials = this.profile.getUserCredentials();
    }

	@Override
	protected void onInitialize() {
		super.onInitialize();

		Form<UserProfile> form = new Form<UserProfile>("form", new CompoundPropertyModel<UserProfile>(profile));
		add(form);

		TextField<String> firstNameField = new TextField<>("firstName");
		firstNameField.setRequired(true);
		firstNameField.setEnabled(false);
		form.add(firstNameField);

		TextField<String> lastNameField = new TextField<>("lastName");
		lastNameField.setRequired(true);
		lastNameField.setEnabled(false);
		form.add(lastNameField);

		DropDownChoice<UserRole> roleField = new DropDownChoice<>("role", Arrays.asList(UserRole.values()),
				UserRoleChoiceRenderer.INSTANCE);
		roleField.setRequired(true);
		form.add(roleField);

		DropDownChoice<UserState> stateField = new DropDownChoice<>("state", Arrays.asList(UserState.values()),
				UserStateChoiceRenderer.INSTANCE);
		stateField.setRequired(true);
		form.add(stateField);

		TextField<String> phoneField = new TextField<>("phone");
		phoneField.setRequired(true);
		// titleField.setEnabled(false);
		form.add(phoneField);

		TextField<String> addressField = new TextField<>("address");
		addressField.setRequired(true);
		// titleField.setEnabled(false);
		form.add(addressField);


		form.add(new SubmitLink("save") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				userService.update(profile);
				setResponsePage(new UsersPage());
			}
		});

		add(new FeedbackPanel("feedback"));
	}

}
