package com.gmazurkevich.training.library.webapp.page.department.panel;

import java.io.Serializable;
import java.util.Iterator;

import javax.inject.Inject;
import javax.persistence.PersistenceException;
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

import com.gmazurkevich.training.library.dataaccess.filters.DepartmentFilter;
import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.datamodel.Department_;
import com.gmazurkevich.training.library.service.DepartmentService;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyItemException;
import com.gmazurkevich.training.library.webapp.page.department.DepartmentEditPage;
import com.gmazurkevich.training.library.webapp.page.department.DepartmentsPage;

public class DepartmentsListPanel extends Panel {

	@Inject
	private DepartmentService departmentService;

	public DepartmentsListPanel(String id) {
		super(id);
		DepartmentsDataProvider departmentsDataProvider = new DepartmentsDataProvider();
		DataView<Department> dataView = new DataView<Department>("rows", departmentsDataProvider, 5) {
			@Override
			protected void populateItem(Item<Department> item) {
				Department department = item.getModelObject();
				item.add(new Label("id", department.getId()));
				item.add(new Label("name", department.getName()));
				item.add(new Label("type", department.getType()));
				item.add(new Label("phone", department.getPhone()));
				item.add(new Label("address", department.getAddress()));

				item.add(new Link<Void>("edit-link") {
					@Override
					public void onClick() {
						setResponsePage(new DepartmentEditPage(department));
					}
				});

				item.add(new Link<Void>("delete-link") {
					@Override
					public void onClick() {
						try {
							departmentService.delete(department);
						} catch (DeleteNotEmptyItemException e) {
							e.printStackTrace();
						}
						setResponsePage(DepartmentsPage.class);
					}
				});

			}
		};
		add(dataView);
		add(new PagingNavigator("paging", dataView));

		add(new OrderByBorder("sort-id", Department_.id, departmentsDataProvider));
		add(new OrderByBorder("sort-name", Department_.name, departmentsDataProvider));
		add(new OrderByBorder("sort-type", Department_.type, departmentsDataProvider));
		add(new OrderByBorder("sort-address", Department_.address, departmentsDataProvider));
	}

	private class DepartmentsDataProvider extends SortableDataProvider<Department, Serializable> {

		private DepartmentFilter departmentFilter;

		public DepartmentsDataProvider() {
			super();
			departmentFilter = new DepartmentFilter();
			setSort((Serializable) Department_.name, SortOrder.ASCENDING);
		}

		@Override
		public Iterator<Department> iterator(long first, long count) {
			Serializable property = getSort().getProperty();
			SortOrder propertySortOrder = getSortState().getPropertySortOrder(property);

			departmentFilter.setSortProperty((SingularAttribute) property);
			departmentFilter.setSortOrder(propertySortOrder.equals(SortOrder.ASCENDING) ? true : false);

			departmentFilter.setLimit((int) count);
			departmentFilter.setOffset((int) first);
			return departmentService.find(departmentFilter).iterator();
		}

		@Override
		public long size() {
			return departmentService.count(departmentFilter);
		}

		@Override
		public IModel<Department> model(Department object) {
			return new Model(object);
		}

	}

}
