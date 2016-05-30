package com.gmazurkevich.training.library.webapp.common;

import org.apache.wicket.markup.html.form.ChoiceRenderer;

import com.gmazurkevich.training.library.datamodel.UserRole;

public class UserRoleChoiceRenderer extends ChoiceRenderer<UserRole> {

	public static final UserRoleChoiceRenderer INSTANCE = new UserRoleChoiceRenderer();

	private UserRoleChoiceRenderer() {
		super();
	}

	@Override
	public Object getDisplayValue(UserRole object) {
		return object.name();
	}

	@Override
	public String getIdValue(UserRole object, int index) {
		return String.valueOf(object.ordinal());
	}
}
