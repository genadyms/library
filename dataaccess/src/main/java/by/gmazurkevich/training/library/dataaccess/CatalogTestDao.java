package by.gmazurkevich.training.library.dataaccess;

import java.util.List;
import java.util.Set;

import by.gmazurkevich.training.library.datamodel.CatalogTest;

public interface CatalogTestDao extends AbstractDao<CatalogTest, String> {

	List<CatalogTest> getChilds(CatalogTest parent);

	List<CatalogTest> getRootCatalogs();

}
