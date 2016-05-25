package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Book;

public interface BookService {

	List<Book> find(BookFilter bookFilter);

	@Transactional
	void update(Book book);

	@Transactional
	void save(Book book);

	@Transactional
	void delete(Book book);

	Book getBook(Long id);

	Long count(BookFilter filter);

}
