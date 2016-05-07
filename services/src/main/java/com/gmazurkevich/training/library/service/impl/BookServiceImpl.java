package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.BookDao;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.datamodel.Comment;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CommentService;

@Service
public class BookServiceImpl implements BookService {
	@Inject
	private BookDao bookDao;

	@Override
	public void update(Book book) {
		bookDao.update(book);
	}

	@Override
	public void create(Book book) {
		bookDao.insert(book);
	}

	@Override
	public void delete(Book book) {
		bookDao.delete(book.getId());
	}

	@Override
	public Book getBook(Long id) {
		return bookDao.get(id);
	}

	@Override
	public List<Book> find(BookFilter bookFilter) {
		return bookDao.find(bookFilter);
	}

	
}