package com.gmazurkevich.training.library.webapp.page.comment;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.extensions.markup.html.form.DateTextField;
import org.apache.wicket.extensions.markup.html.form.palette.Palette;
import org.apache.wicket.extensions.markup.html.form.palette.theme.DefaultTheme;
import org.apache.wicket.extensions.yui.calendar.DatePicker;
import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.model.util.CollectionModel;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.datamodel.Comment;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.service.CommentService;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.common.CatalogChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.AuthorChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.book.BookInfoPage;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;

public class CommentEditPage extends AbstractPage {
	@Inject
	private CommentService commentService;
	@Inject
	private BookService bookService;
	@Inject
	private UserService userService;

	private Comment comment;

	public CommentEditPage(Comment comment) {
		super();
		this.comment = comment;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		Form<Comment> form = new CommentForm<Comment>("form", new CompoundPropertyModel<Comment>(comment));
		add(form);

		TextField<String> contentField = new TextField<>("content");
		contentField.setRequired(true);
		form.add(contentField);

		form.add(new SubmitLink("save") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				UserProfile userProfile = userService.getProfile(AuthorizedSession.get().getLoggedUser().getId());
				comment.setUserProfile(userProfile);
				if (comment.getId() != null) {
					commentService.update(comment);
				} else {
					comment.setCreated(new Date());
					commentService.save(comment);
				}
				setResponsePage(new BookInfoPage(comment.getBook()));
			}
		});

		add(new FeedbackPanel("feedback"));
	}

	private class CommentForm<T> extends Form<T> {

		public CommentForm(String id, IModel<T> model) {
			super(id, model);
		}
	}

}
