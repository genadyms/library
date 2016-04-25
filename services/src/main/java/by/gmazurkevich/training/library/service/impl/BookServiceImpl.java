package by.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.BookDao;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Comment;
import by.gmazurkevich.training.library.service.BookService;
import by.gmazurkevich.training.library.service.CommentService;

@Service
public class BookServiceImpl implements BookService {
	@Inject
	private BookDao bookDao;
	
	@Inject
	private CommentService commentService;
	
	@Override
	public void setCatalog(Book book) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addComment(Book book, Comment comment) {
		commentService.create(comment);
		book.getBookComment().add(comment);
		bookDao.update(book);
//		update(book);
	}

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
		// TODO Auto-generated method stub

	}

	@Override
	public Book getBook(Long id) {
		return bookDao.get(id);
	}

	@Override
	public List<Comment> getComments(Book book) {
		return null;
	}

}
