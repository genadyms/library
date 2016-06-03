package com.gmazurkevich.training.library.webapp.page.catalog.panel;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.Component;
import org.apache.wicket.extensions.markup.html.repeater.tree.DefaultNestedTree;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.IModel;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.webapp.page.catalog.tree.Foo;
import com.gmazurkevich.training.library.webapp.page.catalog.tree.CatalogTreeProvider;

public class CatalogsListPanel extends Panel {

	@Inject
	private CatalogService catalogService;

	public CatalogsListPanel(String id) {
		super(id);

		// CatalogsDataProvider catalogsDataProvider = new
		// CatalogsDataProvider();
		// DataView<Catalog> dataView = new DataView<Catalog>("rows",
		// catalogsDataProvider, 5) {
		// @Override
		// protected void populateItem(Item<Catalog> item) {
		// Catalog catalog =
		// catalogService.getCatalog(item.getModelObject().getId());
		//
		// item.add(new Label("id", catalog.getId()));
		// item.add(new Label("title", catalog.getTitle()));
		//
		// }
		// };
		// add(dataView);

		add(new DefaultNestedTree<Foo>("tree", new CatalogTreeProvider(getCatalogs())) {
			@Override
			protected Component newContentComponent(String id, IModel<Foo> node) {
				return super.newContentComponent(id, node);
			}
		});
	}

	private List<Catalog> getCatalogs() {
		List<Catalog> catalogsAll = new ArrayList<Catalog>();
		for (Catalog current : catalogService.getCatalogs(null)) {
			if (current != null) {
				List<Catalog> childs = catalogService.getCatalogs(current);
				if (childs != null) {
					current.setChilds(childs);
				}
			}
			catalogsAll.add(current);
		}
		return catalogsAll;
	}
	// private class CatalogsDataProvider extends SortableDataProvider<Catalog,
	// Serializable> {
	// public CatalogsDataProvider() {
	// super();
	// setSort((Serializable) Catalog_.title, SortOrder.ASCENDING);
	// }
	//
	// @Override
	// public Iterator<Catalog> iterator(long first, long count) {
	// return catalogService.getAll().iterator();
	// }
	//
	// @Override
	// public long size() {
	// return catalogService.getAll().size();
	// }
	//
	// @Override
	// public IModel<Catalog> model(Catalog object) {
	// return new Model(object);
	// }
	//
	// }

}
