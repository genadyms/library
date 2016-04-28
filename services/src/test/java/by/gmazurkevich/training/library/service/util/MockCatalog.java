package by.gmazurkevich.training.library.service.util;

import javax.inject.Inject;

import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.service.CatalogService;

public class MockCatalog {
	@Inject
	protected CatalogService catalogService;

	public Catalog createMockCatalog(){
		Catalog catalog = new Catalog();
		catalog.setPath("belorussian litrature");
		catalog.setPathParent("liturature");
		catalogService.create(catalog);
		return catalogService.getCatalog(catalog.getId());
	}
	
	public void clearDb(Catalog catalog){
		catalogService.delete(catalog);
	}
}
