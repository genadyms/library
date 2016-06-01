package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;

import org.hibernate.jpa.criteria.OrderImpl;
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
		// set sort params

		if (filter.getSortProperty() != null) {
			cq.orderBy(new OrderImpl(from.get(filter.getSortProperty()), filter.isSortOrder()));
		}

		TypedQuery<CopyBook> q = em.createQuery(cq);
		setPaging(filter, q);
		return q.getResultList();
	}
	
//	@Override
//	public List<CopyBook> find(CopyBookFilter filter) {
//		EntityManager em = getEntityManager();
//		CriteriaBuilder cb = em.getCriteriaBuilder();
//		CriteriaQuery<CopyBook> cq = cb.createQuery(CopyBook.class);
//		Root<CopyBook> from = cq.from(CopyBook.class);
//		cq.select(from);
//		if (filter.getBook() != null) {
//			if (filter.isFindFreeCopyBook()) {
//				// Predicate noOrders = cb.isNull(from.get(CopyBook_.orders));
//				Join<CopyBook, Order> orders = from.join(CopyBook_.orders, JoinType.LEFT);
//				cq.where(cb.and(cb.isNotNull(orders.get(Order_.closed)),
//						cb.equal(from.get(CopyBook_.book), filter.getBook())));
//			} else {
//				cq.where(cb.equal(from.get(CopyBook_.book), filter.getBook()));
//			}
//		}
//		if (filter.getDepartment() != null) {
//			cq.where(cb.equal(from.get(CopyBook_.department), filter.getDepartment()));
//		}
//		List<CopyBook> res = em.createQuery(cq).getResultList();
//		return res;
//	}

	@Override
	public Long count() {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<CopyBook> from = cq.from(CopyBook.class);
		cq.select(cb.count(from));
		TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult();
	}

	@Override
	public CopyBook getCopyBookFetchAll(Long id) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<CopyBook> cq = cb.createQuery(CopyBook.class);
		Root<CopyBook> from = cq.from(CopyBook.class);
		cq.select(from);
		from.fetch(CopyBook_.book, JoinType.INNER);
		from.fetch(CopyBook_.department, JoinType.LEFT);
		cq.where(cb.equal(from.get(CopyBook_.id), id));
		cq.distinct(true);
		TypedQuery<CopyBook> q = em.createQuery(cq);
		return q.getSingleResult();
	}
}