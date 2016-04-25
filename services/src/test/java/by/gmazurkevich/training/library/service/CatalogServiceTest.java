package by.gmazurkevich.training.library.service;

import javax.inject.Inject;

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
	private CatalogService catalogService;

	private Catalog catalog = new Catalog();

	@Test
	public void testCreateCatalog() {
//		Catalog savedCatalog = catalogService.getCatalog(catalog.getId());
//		Assert.assertNotNull(savedCatalog);
		Long id = 33L;
		Catalog c = catalogService.getCatalog(id);
		System.out.println(c.getPath());
		System.out.println(c.getBooks().get(0));
		System.out.println("end");
	}

//	@Test
//	public void testUpdateCatalog() {
//		String newPath = "new catalog path";
//		catalog.setPath(newPath);
//		catalogService.update(catalog);
//		Catalog savedCatalog = catalogService.getCatalog(catalog.getId());
//		Assert.assertEquals(newPath, savedCatalog.getPath());
//	}
//
//	@Test
//	public void testDeleteCatalog() {
//		catalogService.delete(catalog);
//		Catalog savedCatalog = catalogService.getCatalog(catalog.getId());
//		Assert.assertNull(savedCatalog);
//	}
//
//	@Before
//	public void createCatalog() {
//		catalog.setPath("programming");
//		catalogService.create(catalog);
//	}

}
