package com.gmazurkevich.training.library.webapp.page.copybook.panel;

import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;

import javax.inject.Inject;
import javax.persistence.metamodel.SingularAttribute;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.extensions.markup.html.repeater.data.sort.OrderByBorder;
import org.apache.wicket.extensions.markup.html.repeater.data.sort.SortOrder;
import org.apache.wicket.extensions.markup.html.repeater.util.SortableDataProvider;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.navigation.paging.PagingNavigator;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.CopyBook_;
import com.gmazurkevich.training.library.datamodel.DepartmentType;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.service.util.NextDateUtil;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.copybook.CopyBookEditPanel;
import com.gmazurkevich.training.library.webapp.page.copybook.CopyBooksPage;
import com.gmazurkevich.training.library.webapp.page.orders.OrderEditPage;

public class CopyBooksListPanel extends Panel {
	private static final long serialVersionUID = 1L;
	@Inject
	private CopyBookService copyBookService;
	@Inject
	private UserService userService;
	
	private Book book;

	public CopyBooksListPanel(String id) {
		super(id);
	}
	public CopyBooksListPanel(String id, Book book) {
		super(id);
		this.book=book;
	}
	@Override
	protected void onInitialize() {
		super.onInitialize();
		CopyBooksDataProvider copyBooksDataProvider = new CopyBooksDataProvider();
		DataView<CopyBook> dataView = new DataView<CopyBook>("rows", copyBooksDataProvider, 5) {

			@Override
			protected void populateItem(Item<CopyBook> item) {
				CopyBooksPage currentPage = (CopyBooksPage) this.getPage();
				CopyBook copyBook = item.getModelObject();
				Date freeDateFrom = copyBookService.getFreeDateFrom(copyBook);
				Order order = buildOrder(freeDateFrom, copyBook); 
				item.add(new Label("id", copyBook.getId()));
				item.add(new Label("book", copyBook.getBook().getTitle()));
				item.add(new Label("departmentName", copyBook.getDepartment().getName()));
				item.add(new Label("departmentType", copyBook.getDepartment().getType()));
				item.add(new Label("reserve-date", order.getDateReserve()));
				item.add(new Label("return-date", order.getDateReturn()));

				AjaxLink editLink = new AjaxLink("edit-link") {
					@Override
					public void onClick(AjaxRequestTarget target) {
						currentPage.modalWindow.setContent(new CopyBookEditPanel(currentPage.modalWindow, copyBook));
						currentPage.modalWindow.show(target);
					}
				};
				item.add(editLink);
				AjaxLink deleteLink = new AjaxLink("delete-link") {
					@Override
					public void onClick(AjaxRequestTarget target) {
						copyBookService.delete(copyBook.getId());
						currentPage.notification.info(target, "copy book are deleted!");
						setResponsePage(new CopyBooksPage());
					}
				};
				item.add(deleteLink);
				deleteLink.setVisible(false);
				editLink.setVisible(false);
				if (null!=AuthorizedSession.get().getRoles()&&AuthorizedSession.get().getRoles().contains("admin")) {
					deleteLink.setVisible(true);
					editLink.setVisible(true);
				}
				item.add(new Link<Void>("order-link") {
					@Override
					public void onClick() {
						Order order = new Order();
						order.setCopyBook(copyBook);
						order.setCreated(new Date());
						order.setDateReserve(new Date());
						order.setDateReturn(new Date());
						order.setReader(userService.getProfile((AuthorizedSession.get().getLoggedUser().getId())));
						setResponsePage(new OrderEditPage(order));
					}
				});
			}

			private Order buildOrder(Date freeDateFrom, CopyBook copyBook) {
				Order order = new Order();
				order.setCreated(new Date());
				order.setCopyBook(copyBook);
				order.setDateReserve(freeDateFrom);
				if(copyBook.getDepartment().getType()==DepartmentType.ABONEMENT) {
					order.setDateReturn(NextDateUtil.getNextWeek(freeDateFrom));
				} else order.setDateReturn(NextDateUtil.getNextDate(freeDateFrom));
				return order;
			}


		};
		add(dataView);
		add(new PagingNavigator("paging", dataView));
		add(new OrderByBorder("sort-id", CopyBook_.id, copyBooksDataProvider));
		add(new OrderByBorder("sort-book", CopyBook_.book, copyBooksDataProvider));
		add(new OrderByBorder("sort-departmentName", CopyBook_.department, copyBooksDataProvider));
		add(new OrderByBorder("sort-departmentType", CopyBook_.department, copyBooksDataProvider));

	}

	private class CopyBooksDataProvider extends SortableDataProvider<CopyBook, Serializable> {

		private CopyBookFilter copyBookFilter;

		public CopyBooksDataProvider() {
			super();
			copyBookFilter = new CopyBookFilter();
			if(book!=null) copyBookFilter.setBook(book);
			setSort((Serializable) CopyBook_.id, SortOrder.ASCENDING);
		}

		@Override
		public Iterator<CopyBook> iterator(long first, long count) {
			Serializable property = getSort().getProperty();
			SortOrder propertySortOrder = getSortState().getPropertySortOrder(property);

			copyBookFilter.setSortProperty((SingularAttribute) property);
			copyBookFilter.setSortOrder(propertySortOrder.equals(SortOrder.ASCENDING) ? true : false);

			copyBookFilter.setLimit((int) count);
			copyBookFilter.setOffset((int) first);
			return copyBookService.find(copyBookFilter).iterator();
		}

		@Override
		public long size() {
			return copyBookService.count(copyBookFilter);
		}

		@Override
		public IModel<CopyBook> model(CopyBook object) {
			return new Model(object);
		}

	}

}
