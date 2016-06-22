package com.gmazurkevich.training.library.service.old;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.old.mocks.MockBook;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class BookServiceTest extends MockBook {

	@Test
	public void test() {
		Assert.assertNotNull(bookService);
	}

	@Test
	public void testCreateBook() {
		Book bookDb = bookService.getBook(createBook().getId());
		Assert.assertNotNull(bookDb);
	}

	@Test
	public void testDeleteBook() {
		Book bookDb = bookService.getBook(createBook().getId());
		bookService.delete(bookDb);
		Assert.assertNull(bookService.getBook(bookDb.getId()));
		Assert.assertNotNull(bookDb);
	}

	@Test
	public void testFindByCatalog() {
		Catalog catalog = createCatalog();
		Book book = createBook(catalog);
		BookFilter bf = new BookFilter();
		bf.setCatalog(catalog);
		Book[] books = new Book[5];
		books[0] = book;
		for (int i = 1; i < books.length; i++) {
			books[i] = createBook(catalog);
		}
		Assert.assertEquals(bookService.find(bf).size(), books.length);

	}

	@Test
	public void testFindByIsbn() {
		Book book = createBook();
		BookFilter bf = new BookFilter();
		bf.setIsbn(book.getIsbn());
		Assert.assertEquals(bookService.find(bf).size(), 1);
	}

	@Test
	public void testFindByPublishingOffice() {
		Book book = createBook();
		BookFilter bf = new BookFilter();
		bf.setPublishingOffice(book.getPublishingOffice());
		Assert.assertNotEquals(bookService.find(bf).size(), 0);

	}

	@Test
	public void testFindByTitle() {
		Book book = createBook();
		BookFilter bf = new BookFilter();
		String title = book.getTitle();
		bf.setTitle(title);
		Assert.assertEquals(bookService.find(bf).size(), 1);
		bf.setTitle("test title");
		Assert.assertNotEquals(bookService.find(bf).size(), 1);

	}

	@After
	public void clearDb() {
		 deleteAllBooks();
	}

}
