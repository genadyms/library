package com.gmazurkevich.training.library.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.AuthorDao;
import com.gmazurkevich.training.library.dataaccess.BookDao;
import com.gmazurkevich.training.library.dataaccess.filters.AuthorFilter;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.AuthorServiceTest;
import com.gmazurkevich.training.library.service.exception.DeleteAuthorWithBooksException;

@Service
public class AuthorServiceImpl implements AuthorService {
	private static Logger LOGGER = LoggerFactory.getLogger(AuthorServiceImpl.class);
	@Inject
	private AuthorDao authorDao;

	@Inject
	private BookDao bookDao;

	@Override
	public Author getAuthor(Long id) {
		return authorDao.get(id);
	}

	@Override
	public void update(Author author) {
		authorDao.update(author);
		LOGGER.info("Update {} in database.", author);
	}

	@Override
	public void delete(Author author) throws DeleteAuthorWithBooksException {
		if (authorHasBooks(author)) {
			LOGGER.info("Generate DeleteAuthorWithBooksExceptione: {}", author);
			throw new DeleteAuthorWithBooksException();
		}
		authorDao.delete(author.getId());
		LOGGER.info("Delete {} from database.", author);
	}

	private boolean authorHasBooks(Author author) {
		BookFilter bookFilter = new BookFilter();
		List<Author> authors = new ArrayList<Author>();
		authors.add(author);
		bookFilter.setAuthors(authors);
		List<Book> books = bookDao.find(bookFilter);
		return !books.isEmpty();
	}

	@Override
	public void create(Author author) {
		authorDao.insert(author);
		LOGGER.info("save new {} in database", author);
	}

	@Override
	public List<Author> getAll() {
		return authorDao.getAll();
	}

	@Override
	public List<Author> find(String substring) {
		return authorDao.find(substring);
	}

	@Override
	public void saveOrUpdate(Author author) {
		if (author.getId() == null) {
			create(author);
		} else {
			update(author);
		}
	}

	@Override
	public List<Author> find(AuthorFilter filter) {
		return authorDao.find(filter);
	}

	@Override
	public Long count(AuthorFilter filter) {
		return authorDao.count(filter);
	}

}
