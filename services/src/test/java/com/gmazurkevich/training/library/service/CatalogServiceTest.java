package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyParentException;
import com.gmazurkevich.training.library.service.mocks.MockBook;
import com.gmazurkevich.training.library.service.mocks.MockCatalog;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CatalogServiceTest extends MockCatalog {
	
	@Inject
	private BookService bookService;
	
	@After
	public void clearTempCatalog() {
		deleteTempCatalog();
	}

	@Test
	public void test() {
		Assert.assertNotNull(catalogService);
	}

	@Test
	public void testCreateCatalog() {
		Catalog parent = createCatalog();
		Catalog child = createCatalog(parent);
		Catalog childDb = catalogService.getCatalog(child.getId());
		Catalog parentDb = catalogService.getCatalog(parent.getId());
		Assert.assertNotNull(parentDb);
		Assert.assertNotNull(childDb);

	}

	@Test
	public void testDeleteCatalog() {
		Catalog parent = createCatalog();
		int countChilds = 5;
		for (int i = 0; i < countChilds; i++) {
			createCatalog(parent);
		}
		List<Catalog> childs = catalogService.getChilds(parent);
		Assert.assertEquals(childs.size(), countChilds);
		DeleteNotEmptyParentException exception = null;
		try {
			catalogService.delete(parent);
		} catch (DeleteNotEmptyParentException e) {
			exception = e;
		}
		Assert.assertNotNull(exception);
		Assert.assertNotNull(catalogService.getCatalog(parent.getId()));
		exception = null;
		for (Catalog child : childs) {
			try {
				catalogService.delete(child);
			} catch (DeleteNotEmptyParentException e) {
				exception = e;
			}
			Assert.assertNull(exception);
			Assert.assertNull(catalogService.getCatalog(child.getId()));
		}
		childs = catalogService.getChilds(parent);
		Assert.assertEquals(childs.size(), 0);
		try {
			catalogService.delete(parent);
		} catch (DeleteNotEmptyParentException e) {
			exception = e;
		}
		Assert.assertNull(exception);
		Assert.assertNull(catalogService.getCatalog(parent.getId()));
	}
	@Test
	public void testDeleteWithBook(){
		Catalog catalog = createCatalog();
		MockBook mockBook = new MockBook();
		mockBook.createBook(catalog);
//		book.setCatalog(catalog);
//		bookService.create(book);
//		try {
//			catalogService.delete(catalog);
//		} catch (DeleteNotEmptyParentException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
	
	@Test
	public void testUpdateCatalog() {
		Catalog newParent = createCatalog();
		Catalog currentParent = createCatalog();
		Catalog catalog = createCatalog(currentParent);
		String newTitle = "new title catalog";
		catalog.setParent(newParent);
		catalog.setTitle(newTitle);
		catalogService.update(catalog);
		Catalog savedCatalog = catalogService.getCatalog(catalog.getId());
		Assert.assertEquals(catalogService.getChilds(newParent).get(0).getTitle(), savedCatalog.getTitle());
		Assert.assertEquals(savedCatalog.getTitle(), newTitle);
	}

	@Test
	public void testGetRootCatalogs() {
		int countRootCatalogs = 5;
		createCatalogs(null, countRootCatalogs);
		List<Catalog> roots = catalogService.getChilds(null);
		Assert.assertEquals(roots.size(), countRootCatalogs);
	}

	@Test
	public void testGetCatalogs() {
		int countTempCatalogs = 5;
		Catalog parent = createCatalog();
		createCatalogs(parent, countTempCatalogs);
		List<Catalog> savedCatalogs = catalogService.getChilds(parent);
		Assert.assertEquals(savedCatalogs.size(), countTempCatalogs);
	}

}
