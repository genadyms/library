package com.gmazurkevich.training.library.webapp.page.issue;

import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.issue.panel.IssueListPanel;

public class IssuesPage extends AbstractPage {

	private static final long serialVersionUID = 1L;

	public IssuesPage() {
		super();
		add(new IssueListPanel("list-panel"));
	}
}
