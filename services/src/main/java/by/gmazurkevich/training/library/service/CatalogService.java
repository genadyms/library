package by.gmazurkevich.training.library.service;

import java.util.List;
import javax.transaction.Transactional;
import by.gmazurkevich.training.library.datamodel.Catalog;

public interface CatalogService {

	Catalog getCatalog(Long id);

	@Transactional
	void update(Catalog catalog) throws ModifiedParentCatalogException;

	@Transactional
	void delete(Catalog catalog) throws ElementHasChildException;

	@Transactional
	void create(Catalog catalog);

	List<Catalog> getCatalogs(String parentCatalog);

}
