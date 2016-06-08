package com.gmazurkevich.training.library.webapp.page.user.panel;

import java.io.Serializable;
import java.util.Iterator;

import javax.inject.Inject;
import javax.persistence.metamodel.SingularAttribute;

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

import com.gmazurkevich.training.library.dataaccess.filters.UserFilter;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserProfile_;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.service.exception.DeleteActiveUserException;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.user.UsersEditPage;
import com.gmazurkevich.training.library.webapp.page.user.UsersPage;

public class UsersListPanel extends Panel {

	@Inject
	private UserService userService;

	public UsersListPanel(String id) {
		super(id);

		UsersDataProvider userDataProvider = new UsersDataProvider();
		DataView<UserProfile> dataView = new DataView<UserProfile>("rows", userDataProvider, 5) {
			@Override
			protected void populateItem(Item<UserProfile> item) {
				UserProfile userProfile = item.getModelObject();
				UserCredentials userCredentials = userService.getCredentials(userProfile.getId());
				item.add(new Label("id", userProfile.getId()));
				item.add(new Label("fName", userProfile.getFirstName()));
				item.add(new Label("lName", userProfile.getLastName()));
				item.add(new Label("role", userProfile.getRole()));
				item.add(new Label("state", userProfile.getState()));
				item.add(new Label("phone", userProfile.getPhone()));
				item.add(new Label("address", userProfile.getAddress()));
				item.add(new Label("email", userCredentials.getEmail()));

				item.add(new Link<Void>("edit-link") {
					@Override
					public void onClick() {
						setResponsePage(new UsersEditPage(userProfile,userCredentials));
					}
				});
				
				Link linkDel = new Link<Void>("delete-link") {
					@Override
					public void onClick() {
						try {
							userService.delete(userProfile.getId());
						} catch (DeleteActiveUserException e) {
							e.printStackTrace();
						}
						setResponsePage(new UsersPage());
					}
				};
				linkDel.setVisible(!AuthorizedSession.get().getLoggedUser().getId().equals(userProfile.getId()));
				item.add(linkDel);
			}
		};
		add(dataView);
		add(new PagingNavigator("paging", dataView));

		add(new OrderByBorder("sort-id", UserProfile_.id, userDataProvider));
		add(new OrderByBorder("sort-fname", UserProfile_.firstName, userDataProvider));
		add(new OrderByBorder("sort-lname", UserProfile_.lastName, userDataProvider));
		add(new OrderByBorder("sort-role", UserProfile_.role, userDataProvider));
		add(new OrderByBorder("sort-state", UserProfile_.state, userDataProvider));
		add(new OrderByBorder("sort-address", UserProfile_.address, userDataProvider));
	}

	private class UsersDataProvider extends SortableDataProvider<UserProfile, Serializable> {

		private UserFilter userFilter;

		public UsersDataProvider() {
			super();
			userFilter = new UserFilter();
//			userFilter.setFetchCredentials(true);
			if(AuthorizedSession.get().getRoles().contains(UserRole.LIBRARIAN.toString())) {
				userFilter.setRole(UserRole.READER);
			}
			setSort((Serializable) UserProfile_.firstName, SortOrder.ASCENDING);
		}

		@Override
		public Iterator<UserProfile> iterator(long first, long count) {
			Serializable property = getSort().getProperty();
			SortOrder propertySortOrder = getSortState().getPropertySortOrder(property);
			userFilter.setSortProperty((SingularAttribute) property);
			userFilter.setSortOrder(propertySortOrder.equals(SortOrder.ASCENDING) ? true : false);

			userFilter.setLimit((int) count);
			userFilter.setOffset((int) first);
			return userService.find(userFilter).iterator();
		}

		@Override
		public long size() {
			return userService.count(userFilter);
		}

		@Override
		public IModel<UserProfile> model(UserProfile object) {
			return new Model(object);
		}

	}

}
