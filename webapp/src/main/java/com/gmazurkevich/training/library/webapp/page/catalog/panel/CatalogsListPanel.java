package com.gmazurkevich.training.library.webapp.page.catalog.panel;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.Component;
import org.apache.wicket.extensions.markup.html.repeater.tree.DefaultNestedTree;
import org.apache.wicket.markup.html.link.BookmarkablePageLink;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;
import com.gmazurkevich.training.library.webapp.page.catalog.CatalogsPage;
import com.gmazurkevich.training.library.webapp.page.catalog.tree.CatalogProvider;

public class CatalogsListPanel extends Panel {

	@Inject
	private CatalogService catalogService;

	@Inject
	private BookService bookService;

	public CatalogsListPanel(String id) {
		super(id);

		add(new DefaultNestedTree<Catalog>("tree", new CatalogProvider()) {// CatalogTreeProvider(getCatalogs()))
																			// {
			@Override
			protected Component newContentComponent(String id, IModel<Catalog> node) {
				Catalog catalog = node.getObject();
				List<Catalog> childs = catalogService.getCatalogs(catalog);
				if (childs.isEmpty()) {
					BookFilter bookFilter = new BookFilter();
					bookFilter.setCatalog(catalog);
					List<Book> books = bookService.find(bookFilter);
					for (Book current : books) {
						PageParameters parameters = new PageParameters();
						parameters.add("id", current.getId());
						BookmarkablePageLink bookLink = new BookmarkablePageLink<>(id, BooksPage.class, parameters);
						bookLink.setBody(Model.of(catalog));

						return bookLink;
					}
				}
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
