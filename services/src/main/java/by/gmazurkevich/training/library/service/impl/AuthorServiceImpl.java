package by.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.AuthorDao;
import by.gmazurkevich.training.library.dataaccess.BookDao;
import by.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import by.gmazurkevich.training.library.datamodel.Author;
import by.gmazurkevich.training.library.service.AuthorService;
import by.gmazurkevich.training.library.service.ElementHasChildException;

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
	public void delete(Author author) throws ElementHasChildException {
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

}
