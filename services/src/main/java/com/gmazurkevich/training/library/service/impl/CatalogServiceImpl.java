package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.CatalogDao;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyParentException;

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
	public void delete(Catalog catalog) throws DeleteNotEmptyParentException {
		if (catalogNotEmpty(catalog)) {
			throw new DeleteNotEmptyParentException();
		}
		catalogDao.delete(catalog.getId());
	}

	@Override
	public void update(Catalog catalog) {
		catalogDao.update(catalog);
	}

	@Override
	public List<Catalog> getChilds(Catalog parent) {
		return catalogDao.getChilds(parent);
	}

	private boolean catalogNotEmpty(Catalog catalog) {
		boolean isNotEmpty = true;
		if (getChilds(catalog).isEmpty()) {
			isNotEmpty = false;
		}
		if (!isNotEmpty) {
			BookFilter bookFilter = new BookFilter();
			bookFilter.setCatalog(catalog);
			if (bookService.find(bookFilter).isEmpty()) {
				isNotEmpty = false;
			}
		}
		return isNotEmpty;
	}

}
