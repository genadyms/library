package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.BookDao;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.AuthorServiceTest;
import com.gmazurkevich.training.library.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	private static Logger LOGGER = LoggerFactory.getLogger(BookServiceImpl.class);
	@Inject
	private BookDao bookDao;

	@Override
	public Long count(BookFilter filter) {
		return bookDao.count(filter);
	}

	@Override
	public void update(Book book) {
		bookDao.update(book);
		LOGGER.info("Update {}", book);
	}

	@Override
	public void save(Book book) {
		bookDao.insert(book);
		LOGGER.info("Save {}", book);
	}

	@Override
	public void delete(Book book) {
		bookDao.delete(book.getId());
		LOGGER.info("Delete {}", book);
	}

	@Override
	public Book getBook(Long id) {
		return bookDao.get(id);
	}

	@Override
	public Book getBookFetchAll(Book book) {
		return bookDao.getBookFetchAll(book.getId());
	}

	@Override
	public List<Book> find(BookFilter bookFilter) {
		return bookDao.find(bookFilter);
	}

	@Override
	public void saveOrUpdate(Book book) {
		if (book.getId() == null) {
			bookDao.insert(book);
		} else {
			bookDao.update(book);
		}
	}

}