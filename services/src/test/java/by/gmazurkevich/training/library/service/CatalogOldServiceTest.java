package by.gmazurkevich.training.library.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.CatalogOld;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CatalogOldServiceTest {

	@Inject
	protected CatalogOldService catalogService;

	@Test
	public void testGetCatalogs() {
		CatalogOld catalog = createCatalog();
		createCatalog(catalog);
		createCatalog(catalog);
		createCatalog(catalog);
		List<CatalogOld> res = catalogService.getCatalogs(catalog.getPath());
		Assert.assertEquals(res.size(), 3);
	}

//	@Test
//	public void testCreateCatalog() {
//		Catalog catalogDb = catalogService.getCatalog(createCatalog().getId());
//		Assert.assertNotNull(catalogDb);
//	}
//
//	@Test
//	public void testDeleteCatalog() {
//		Catalog parent = createCatalog();
//		Catalog child = createCatalog(parent);
//		ElementHasChildException exception = null;
//		try {
//			catalogService.delete(parent);
//		} catch (ElementHasChildException e) {
//			exception = e;
//		}
//		Assert.assertNotNull(exception);
//		Assert.assertNotNull(catalogService.getCatalog(parent.getId()));
//		exception = null;
//		try {
//			catalogService.delete(child);
//		} catch (ElementHasChildException e) {
//			exception = e;
//		}
//		Assert.assertNull(exception);
//		Assert.assertNull(catalogService.getCatalog(child.getId()));
//	}
//
//	@Test
//	public void testUpdateCatalog() {
//		Catalog catalog = createCatalog();
//		String newPath = "new path " + Math.random();
//		catalog.setPath(newPath);
//		ModifiedParentCatalogException exception = null;
//		try {
//			catalogService.update(catalog);
//		} catch (ModifiedParentCatalogException e) {
//			exception = e;
//		}
//		Assert.assertEquals(catalogService.getCatalog(catalog.getId()).getPath(), newPath);
//		Assert.assertNull(exception);
//		
//		String pathParent = catalog.getPathParent();
//		catalog.setPathParent(newPath);
//		try {
//			catalogService.update(catalog);
//		} catch (ModifiedParentCatalogException e) {
//			exception = e;
//		}
//		Assert.assertNotNull(exception);
//		Assert.assertEquals(catalogService.getCatalog(catalog.getId()).getPathParent(), pathParent);
//	}

	public CatalogOld createCatalog() {
		CatalogOld catalog = new CatalogOld();
		catalog.setPath("belorussian litrature " + System.currentTimeMillis());
		catalog.setPathParent("litrature");
		catalogService.create(catalog);
		return catalog;
	}

	public CatalogOld createCatalog(CatalogOld parent) {
		CatalogOld catalog = new CatalogOld();
		catalog.setPath("belorussian litrature " + System.currentTimeMillis());
//		catalog.setPathParent(parent.getPathParent()+"/"+parent.getPath());
		catalog.setPathParent(parent.getPath());
		catalogService.create(catalog);
		return catalog;
	}

}
