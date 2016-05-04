package by.gmazurkevich.training.library.service;

import java.util.List;
import javax.transaction.Transactional;
import by.gmazurkevich.training.library.datamodel.CatalogOld;

public interface CatalogOldService {

	CatalogOld getCatalog(Long id);

	@Transactional
	void update(CatalogOld catalog) throws ModifiedParentCatalogException;

	@Transactional
	void delete(CatalogOld catalog) throws ElementHasChildException;

	@Transactional
	void create(CatalogOld catalog);

	List<CatalogOld> getCatalogs(String parentCatalog);

}
