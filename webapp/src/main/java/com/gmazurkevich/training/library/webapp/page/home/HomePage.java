package com.gmazurkevich.training.library.webapp.page.home;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.DefaultWizardPage;
import com.gmazurkevich.training.library.webapp.page.FeedbackPanelPage;

public class HomePage extends AbstractPage {
	private static final long serialVersionUID = 1L;
	public HomePage() {
		super();
		add(new Link("link-test") {
			@Override
			public void onClick() {
				setResponsePage(new DefaultWizardPage());
			}
		});
//		add(new Link("link-test2") {
//			@Override
//			public void onClick() {
//				setResponsePage(new DefaultMultiSelectPage ());
//			}
//		});
	}
}
