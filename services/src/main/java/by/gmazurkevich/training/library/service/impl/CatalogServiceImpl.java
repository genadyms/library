package by.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.CatalogDao;
import by.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.service.BookService;
import by.gmazurkevich.training.library.service.CatalogService;
import by.gmazurkevich.training.library.service.ElementHasChildException;
import by.gmazurkevich.training.library.service.ModifiedParentCatalogException;

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
		String pathParent = catalog.getPathParent();
		if (pathParent!=null) {
			if(!catalog.getPath().contains(pathParent)){
				catalog.setPath(String.format("%s/%s",pathParent,catalog.getPath()));
			}
		}
		catalogDao.insert(catalog);
	}

	@Override
	public void delete(Catalog catalog) throws ElementHasChildException {
		if (hasChildElements(catalog)) {
			throw new ElementHasChildException();
		}
		catalogDao.delete(catalog.getId());
	}

	@Override
	public List<Catalog> getChildCatalogs(String parentCatalog) {
		return catalogDao.getChildCatalogs(parentCatalog);
	}

	private boolean hasChildElements(Catalog catalog) {
		if (catalogDao.getChildCatalogs(catalog.getPath()).size() > 0 || hasBooks(catalog)) {
			return true;
		}
		return false;
	}

	private boolean hasBooks(Catalog catalog) {
		BookFilter bookFilter = new BookFilter();
		bookFilter.setCatalog(catalog);
		return (bookService.find(bookFilter).size() > 0);
	}

	@Override
	public void update(Catalog catalog) throws ModifiedParentCatalogException {
		Catalog catalogDb = catalogDao.get(catalog.getId());
		if(catalog.getPathParent()!=null&&catalogDb.getPathParent()!=null){
			if(!catalog.getPathParent().equals(catalogDb.getPathParent())) {
				throw new ModifiedParentCatalogException();
			}
		} else {
			if(catalog.getPathParent()!=catalogDb.getPathParent()){
				throw new ModifiedParentCatalogException();
			}
		}
		catalogDb.setPath(catalog.getPath());
		catalogDao.update(catalogDb);
	}

}
