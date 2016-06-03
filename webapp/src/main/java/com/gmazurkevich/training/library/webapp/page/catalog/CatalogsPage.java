package com.gmazurkevich.training.library.webapp.page.catalog;

import javax.inject.Inject;

import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.catalog.panel.CatalogsListPanel;

public class CatalogsPage extends AbstractPage {
	@Inject
	private CatalogService catalogService;

	public CatalogsPage() {
		super();

		add(new CatalogsListPanel("list-panel"));
	}
}
