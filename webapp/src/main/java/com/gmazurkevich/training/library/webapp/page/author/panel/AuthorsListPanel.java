package com.gmazurkevich.training.library.webapp.page.author.panel;

import java.io.Serializable;
import java.util.Iterator;

import javax.inject.Inject;
import javax.persistence.metamodel.SingularAttribute;

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

public class AuthorsListPanel extends Panel {

	private static final long serialVersionUID = 1L;
	@Inject
    private AuthorService service;

    public AuthorsListPanel(String id) {
        super(id);

        AuthorsDataProvider authorsDataProvider = new AuthorsDataProvider();
        DataView<Author> dataView = new DataView<Author>("rows", authorsDataProvider, 5) {
            @Override
            protected void populateItem(Item<Author> item) {
                Author attr = item.getModelObject();
                item.add(new Label("id", attr.getId()));
                item.add(new Label("firstName", attr.getFirstName()));
                item.add(new Label("secondName", attr.getSecondName()));

            }
        };
        add(dataView);
        add(new PagingNavigator("paging", dataView));

        add(new OrderByBorder("sort-id", Author_.id, authorsDataProvider));
        add(new OrderByBorder("sort-name", Author_.secondName, authorsDataProvider));

    }

    private class AuthorsDataProvider extends SortableDataProvider<Author, Serializable> {

        private AuthorFilter filter;

        public AuthorsDataProvider() {
            super();
            filter = new AuthorFilter();
            setSort((Serializable) Author_.secondName, SortOrder.ASCENDING);
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
