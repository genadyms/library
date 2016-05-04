package by.gmazurkevich.training.library.service;

import java.util.List;
import javax.transaction.Transactional;

import by.gmazurkevich.training.library.datamodel.CatalogTest;

public interface CatalogTestService {

	@Transactional
	void create(CatalogTest catalog);
	
	@Transactional
	void update(CatalogTest catalog);
	
	@Transactional
	void delete(String id);
	
	CatalogTest getCatalogTest(String id);
	
	List<CatalogTest> getCatalogs(CatalogTest parent);
	
	List<CatalogTest> getRootCatalogs();
}
