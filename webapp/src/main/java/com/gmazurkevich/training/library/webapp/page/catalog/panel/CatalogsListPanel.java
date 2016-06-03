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

}
