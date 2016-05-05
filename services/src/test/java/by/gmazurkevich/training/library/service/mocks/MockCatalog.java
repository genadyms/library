package by.gmazurkevich.training.library.service.mocks;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.service.CatalogService;
import by.gmazurkevich.training.library.service.ElementHasChildException;

public class MockCatalog {
	@Inject
	protected CatalogService catalogService;

	public Catalog createCatalog(String path, String pathParent) {
		Catalog catalog = new Catalog();
		catalog.setPath(path);
		catalog.setPathParent(pathParent);
		catalogService.create(catalog);
		return catalog;
	}

	public void deleteAllCatalogs() {
		List<Catalog> roots = catalogService.getChildCatalogs(null);
		List<Long> idDel = new ArrayList<Long>();
		reqursive(roots, idDel);
		Collections.reverse(idDel);
		for (Long cat : idDel) {
			try {
				catalogService.delete(catalogService.getCatalog(cat));
			} catch (ElementHasChildException e) {
				e.printStackTrace();
			}
		}
	}

	private void reqursive(List<Catalog> roots, List<Long> idDel) {
		if (roots == null || roots.isEmpty()) {
			return;
		} else {
			for (Catalog curr : roots) {
				idDel.add(curr.getId());
				reqursive(catalogService.getChildCatalogs(curr.getPath()), idDel);
			}
		}
	}
}
