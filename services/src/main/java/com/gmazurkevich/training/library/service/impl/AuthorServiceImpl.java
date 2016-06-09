package com.gmazurkevich.training.library.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.AuthorDao;
import com.gmazurkevich.training.library.dataaccess.BookDao;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.exception.DeleteAuthorWithBooksException;

@Service
public class AuthorServiceImpl implements AuthorService {

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
	}

	@Override
	public void delete(Author author) throws DeleteAuthorWithBooksException {
		if (authorHasBooks(author)) throw new DeleteAuthorWithBooksException();
		authorDao.delete(author.getId());
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
	}

	@Override
	public List<Author> getAll() {
		return authorDao.getAll();
	}

	@Override
	public List<Author> find(String substring) {
		return authorDao.find(substring);
	}

}
