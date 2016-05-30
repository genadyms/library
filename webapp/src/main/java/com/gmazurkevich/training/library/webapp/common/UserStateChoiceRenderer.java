package com.gmazurkevich.training.library.webapp.common;

import org.apache.wicket.markup.html.form.ChoiceRenderer;

import com.gmazurkevich.training.library.datamodel.UserState;

public class UserStateChoiceRenderer extends ChoiceRenderer<UserState> {

	public static final UserStateChoiceRenderer INSTANCE = new UserStateChoiceRenderer();

	private UserStateChoiceRenderer() {
		super();
	}

	@Override
	public Object getDisplayValue(UserState object) {
		return object.name();
	}

	@Override
	public String getIdValue(UserState object, int index) {
		return String.valueOf(object.ordinal());
	}
}