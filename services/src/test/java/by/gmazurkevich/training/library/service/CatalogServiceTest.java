package by.gmazurkevich.training.library.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.Catalog;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CatalogServiceTest {

	@Inject
	protected CatalogService catalogService;

	@Test
	public void testGetRootCatalogs() {
		int countRootCatalogs = 20;
		for(int i=0; i<countRootCatalogs; i++){
			createCatalog("root"+i, null);
		}
		Assert.assertEquals(catalogService.getChildCatalogs(null).size(), countRootCatalogs);
	}

	@Test
	public void testGetCatalogs() {
		Catalog root = createCatalog("root", null);
		int countRootCatalogs = 20;
		for(int i=0; i<countRootCatalogs; i++){
			createCatalog("root"+i, root.getPath());
		}
		Assert.assertEquals(catalogService.getChildCatalogs(root.getPath()).size(), countRootCatalogs);
	}
	

	@Test
	public void testCreateCatalog() {
		Catalog catalogDb = catalogService.getCatalog(createCatalog("root", null).getId());
		Assert.assertNotNull(catalogDb);
	}

	@Test
	public void testDeleteCatalog() {
		Catalog parent = createCatalog("parent", null);
		Catalog child = createCatalog("child", parent.getPath());
		ElementHasChildException exception = null;
		try {
			catalogService.delete(parent);
		} catch (ElementHasChildException e) {
			exception = e;
		}
		Assert.assertNotNull(exception);
		Assert.assertNotNull(catalogService.getCatalog(parent.getId()));
		exception = null;
		try {
			catalogService.delete(child);
		} catch (ElementHasChildException e) {
			exception = e;
		}
		Assert.assertNull(exception);
		Assert.assertNull(catalogService.getCatalog(child.getId()));
	}

	@Test
	public void testUpdateCatalog() {
		Catalog catalog = createCatalog("root", null);
		String newPath = "new path ";
		catalog.setPath(newPath);
		ModifiedParentCatalogException exception = null;
		try {
			catalogService.update(catalog);
		} catch (ModifiedParentCatalogException e) {
			exception = e;
		}
		Assert.assertEquals(catalogService.getCatalog(catalog.getId()).getPath(), newPath);
		Assert.assertNull(exception);

		String pathParent = catalog.getPathParent();
		catalog.setPathParent(newPath);
		try {
			catalogService.update(catalog);
		} catch (ModifiedParentCatalogException e) {
			exception = e;
		}
		Assert.assertNotNull(exception);
		Assert.assertEquals(catalogService.getCatalog(catalog.getId()).getPathParent(), pathParent);
	}

	public Catalog createCatalog(String path, String pathParent) {
		Catalog catalog = new Catalog();
		catalog.setPath(path);
		catalog.setPathParent(pathParent);
		catalogService.create(catalog);
		return catalog;
	}
	
	@Before
	@After
	public void clearDb() {
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
