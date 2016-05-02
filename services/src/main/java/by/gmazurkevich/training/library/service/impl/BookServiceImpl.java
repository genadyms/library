package by.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.BookDao;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.datamodel.Comment;
import by.gmazurkevich.training.library.service.BookService;
import by.gmazurkevich.training.library.service.CommentService;

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
	public List<Book> getBooks(Catalog catalog) {
		return bookDao.getBooks(catalog);
	}

}
