package by.gmazurkevich.training.library.dataaccess;

import java.util.List;

import by.gmazurkevich.training.library.datamodel.CatalogOld;

public interface CatalogOldDao extends AbstractDao<CatalogOld, Long> {

	List<CatalogOld> getCatalogs(String parentCatalog);
	
}
