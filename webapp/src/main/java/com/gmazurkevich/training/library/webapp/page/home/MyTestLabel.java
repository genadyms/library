package com.gmazurkevich.training.library.webapp.page.home;

import org.apache.wicket.markup.html.basic.Label;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;

public class MyTestLabel extends Label {

	public MyTestLabel(String id, String imadel) {
		super(id, imadel);

	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		this.setVisible(!AuthorizedSession.get().isSignedIn());

	}

}
