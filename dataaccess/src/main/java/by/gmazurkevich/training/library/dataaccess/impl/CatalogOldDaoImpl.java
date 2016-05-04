package by.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.CatalogOldDao;
import by.gmazurkevich.training.library.datamodel.CatalogOld;
import by.gmazurkevich.training.library.datamodel.Catalog_;

@Repository
public class CatalogOldDaoImpl extends AbstractDaoImpl<CatalogOld, Long> implements CatalogOldDao {

	protected CatalogOldDaoImpl() {
		super(CatalogOld.class);
	}

	@Override
	public List<CatalogOld> getCatalogs(String parentCatalog) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<CatalogOld> cq = cb.createQuery(CatalogOld.class);
		Root<CatalogOld> from = cq.from(CatalogOld.class);
		cq.select(from);
		cq.where(cb.equal(from.get(Catalog_.pathParent), parentCatalog));
		List<CatalogOld> res = em.createQuery(cq).getResultList();
		return res;
	}

}
