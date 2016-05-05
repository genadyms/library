package by.gmazurkevich.training.library.service;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.service.mocks.MockBook;

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
		Book book = createBook();
		Catalog catalog = book.getCatalog();
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
		bf.setPublishingOffice(book.getTitle());
		Assert.assertNotEquals(bookService.find(bf).size(), 1);

	}

	@Before
	@After
	public void clearDb() {
		deleteAllBooks();
		deleteAllCatalogs();
	}
	// @Test
	// public void testFromDb() {
	// List<Book> books =
	// catalogService.getBooks(catalogService.getCatalog(32L));
	// System.out.println(books.get(0).getTitle());
	// Assert.assertNotNull(books);
	// }
	//
	//// @Test
	// public void testAddComment(){
	// Comment comment = new Comment();
	// comment.setContent("test add comment in book");
	// comment.setUserProfile(userService.getProfile(111L));
	// bookService.addComment(book, comment);
	// System.out.println(comment.getId());
	//// Comment savedComment = commentService.getComment(comment.getId());
	//// System.out.println(savedComment.getContent());
	// }
	//
	//// @Before
	// public void initialize() {
	// Catalog catalog = new Catalog();
	// catalog.setPath("book service test");
	// catalogService.create(catalog);
	// book = new Book();
	// book.setAuthor(new ArrayList<>());
	// book.setBookComment(new ArrayList<>());
	// book.setCatalog(catalog);
	// book.setIsbn(String.valueOf(System.currentTimeMillis()));
	// book.setPages(321);
	// book.setPublishingOffice("Oreally");
	// book.setTitle("Hello World");
	// book.setYear(new Date());
	// bookService.create(book);
	//
	// }
}
