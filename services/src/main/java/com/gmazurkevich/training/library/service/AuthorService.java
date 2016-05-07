package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyParentException;

public interface AuthorService {

	Author getAuthor(Long id);

	@Transactional
	void update(Author author);

	@Transactional
	void delete(Author author) throws DeleteNotEmptyParentException;

	@Transactional
	void create(Author author);
	
	List<Author> getAll();
	
	List<Book> getBooks(List<Author> authors);

}
