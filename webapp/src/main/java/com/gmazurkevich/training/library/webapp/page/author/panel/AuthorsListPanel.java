package com.gmazurkevich.training.library.webapp.page.author.panel;

import java.io.Serializable;
import java.util.Iterator;

import javax.inject.Inject;
import javax.persistence.metamodel.SingularAttribute;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.extensions.ajax.markup.html.modal.ModalWindow;
import org.apache.wicket.extensions.markup.html.repeater.data.sort.OrderByBorder;
import org.apache.wicket.extensions.markup.html.repeater.data.sort.SortOrder;
import org.apache.wicket.extensions.markup.html.repeater.util.SortableDataProvider;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.navigation.paging.PagingNavigator;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;

import com.gmazurkevich.training.library.dataaccess.filters.AuthorFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Author_;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.exception.DeleteAuthorWithBooksException;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.author.AuthorEditPanel;
import com.gmazurkevich.training.library.webapp.page.author.AuthorsPage;

public class AuthorsListPanel extends Panel {

	private static final long serialVersionUID = 1L;
	@Inject
	private AuthorService service;

	public AuthorsListPanel(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		

		AuthorsDataProvider authorsDataProvider = new AuthorsDataProvider();
		DataView<Author> dataView = new DataView<Author>("rows", authorsDataProvider, 5) {
			@Override
			protected void populateItem(Item<Author> item) {
				ModalWindow modalWindow = ((AuthorsPage) this.getPage()).modalWindow;
				Author author = item.getModelObject();
				item.add(new Label("id", author.getId()));
				item.add(new Label("firstName", author.getFirstName()));
				item.add(new Label("secondName", author.getSecondName()));
				AjaxLink editLink = new AjaxLink("edit") {
					@Override
					public void onClick(AjaxRequestTarget target) {
						
						modalWindow.setContent(new AuthorEditPanel(modalWindow, author));
						modalWindow.show(target);
					}
				};
				editLink.setVisible(false);
				item.add(editLink);
				AjaxLink deleteLink = new AjaxLink("delete") {
					@Override
					public void onClick(AjaxRequestTarget target) {
						try {
							service.delete(author);
							setResponsePage(this.getPage());
						} catch (DeleteAuthorWithBooksException e) {
							modalWindow.setContent(new AuthorEditPanel(modalWindow, author));
						}
					}
				};
				deleteLink.setVisible(false);
				item.add(deleteLink);
				
				if (null!=AuthorizedSession.get().getRoles()&&AuthorizedSession.get().getRoles().contains("admin")) {
					editLink.setVisible(true);
					deleteLink.setVisible(true);
				}
			}
		};
		add(dataView);
		add(new PagingNavigator("paging", dataView));

		add(new OrderByBorder("sort-id", Author_.id, authorsDataProvider));
		add(new OrderByBorder("sort-fname", Author_.firstName, authorsDataProvider));
		add(new OrderByBorder("sort-lname", Author_.secondName, authorsDataProvider));

	}

	private class AuthorsDataProvider extends SortableDataProvider<Author, Serializable> {

		private AuthorFilter filter;

		public AuthorsDataProvider() {
			super();
			filter = new AuthorFilter();
			setSort((Serializable) Author_.id, SortOrder.ASCENDING);
		}

		@Override
		public Iterator<Author> iterator(long first, long count) {
			Serializable property = getSort().getProperty();
			SortOrder propertySortOrder = getSortState().getPropertySortOrder(property);

			filter.setSortProperty((SingularAttribute) property);
			filter.setSortOrder(propertySortOrder.equals(SortOrder.ASCENDING) ? true : false);

			filter.setLimit((int) count);
			filter.setOffset((int) first);
			return service.find(filter).iterator();
		}

		@Override
		public long size() {
			return service.count(filter);
		}

		@Override
		public IModel<Author> model(Author object) {
			return new Model<Author>(object);
		}

	}

}
