package by.gmazurkevich.training.library.dataaccess;

import java.util.List;

import by.gmazurkevich.training.library.datamodel.Catalog;

public interface CatalogDao extends AbstractDao<Catalog, Long> {

	List<Catalog> getChildCatalogs(String parentCatalog);
	
}
