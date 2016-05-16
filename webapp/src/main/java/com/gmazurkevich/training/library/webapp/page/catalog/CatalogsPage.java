package com.gmazurkevich.training.library.webapp.page.catalog;

import javax.inject.Inject;

import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class CatalogsPage extends AbstractPage {
	@Inject
	private CatalogService catalogService;

	public CatalogsPage() {
		super();

		System.out.print("catalogService = " + catalogService);
	}
}
