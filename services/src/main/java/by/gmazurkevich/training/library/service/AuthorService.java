package by.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import by.gmazurkevich.training.library.datamodel.Author;
import by.gmazurkevich.training.library.datamodel.Book;

public interface AuthorService {

	Author getAuthor(Long id);

	@Transactional
	void update(Author author);

	@Transactional
	void delete(Author author) throws ElementHasChildException;

	@Transactional
	void create(Author author);
	
	List<Author> getAll();
	
	List<Book> getBooks(List<Author> authors);

}
