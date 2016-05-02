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
	public void testCreateBigCatalog() {
		Catalog parent1 = createCatalog();
		Catalog child1 = createCatalog(parent1);
		Catalog child2 = createCatalog(parent1);
		List<Catalog> res = catalogService.getCatalogs(parent1.getPath());
		System.out.println(res.size());
//		catalogService.delete(parent1);
	}
//	@Test
	public void testCreateCatalog() {
		Catalog catalogDb = null;
		try {
			catalogDb = catalogService.getCatalog(createCatalog().getId());
		} catch (Exception e) {
			System.out.println("catalog don't create!!!!");
		}
		Assert.assertNotNull(catalogDb);
//		clearDb(catalogDb);
	}

//	@Test
	public void testDeleteCatalog() {
		Catalog newCat = createCatalog();
		try {
			catalogService.delete(newCat);
		} catch (ParentElementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Catalog catalogDb = catalogService.getCatalog(newCat.getId());
		Assert.assertNull(catalogDb);
	}
	@Test
	public void testDeleteParentCatalog() {
		Catalog parent = createCatalog();
		Catalog child = createCatalog(parent);
		try {
			catalogService.delete(parent);
		} catch (ParentElementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Catalog catalogDb = catalogService.getCatalog(parent.getId());
		Assert.assertNull(catalogDb);
	}

	public Catalog createCatalog() {
		Catalog catalog = new Catalog();
		catalog.setPath("belorussian litrature " + System.currentTimeMillis());
		catalog.setPathParent("liturature");
		catalogService.create(catalog);
		return catalog;
	}

	public Catalog createCatalog(Catalog parent) {
		Catalog catalog = new Catalog();
		catalog.setPath("belorussian litrature " + System.currentTimeMillis());
		catalog.setPathParent(parent.getPath());
		catalogService.create(catalog);
		return catalog;
	}

//	public void clearDb(Catalog catalog) {
//		catalogService.delete(catalog);
//	}
//	public void clearCatalogDb(Long id) {
//		catalogService.delete(catalogService.getCatalog(id));
//	}
}
