package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.CatalogDao;
import com.gmazurkevich.training.library.datamodel.Catalog;

import com.gmazurkevich.training.library.datamodel.Catalog_;

@Repository
public class CatalogDaoImpl extends AbstractDaoImpl<Catalog, Long> implements CatalogDao {

	protected CatalogDaoImpl() {
		super(Catalog.class);
	}

	@Override
	public List<Catalog> getChilds(Catalog parent) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Catalog> cq = cb.createQuery(Catalog.class);
		Root<Catalog> from = cq.from(Catalog.class);
		if (null == parent) {
			cq.where(cb.isNull(from.get(Catalog_.parent)));
		} else {
			from.fetch(Catalog_.parent);
			cq.select(from).where(cb.equal(from.get(Catalog_.parent), parent));
		}
		List<Catalog> res = em.createQuery(cq).getResultList();
		return res;
	}

}
