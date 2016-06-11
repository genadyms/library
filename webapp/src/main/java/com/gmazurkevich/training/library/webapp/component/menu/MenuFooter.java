package com.gmazurkevich.training.library.webapp.component.menu;

import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.panel.Panel;

import com.gmazurkevich.training.library.webapp.page.department.DepartmentsPage;
import com.gmazurkevich.training.library.webapp.page.home.HomePage;

public class MenuFooter  extends Panel {

	public MenuFooter(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		add(new Link("link-home") {
			@Override
			public void onClick() {
				setResponsePage(new HomePage());
			}
		});
		add(new Link("link-departments") {
			@Override
			public void onClick() {
				setResponsePage(new DepartmentsPage());
			}
		});
	}
}