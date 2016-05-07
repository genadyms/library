package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.AuthorDao;
import com.gmazurkevich.training.library.dataaccess.BookDao;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyParentException;

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
	public void delete(Author author) throws DeleteNotEmptyParentException {
//		if (authorHasBooks()) throw new ElementHasChildException();
		authorDao.delete(author.getId());
	}

	private boolean authorHasBooks() {
		BookFilter bf = new BookFilter(); 
		return true;
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
	public List<Book> getBooks(List<Author> authors) {
		BookFilter bf = new BookFilter();
		bf.setAuthors(authors);
		return bookDao.find(bf);
	}

}
