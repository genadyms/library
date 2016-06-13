package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.CatalogFilter;
import com.gmazurkevich.training.library.datamodel.Catalog;

public interface CatalogDao extends AbstractDao<Catalog, Long> {

	List<Catalog> getChilds(Catalog parent);

	List<Catalog> find(CatalogFilter filter);
	
	
}
