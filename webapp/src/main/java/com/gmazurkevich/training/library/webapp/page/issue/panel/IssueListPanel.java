package com.gmazurkevich.training.library.webapp.page.issue.panel;

import java.io.Serializable;
import java.util.Iterator;

import javax.inject.Inject;
import javax.persistence.metamodel.SingularAttribute;

import org.apache.wicket.datetime.markup.html.basic.DateLabel;
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

import com.gmazurkevich.training.library.dataaccess.filters.IssueFilter;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.datamodel.Issue_;
import com.gmazurkevich.training.library.service.IssueService;
import com.gmazurkevich.training.library.webapp.page.home.HomePage;

public class IssueListPanel extends Panel {

	private static final long serialVersionUID = 1L;
	@Inject
	private  IssueService issueService;

	public IssueListPanel(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		IssueDataProvider issueDataProvider = new IssueDataProvider();
		DataView<Issue> dataView = new DataView<Issue>("rows", issueDataProvider, 5) {
			
			private static final long serialVersionUID = 1L;

			@Override
			protected void populateItem(Item<Issue> item) {
				Issue issue = item.getModelObject();

				item.add(new Label("id", issue.getId()));
				item.add(DateLabel.forDatePattern("date-take", Model.of(issue.getDateTake()), "dd-MM-yyyy hh:mm"));
				item.add(DateLabel.forDatePattern("plannedDateReturn", Model.of(issue.getPlannedDateReturn()), "dd-MM-yyyy hh:mm"));
				item.add(DateLabel.forDatePattern("dateReturn", Model.of(issue.getDateReturn()), "dd-MM-yyyy hh:mm"));
//				item.add(DateLabel.forDatePattern("closed", Model.of(issue.getClosed()), "dd-MM-yyyy hh:mm"));

				item.add(new Link<Void>("details-link") {

					private static final long serialVersionUID = 1L;

					@Override
					public void onClick() {
						setResponsePage(new HomePage());
					}
				});

			}
		};
		add(dataView);
		add(new PagingNavigator("paging", dataView));
		add(new OrderByBorder("sort-id", Issue_.id, issueDataProvider));
//		add(new OrderByBorder("sort-date-take", Issue_.dateTake, issueDataProvider));
//		add(new OrderByBorder("sort-reserved", Order_.reserved, issueDataProvider));
//		add(new OrderByBorder("sort-handled", Order_.handled, issueDataProvider));
//		add(new OrderByBorder("sort-closed", Order_.closed, issueDataProvider));

	}

	private class IssueDataProvider extends SortableDataProvider<Issue, Serializable> {

		private static final long serialVersionUID = 1L;
		private IssueFilter issueFilter;;
		
		public IssueDataProvider() {
			super();
			issueFilter = new IssueFilter();
			setSort((Serializable) Issue_.id, SortOrder.ASCENDING);
		}

		@Override
		public Iterator<Issue> iterator(long first, long count) {
			Serializable property = getSort().getProperty();
			SortOrder propertySortOrder = getSortState().getPropertySortOrder(property);

			issueFilter.setSortProperty((SingularAttribute) property);
			issueFilter.setSortOrder(propertySortOrder.equals(SortOrder.ASCENDING) ? true : false);

			issueFilter.setLimit((int) count);
			issueFilter.setOffset((int) first);
			return issueService.find(issueFilter).iterator();
		}

		@Override
		public long size() {
			return issueService.count(issueFilter);
		}

		@Override
		public IModel<Issue> model(Issue object) {
			return new Model<Issue>(object);
		}

	}
}
