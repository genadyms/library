package com.gmazurkevich.training.library.service;

import java.util.List;
import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.AuthorFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.service.exception.DeleteAuthorWithBooksException;

public interface AuthorService {

	Author getAuthor(Long id);

	@Transactional
	void update(Author author);

	@Transactional
	void delete(Author author) throws DeleteAuthorWithBooksException;

	@Transactional
	void create(Author author);

	@Transactional
	void saveOrUpdate(Author author);

	List<Author> getAll();

	List<Author> find(String substring);

	List<Author> find(AuthorFilter filter);

	Long count(AuthorFilter filter);
}
