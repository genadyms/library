package com.gmazurkevich.training.library.webapp.page.comment;

import javax.inject.Inject;

import com.gmazurkevich.training.library.service.CommentService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class NewCommentPage extends AbstractPage{
	@Inject
	private CommentService commentService;

	public NewCommentPage() {
	        super();

	        System.out.print("commentService = "+commentService);
	    }
}
