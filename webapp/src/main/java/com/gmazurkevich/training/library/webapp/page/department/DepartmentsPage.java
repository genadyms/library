package com.gmazurkevich.training.library.webapp.page.department;

import org.apache.wicket.markup.html.link.Link;

import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.department.panel.DepartmentsListPanel;

public class DepartmentsPage extends AbstractPage {

	public DepartmentsPage() {
		super();
		add(new DepartmentsListPanel("list-panel"));

		Link createNew = new Link("create") {
			@Override
			public void onClick() {
				setResponsePage(new DepartmentEditPage(new Department()));
			}
		};
		add(createNew);
		if (AuthorizedSession.get().getRoles() == null || !AuthorizedSession.get().getRoles().contains("ADMIN"))
			createNew.setVisibilityAllowed(false);
	}

}