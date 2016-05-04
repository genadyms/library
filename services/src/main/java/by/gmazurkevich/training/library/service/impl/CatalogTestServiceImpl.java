package by.gmazurkevich.training.library.service.impl;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.CatalogTestDao;
import by.gmazurkevich.training.library.datamodel.CatalogTest;
import by.gmazurkevich.training.library.service.CatalogTestService;

@Service
public class CatalogTestServiceImpl implements CatalogTestService {
	@Inject
	private CatalogTestDao catalogTestDao;

	@Override
	public void create(CatalogTest catalog) {
		if (catalog.getParent()!=null) {
			String catalogParentId = catalog.getParent().getId();
			if(!catalog.getId().contains(catalogParentId)){
				catalog.setId(String.format("%s/%s",catalogParentId,catalog.getId()));
			}
		}
		catalogTestDao.insert(catalog);
	}

	@Override
	public void update(CatalogTest catalog) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public CatalogTest getCatalogTest(String id) {
		return catalogTestDao.get(id);
	}

	@Override
	public List<CatalogTest> getCatalogs(CatalogTest parent) {
		return catalogTestDao.getChilds(parent);
	}

	@Override
	public List<CatalogTest> getRootCatalogs() {
		return catalogTestDao.getRootCatalogs();
	}

}
