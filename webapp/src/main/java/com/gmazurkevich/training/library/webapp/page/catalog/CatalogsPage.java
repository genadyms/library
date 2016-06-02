package com.gmazurkevich.training.library.webapp.page.catalog;

import javax.inject.Inject;

import org.apache.wicket.Component;
import org.apache.wicket.extensions.markup.html.repeater.tree.DefaultNestedTree;
import org.apache.wicket.model.IModel;

import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.catalog.tree.Foo;
import com.gmazurkevich.training.library.webapp.page.catalog.tree.FooProvider;

public class CatalogsPage extends AbstractPage {
	@Inject
	private CatalogService catalogService;

	public CatalogsPage() {
		super();

		add(new DefaultNestedTree<Foo>("tree", new FooProvider()) {
			/**
			 * To use a custom component for the representation of a node's
			 * content we would override this method.
			 */
			@Override
			protected Component newContentComponent(String id, IModel<Foo> node) {
				return super.newContentComponent(id, node);
			}
		});
	}
}
