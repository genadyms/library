package by.gmazurkevich.training.library.service.impl;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.CatalogDao;
import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.service.CatalogService;

@Service
public class CatalogServiceImpl implements CatalogService {
	@Inject
	private CatalogDao catalogTestDao;

	@Override
	public void create(Catalog catalog) {
		if (catalog.getParent()!=null) {
			String catalogParentId = catalog.getParent().getId();
			if(!catalog.getId().contains(catalogParentId)){
				catalog.setId(String.format("%s/%s",catalogParentId,catalog.getId()));
			}
		}
		catalogTestDao.insert(catalog);
	}

	@Override
	public void update(Catalog catalog) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public Catalog getCatalogTest(String id) {
		return catalogTestDao.get(id);
	}

	@Override
	public List<Catalog> getCatalogs(Catalog parent) {
		return catalogTestDao.getChilds(parent);
	}

	@Override
	public List<Catalog> getRootCatalogs() {
		return catalogTestDao.getRootCatalogs();
	}

}
