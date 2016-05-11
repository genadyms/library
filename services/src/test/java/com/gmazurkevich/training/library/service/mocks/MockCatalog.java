package com.gmazurkevich.training.library.service.mocks;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyParentException;

public class MockCatalog {

	protected List<Catalog> tempCatalogs = new ArrayList<Catalog>();

	@Inject
	protected CatalogService catalogService;

	@Inject
	protected BookService bookService;
	
	public Catalog createCatalog() {
		Catalog catalog = createCatalog(null);
		return catalog;
	}

	public Catalog createCatalog(Catalog parent) {
		Catalog catalog = new Catalog();
		catalog.setTitle("root" + System.currentTimeMillis());
		catalog.setParent(parent);
		catalogService.create(catalog);
		tempCatalogs.add(catalog);
		return catalog;
	}
	
	public List<Catalog> createCatalogs(Catalog parent, int countChilds){
		List<Catalog> result = new ArrayList<Catalog>();
		for(int i=0; i<countChilds; i++){
			result.add(createCatalog(parent));
		}
		return result;
	}

	public void deleteTempCatalog() {
		if (tempCatalogs.isEmpty()) return;
		Collections.reverse(tempCatalogs);
		for (Catalog current : tempCatalogs) {
			try {
				catalogService.delete(current);
			} catch (DeleteNotEmptyParentException e) {
				e.printStackTrace();
			}
		}
	}

}
