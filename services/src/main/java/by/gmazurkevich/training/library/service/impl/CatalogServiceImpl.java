package by.gmazurkevich.training.library.service.impl;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.PersistenceException;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.BookDao;
import by.gmazurkevich.training.library.dataaccess.CatalogDao;
import by.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.service.BookService;
import by.gmazurkevich.training.library.service.CatalogService;
import by.gmazurkevich.training.library.service.ParentElementException;

@Service
public class CatalogServiceImpl implements CatalogService {

	@Inject
	private CatalogDao catalogDao;

	@Inject
	private BookService bookService;

	@Override
	public Catalog getCatalog(Long id) {
		return catalogDao.get(id);
	}

	@Override
	public void create(Catalog catalog) {
		catalogDao.insert(catalog);
	}

	@Override
	public void delete(Catalog catalog) throws ParentElementException {
		if(catalogDao.getCatalogs(catalog.getPath()).size()>0||hasBooks(catalog)) {
			throw new ParentElementException();
		}
		catalogDao.delete(catalog.getId());
	}

	private boolean hasBooks(Catalog catalog) {
		BookFilter bookFilter = new BookFilter();
		bookFilter.setCatalog(catalog);
		return (bookService.find(bookFilter).size()>0);
	}

	@Override
	public List<Catalog> getCatalogs(String parentCatalog) {
		return catalogDao.getCatalogs(parentCatalog);
	}

}
