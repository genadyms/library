package com.gmazurkevich.training.library.webapp.page.comment.panel;

import java.io.Serializable;
import java.util.Iterator;

import javax.inject.Inject;
import javax.persistence.metamodel.SingularAttribute;

import org.apache.wicket.extensions.markup.html.repeater.data.sort.SortOrder;
import org.apache.wicket.extensions.markup.html.repeater.util.SortableDataProvider;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;

import com.gmazurkevich.training.library.dataaccess.filters.CommentFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Comment;
import com.gmazurkevich.training.library.datamodel.Department_;
import com.gmazurkevich.training.library.service.CommentService;
import com.gmazurkevich.training.library.webapp.page.book.BookInfoPage;
import com.gmazurkevich.training.library.webapp.page.comment.CommentEditPage;

public class CommentListPanel extends Panel {
	@Inject
	private CommentService commentService;
	private Book book;
	private static final long serialVersionUID = 1L;

	public CommentListPanel(String id) {
		super(id);
	}

	public CommentListPanel(String id, Book book) {
		super(id);
		this.book = book;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		CommentsDataProvider commentDataProvider = new CommentsDataProvider();
		DataView<Comment> dataView = new DataView<Comment>("rows", commentDataProvider, 5) {
			@Override
			protected void populateItem(Item<Comment> item) {
				Comment currentComment = item.getModelObject();
				item.add(new Label("id", currentComment.getId()));
				item.add(new Label("content", currentComment.getContent()));
				item.add(new Label("date", currentComment.getCreated().toString()));
				item.add(new Label("like", currentComment.getLike()));
				item.add(new Label("dislike", currentComment.getDislike()));

				item.add(new Link<Void>("edit-link") {
					@Override
					public void onClick() {
						currentComment.setBook(book);
						setResponsePage(new CommentEditPage(currentComment));
					}
				});

				item.add(new Link<Void>("delete-link") {
					@Override
					public void onClick() {
						commentService.delete(currentComment.getId());
						setResponsePage(BookInfoPage.class);
					}
				});

			}
		};
		add(dataView);
		// add(new PagingNavigator("paging", dataView));
		//
		// add(new OrderByBorder("sort-id", Department_.id,
		// commentDataProvider));
		// add(new OrderByBorder("sort-name", Department_.name,
		// commentDataProvider));
		// add(new OrderByBorder("sort-type", Department_.type,
		// commentDataProvider));
		// add(new OrderByBorder("sort-address", Department_.address,
		// commentDataProvider));
	}

	private class CommentsDataProvider extends SortableDataProvider<Comment, Serializable> {

		private CommentFilter commentFilter;

		public CommentsDataProvider() {
			super();
			commentFilter = new CommentFilter();
			if(book!=null) commentFilter.setBook(book);
			setSort((Serializable) Department_.name, SortOrder.ASCENDING);
		}

		@Override
		public Iterator<Comment> iterator(long first, long count) {
			Serializable property = getSort().getProperty();
			SortOrder propertySortOrder = getSortState().getPropertySortOrder(property);

			commentFilter.setSortProperty((SingularAttribute) property);
			commentFilter.setSortOrder(propertySortOrder.equals(SortOrder.ASCENDING) ? true : false);

			commentFilter.setLimit((int) count);
			commentFilter.setOffset((int) first);
			return commentService.find(commentFilter).iterator();
		}

		@Override
		public long size() {
			return commentService.count(commentFilter);
		}

		@Override
		public IModel<Comment> model(Comment object) {
			return new Model(object);
		}
	}
}
