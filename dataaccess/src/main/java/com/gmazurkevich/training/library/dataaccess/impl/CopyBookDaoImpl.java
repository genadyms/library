package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.CopyBookDao;
import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.CopyBook_;

@Repository
public class CopyBookDaoImpl extends AbstractDaoImpl<CopyBook, Long> implements CopyBookDao {
	protected CopyBookDaoImpl() {
		super(CopyBook.class);
	}

	@Override
	public List<CopyBook> find(CopyBookFilter filter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<CopyBook> cq = cb.createQuery(CopyBook.class);
		Root<CopyBook> from = cq.from(CopyBook.class);
		cq.select(from);
		if (filter.getBook() != null) {
			cq.where(cb.equal(from.get(CopyBook_.book), filter.getBook()));
		}
		if (filter.getDepartment() != null) {
			cq.where(cb.equal(from.get(CopyBook_.department), filter.getDepartment()));
		}
		List<CopyBook> res = em.createQuery(cq).getResultList();
		return res;
	}
}