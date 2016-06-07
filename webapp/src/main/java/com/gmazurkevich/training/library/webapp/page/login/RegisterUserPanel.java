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

import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.datamodel.UserState;
import com.gmazurkevich.training.library.service.UserService;

public class RegisterUserPanel extends Panel {

	@Inject
	private UserService userService;

	private UserProfile userProfile;

	private ModalWindow modalWindow;

	public RegisterUserPanel(ModalWindow modalWindow, UserProfile userProfile) {
		super(modalWindow.getContentId());
		this.userProfile = userProfile;
		this.modalWindow = modalWindow;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		Form<UserProfile> form = new Form<>("form", new CompoundPropertyModel<>(userProfile));
		add(form);
		
		TextField firstName = new TextField<>("firstName");
		firstName.isRequired();
		form.add(firstName);

		TextField lastName = new TextField<>("lastName");
		lastName.isRequired();
		form.add(lastName);
		

		TextField address = new TextField<>("address");
		address.isRequired();
		form.add(address);

		TextField phone = new TextField<>("phone");
		phone.isRequired();
		form.add(phone);
		
//		TextField email = new TextField<>("userProfile.userCredentials.email");
//		email.isRequired();
//		form.add(email);
//
//		TextField pass = new TextField<>("userProfile.userCredentials.password");
//		pass.isRequired();
//		form.add(pass);
		
		add(new FeedbackPanel("feedback"));

		form.add(new AjaxSubmitLink("save") {
			@Override
			protected void onSubmit(AjaxRequestTarget target, Form<?> form) {
				super.onSubmit(target, form);
				UserCredentials userCreden = new UserCredentials();
//				userCreden.setEmail("t1est");
//				userCreden.setPassword("t1est");
				userProfile.setRole(UserRole.READER);
				userProfile.setState(UserState.ACTIVE);
				userService.register(userProfile, userCreden);
				modalWindow.close(target);
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
