package by.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Comment;

public interface BookService {
	
//	@Transactional
//	void setCatalog(Book book);
//	
//	@Transactional
//	void addComment(Book book, Comment comment);
	
	@Transactional
	void update(Book book);
	
	@Transactional
	void create(Book book);
	
	@Transactional
	void delete(Book book);
	
	Book getBook(Long id);
	
//	List<Comment> getComments(Book book);
}
