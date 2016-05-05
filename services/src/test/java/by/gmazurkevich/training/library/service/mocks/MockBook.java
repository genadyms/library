package by.gmazurkevich.training.library.service.mocks;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import by.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import by.gmazurkevich.training.library.datamodel.Author;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.service.BookService;
import by.gmazurkevich.training.library.service.ElementHasChildException;

public class MockBook extends MockCatalog{
	
	@Inject
	protected BookService bookService;
	
	public Book createBook(Catalog catalog) {
		return createBook(catalog, null);
	}
	
	public Book createBook() {
		return createBook(null, null);
	}
	
	public Book createBook(Catalog catalog, List<Author> authors) {
		if (catalog==null) catalog = createCatalog("books for test", null);
		Book book = new Book();
		book.setIsbn(String.valueOf(System.currentTimeMillis()));
		book.setCatalog(catalog);
		book.setPages(234);
		book.setPublishingOffice("Manning");
		book.setTitle("Mumu");
		book.setYear(new Date());
		if(authors!=null) {
			book.setAuthor(authors);
		}
		bookService.create(book);
		return book;
		
	}
	
	public void deleteAllBooks(){
		BookFilter bf = new BookFilter();
		for (Book book : bookService.find(bf)){
			bookService.delete(book);
		}
	}
	
	
}
