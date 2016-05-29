package com.gmazurkevich.training.library.service.mocks;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyItemException;

public class MockBook extends MockCatalog {

	public Book createBook(Catalog catalog) {
		return createBook(catalog, null);
	}

	public Book createBook() {
		return createBook(null, null);
	}

	public Book createBook(Catalog catalog, List<Author> authors) {
		Book book = new Book();
		book.setIsbn(String.valueOf(Math.random()));
		book.setPages(234);
		book.setPublishingOffice("Manning");
		book.setTitle("Mumu");
		book.setYear(new Date());
		if (authors != null) {
			book.setAuthors(authors);
		}
		if(catalog!=null) {
			book.setCatalog(catalog);
		}
		bookService.save(book);
		return book;

	}

	public void deleteAllBooks() {
		BookFilter bf = new BookFilter();
		for (Book book : bookService.find(bf)) {
			bookService.delete(book);
		}
		deleteTempCatalog();
	}

}
