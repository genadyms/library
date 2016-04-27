package by.gmazurkevich.training.library.service;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.service.util.MockCatalog;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CatalogServiceTest extends MockCatalog {

	@Test
	public void testCreateCatalog() {
		Catalog newCat = createMockCatalog();
		Catalog catalogDb = catalogService.getCatalog(newCat.getId());
		Assert.assertNotNull(catalogDb);
		clearDb(catalogDb);
	}

	@Test
	public void testDeleteCatalog() {
		Catalog newCat = createMockCatalog();
		catalogService.delete(newCat);
		Catalog catalogDb = catalogService.getCatalog(newCat.getId());
		Assert.assertNull(catalogDb);
	}
}
