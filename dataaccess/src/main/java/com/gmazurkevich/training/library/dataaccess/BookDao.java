package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Book;

public interface BookDao extends AbstractDao<Book, Long> {

	List<Book> find(BookFilter bookFilter);

}
