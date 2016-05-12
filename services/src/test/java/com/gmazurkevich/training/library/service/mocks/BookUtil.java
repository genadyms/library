package com.gmazurkevich.training.library.service.mocks;

import java.util.Date;
import java.util.List;
import java.util.Set;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;

public class BookUtil {
	
	public static Book createBook(Catalog catalog, Set<Author> authors) {
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
		return book;
	}

}
