package by.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.CatalogDao;
import by.gmazurkevich.training.library.datamodel.Catalog;
import by.gmazurkevich.training.library.datamodel.Catalog_;

@Repository
public class CatalogDaoImpl extends AbstractDaoImpl<Catalog, Long> implements CatalogDao {

	protected CatalogDaoImpl() {
		super(Catalog.class);
	}

	@Override
	public List<Catalog> getCatalogs(String parentCatalog) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Catalog> cq = cb.createQuery(Catalog.class);
		Root<Catalog> from = cq.from(Catalog.class);
		cq.select(from);
		cq.where(cb.equal(from.get(Catalog_.pathParent), parentCatalog));
		List<Catalog> res = em.createQuery(cq).getResultList();
		return res;
	}

}
