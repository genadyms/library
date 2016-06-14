package com.gmazurkevich.training.library.webapp.page.issue;

import java.util.Date;

import javax.inject.Inject;

import org.apache.wicket.markup.html.basic.Label;

import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.IssueService;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class IssueEditPage extends AbstractPage {
	@Inject
	private CopyBookService copyBookService;
	
	@Inject
	private IssueService issueService;

	private CopyBook copyBook;

	private UserProfile reader;
	
	private Issue issue;
	
	private static final long serialVersionUID = 1L;

	public IssueEditPage(CopyBook copyBook, UserProfile reader) {
//		this.copyBook = copyBookService.fetchAll(copyBook.getId());
		this.reader=reader;
		issue = new Issue();
		issue.setCopyBook(copyBook);
		issue.setReader(reader);
		issue.setDateTake(new Date());
		issue.setPlannedDateReturn(new Date());
		issueService.save(issue);
	}
	@Override
	protected void onInitialize() {
		super.onInitialize();
		add(new Label("info", "issue has been maked"));
		add(new Label("reader-name", reader.getFirstName()));
		add(new Label("issued-date", issue.getDateTake().toString()));
		add(new Label("planned-date", issue.getPlannedDateReturn().toString()));
	}

}
