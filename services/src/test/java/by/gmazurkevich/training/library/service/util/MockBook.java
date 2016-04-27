package by.gmazurkevich.training.library.service.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import by.gmazurkevich.training.library.datamodel.Author;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.service.BookService;

public class MockBook {
	@Inject
	protected BookService bookService;
	
	public Book createMockBook(){
		Book book = new Book();
		book.setIsbn(String.valueOf(System.currentTimeMillis()));
		List<Author> authors = new ArrayList<>();
		Author author = new Author();
		author.setFirstName("firstName");
		author.setSecondName("secondName");
		authors.add(author);
		book.setAuthor(authors);
		book.setCatalog(new MockCatalog().createMockCatalog());
		book.setPages(234);
		book.setPublishingOffice("Manning");
		book.setTitle("Mumu");
		book.setYear(new Date());
		bookService.create(book);
		return book;
	}
}
