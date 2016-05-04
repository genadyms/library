package by.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.CatalogOldDao;
import by.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import by.gmazurkevich.training.library.datamodel.CatalogOld;
import by.gmazurkevich.training.library.service.BookService;
import by.gmazurkevich.training.library.service.CatalogOldService;
import by.gmazurkevich.training.library.service.ElementHasChildException;
import by.gmazurkevich.training.library.service.ModifiedParentCatalogException;

@Service
public class CatalogOldServiceImpl implements CatalogOldService {

	@Inject
	private CatalogOldDao catalogDao;

	@Inject
	private BookService bookService;

	@Override
	public CatalogOld getCatalog(Long id) {
		return catalogDao.get(id);
	}

	@Override
	public void create(CatalogOld catalog) {
		catalogDao.insert(catalog);
	}

	@Override
	public void delete(CatalogOld catalog) throws ElementHasChildException {
		if (hasChildElements(catalog)) {
			throw new ElementHasChildException();
		}
		catalogDao.delete(catalog.getId());
	}

	@Override
	public List<CatalogOld> getCatalogs(String parentCatalog) {
		return catalogDao.getCatalogs(parentCatalog);
	}

	private boolean hasChildElements(CatalogOld catalog) {
		if (catalogDao.getCatalogs(catalog.getPath()).size() > 0 || hasBooks(catalog)) {
			return true;
		}
		return false;
	}

	private boolean hasBooks(CatalogOld catalog) {
		BookFilter bookFilter = new BookFilter();
		bookFilter.setCatalog(catalog);
		return (bookService.find(bookFilter).size() > 0);
	}

	@Override
	public void update(CatalogOld catalog) throws ModifiedParentCatalogException {
		CatalogOld catalogDb = catalogDao.get(catalog.getId());
		if (!catalogDb.getPathParent().equals(catalog.getPathParent())) {
			throw new ModifiedParentCatalogException();
		}
		catalogDb.setPath(catalog.getPath());
		catalogDao.update(catalogDb);
	}

}
