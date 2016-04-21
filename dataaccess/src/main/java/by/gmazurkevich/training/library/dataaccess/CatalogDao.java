package by.gmazurkevich.training.library.dataaccess;

import by.gmazurkevich.training.library.datamodel.Catalog;

public interface CatalogDao {
	Catalog get(Long id);

	Catalog save();
}
