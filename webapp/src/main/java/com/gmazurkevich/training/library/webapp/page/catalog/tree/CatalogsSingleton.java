package com.gmazurkevich.training.library.webapp.page.catalog.tree;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.CatalogService;

public class CatalogsSingleton {
	@Inject
	private CatalogService catalogService;
	
	public static CatalogsSingleton INSTANSE = new CatalogsSingleton();
	
	public final List<Catalog> catalogs;
	
	private CatalogsSingleton() {
		catalogs=getCatalogs();
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
