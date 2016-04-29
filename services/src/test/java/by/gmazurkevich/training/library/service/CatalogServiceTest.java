package by.gmazurkevich.training.library.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Assert;
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

	// @Test
	// public void testGetChildCatalog() {
	// Catalog parent = catalogService.getCatalog(85L);
	// List<Catalog> childs = catalogService.getChildCatalog(parent);
	// Assert.assertNotNull(childs);
	// }

	@Test
	public void testCreateCatalog() {
		System.out.println("test create catalog in catalog");
		Catalog catalogDb = null;
		try {
			catalogDb = catalogService.getCatalog(createCatalog().getId());
		} catch (Exception e) {
			System.out.println("catalog don't create!!!!");
		}
		Assert.assertNotNull(catalogDb);
		clearDb(catalogDb);
	}

	@Test
	public void testDeleteCatalog() {
		Catalog newCat = createCatalog();
		catalogService.delete(newCat);
		Catalog catalogDb = catalogService.getCatalog(newCat.getId());
		Assert.assertNull(catalogDb);
	}
	@Test
	public void testDeleteParentCatalog() {
		Catalog parent = createCatalog();
		Catalog child = createCatalog(parent);
		System.out.println(parent.getId());
		System.out.println(child.getId());
		Assert.assertNotNull(catalogService.getCatalog(child.getId()));
		Assert.assertNotNull(catalogService.getCatalog(parent.getId()));
		catalogService.delete(parent);
		Catalog catalogDb = catalogService.getCatalog(parent.getId());
		Assert.assertNull(catalogDb);
	}

	public Catalog createCatalog() {
		System.out.println("create catalog in catalog");
		Catalog catalog = new Catalog();
		catalog.setPath("belorussian litrature " + System.currentTimeMillis());
		catalog.setPathParent("liturature");
		catalogService.create(catalog);
		return catalog;
	}

	public Catalog createCatalog(Catalog parent) {
		System.out.println("create catalog in catalog");
		Catalog catalog = new Catalog();
		catalog.setPath("belorussian litrature " + System.currentTimeMillis());
		catalog.setPathParent(parent.getPath());
		catalogService.create(catalog);
		return catalog;
	}

	public void clearDb(Catalog catalog) {
		catalogService.delete(catalog);
	}

}
