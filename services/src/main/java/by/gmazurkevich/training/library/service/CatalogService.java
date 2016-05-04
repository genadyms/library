package by.gmazurkevich.training.library.service;

import java.util.List;
import javax.transaction.Transactional;

import by.gmazurkevich.training.library.datamodel.Catalog;

public interface CatalogService {

	@Transactional
	void create(Catalog catalog);
	
	@Transactional
	void update(Catalog catalog);
	
	@Transactional
	void delete(String id);
	
	Catalog getCatalogTest(String id);
	
	List<Catalog> getCatalogs(Catalog parent);
	
	List<Catalog> getRootCatalogs();
}
