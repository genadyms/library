package by.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.CatalogDao;
import by.gmazurkevich.training.library.datamodel.Catalog;

@Repository
public class CatalogDaoImpl extends AbstractDaoImpl<Catalog, Long> implements CatalogDao {

	protected CatalogDaoImpl() {
		super(Catalog.class);
	}
	
	
}
