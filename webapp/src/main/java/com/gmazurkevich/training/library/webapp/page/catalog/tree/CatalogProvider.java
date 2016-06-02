package com.gmazurkevich.training.library.webapp.page.catalog.tree;

import java.util.Iterator;
import javax.inject.Inject;

import org.apache.wicket.extensions.markup.html.repeater.tree.ITreeProvider;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.LoadableDetachableModel;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CatalogService;

public class CatalogProvider implements ITreeProvider<Catalog> {
	@Inject
	private static CatalogService catalogService;
	
	@Inject
	private BookService bookService;
	
	private static final long serialVersionUID = 1L;


	public CatalogProvider() {
	}

	@Override
	public void detach() {
	}

	@Override
	public Iterator<Catalog> getRoots() {
		return catalogService.getCatalogs(null).iterator();
	}

	@Override
	public boolean hasChildren(Catalog catalog) {
		boolean noCatalogs = catalogService.getCatalogs(catalog).isEmpty();
//		BookFilter filter = new BookFilter();
//		filter.setCatalog(catalog);
//		boolean noBooks = bookService.find(filter).isEmpty();
		return noCatalogs;
	}

	@Override
	public Iterator<Catalog> getChildren(final Catalog catalog) {
		return catalogService.getCatalogs(catalog).iterator();
	}

	/**
	 * Creates a {@link FooModel}.
	 */
	@Override
	public IModel<Catalog> model(Catalog catalog) {
		return new CatalogModel(catalog);
	}

	private static class CatalogModel extends LoadableDetachableModel<Catalog> {
		private static final long serialVersionUID = 1L;

		private final Long id;

		public CatalogModel(Catalog catalog) {
			super(catalog);

			id = catalog.getId();
		}

		@Override
		protected Catalog load() {
			return catalogService.getCatalog(id);
		}
	}
}