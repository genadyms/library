package by.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.BookDao;
import by.gmazurkevich.training.library.dataaccess.CatalogDao;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.service.CatalogService;

@Service
public class CatalogServiceImpl implements CatalogService {
	
	@Inject
	private CatalogDao catalogDao;
	
//	@Inject
//	private BookDao bookDao;
	
	@Override
	public Catalog getCatalog(Long id) {
		return catalogDao.get(id);
	}

	@Override
	public void create(Catalog catalog) {
		catalogDao.insert(catalog);
	}

//	@Override
//	public void addBook(Catalog catalog, Book book) {
////		book.setCatalog(catalog);
////		bookDao.update(book);
//	}
//
//	@Override
//	public void deleteBook(Catalog catalog, Book book) {
//	}
//
//	@Override
//	public void update(Catalog catalog) {
//		catalogDao.update(catalog);
//	}

	@Override
	public void delete(Catalog catalog) {
		catalogDao.delete(catalog.getId());
	}
//
//	@Override
//	public List<Catalog> getChildCatalog() {
//		return null;
//	}
//
//	@Override
//	public List<Book> getBooks() {
//		return null;
//	}

}
