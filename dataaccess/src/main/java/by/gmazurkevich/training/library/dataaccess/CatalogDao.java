package by.gmazurkevich.training.library.dataaccess;

import java.util.List;
import java.util.Set;

import by.gmazurkevich.training.library.datamodel.Catalog;

public interface CatalogDao extends AbstractDao<Catalog, String> {

	List<Catalog> getChilds(Catalog parent);

	List<Catalog> getRootCatalogs();

}
