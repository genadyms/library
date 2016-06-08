package com.gmazurkevich.training.library.webapp.page.login;

import javax.inject.Inject;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.ajax.markup.html.form.AjaxSubmitLink;
import org.apache.wicket.extensions.ajax.markup.html.modal.ModalWindow;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.PropertyModel;

import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.datamodel.UserState;
import com.gmazurkevich.training.library.service.UserService;

public class RegisterUserModalPanel extends Panel {

	@Inject
	private UserService userService;

	private UserProfile userProfile;
	private UserCredentials userCredentials;

	private ModalWindow modalWindow;

	public RegisterUserModalPanel(ModalWindow modalWindow, UserProfile userProfile, UserCredentials userCredentials) {
		super(modalWindow.getContentId());
		this.userProfile = userProfile;
		this.userCredentials = userCredentials;
		this.modalWindow = modalWindow;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		Form<?> form = new Form<Void>("form");
		add(form);

		TextField<String> firstName = new TextField<>("firstName", new PropertyModel<String>(userProfile, "firstName"));
		firstName.isRequired();
		form.add(firstName);

		TextField<String> lastName = new TextField<>("lastName", new PropertyModel<String>(userProfile, "lastName"));
		lastName.isRequired();
		form.add(lastName);

		TextField<String> address = new TextField<>("address", new PropertyModel<String>(userProfile, "address"));
		address.isRequired();
		form.add(address);

		TextField<String> phone = new TextField<>("phone", new PropertyModel<String>(userProfile, "phone"));
		phone.isRequired();
		form.add(phone);
		TextField<String> pass = new TextField<>("password", new PropertyModel<String>(userCredentials, "password"));
		pass.isRequired();
		form.add(pass);
		TextField<String> email = new TextField<>("email", new PropertyModel<String>(userCredentials, "email"));
		email.isRequired();
		form.add(email);

		add(new FeedbackPanel("feedback"));

		form.add(new AjaxSubmitLink("save") {
			@Override
			protected void onSubmit(AjaxRequestTarget target, Form<?> form) {
				super.onSubmit(target, form);
				userProfile.setRole(UserRole.READER);
				userProfile.setState(UserState.ACTIVE);
				userService.register(userProfile, userCredentials);
//				modalWindow.close(target);
			}
		});

		form.add(new AjaxLink("cancel") {
			@Override
			public void onClick(AjaxRequestTarget target) {
				modalWindow.close(target);
			}
		});
	}

}
