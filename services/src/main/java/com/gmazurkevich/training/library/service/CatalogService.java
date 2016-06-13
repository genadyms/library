package com.gmazurkevich.training.library.service;

import java.util.List;
import javax.transaction.Transactional;

import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyItemException;

public interface CatalogService {

	Catalog getCatalog(Long id);

	@Transactional
	void update(Catalog catalog);

	@Transactional
	void delete(Catalog catalog) throws DeleteNotEmptyItemException;

	@Transactional
	void create(Catalog catalog);

	List<Catalog> getCatalogs(Catalog parent);

	List<Catalog> getAll();
	
	List<Catalog> getCatalogsWithBooks();
	
}
