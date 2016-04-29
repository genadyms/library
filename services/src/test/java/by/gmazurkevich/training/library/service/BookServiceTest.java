package by.gmazurkevich.training.library.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.Author;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.datamodel.Comment;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class BookServiceTest extends CatalogServiceTest{
	
	@Inject
	protected BookService bookService;

	@Test
	public void testCreateBook() {
		System.out.println(" test create book in book");
		Book bookDb = bookService.getBook(createBook().getId());
		Assert.assertNotNull(bookDb);
	}

	public Book createBook() {
		System.out.println(" create book in book");
		Book book = new Book();
		book.setIsbn(String.valueOf(System.currentTimeMillis()));
//		List<Author> authors = new ArrayList<>();
//		Author author = new Author();
//		author.setFirstName("firstName");
//		author.setSecondName("secondName");
//		authors.add(author);
//		book.setAuthor(authors);
		
		book.setCatalog(createCatalog());
		book.setPages(234);
		book.setPublishingOffice("Manning");
		book.setTitle("Mumu");
		book.setYear(new Date());
		bookService.create(book);
		return book;
	}
	//
	// @Test
	// public void test() {
	// Assert.assertNotNull(bookService);
	// }

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
