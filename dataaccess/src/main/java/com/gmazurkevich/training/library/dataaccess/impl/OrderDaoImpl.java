package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.jpa.criteria.OrderImpl;
import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.OrderDao;
import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
import com.gmazurkevich.training.library.datamodel.Issue_;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.datamodel.Order_;

@Repository
public class OrderDaoImpl extends AbstractDaoImpl<Order, Long> implements OrderDao {

	protected OrderDaoImpl() {
		super(Order.class);
	}

	@Override
	public Long count(OrderFilter filter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<Order> from = cq.from(Order.class);
		cq.select(cb.count(from));
		if(filter.getReader()!=null){
			cq.where(cb.equal(from.get(Order_.reader), filter.getReader()));
		}
		TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult();
	}

	@Override
	public List<Order> find(OrderFilter filter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Order> cq = cb.createQuery(Order.class);
		Root<Order> from = cq.from(Order.class);
		cq.select(from);
		from.fetch(Order_.copyBook);
		if (filter.getSortProperty() != null) {
			cq.orderBy(new OrderImpl(from.get(filter.getSortProperty()), filter.isSortOrder()));
		}
		if (filter.getCopyBook() != null) {
			cq.where(cb.equal(from.get(Order_.copyBook), filter.getCopyBook()));
		}
		if(filter.getReader()!=null){
			cq.where(cb.equal(from.get(Order_.reader), filter.getReader()));
		}
		TypedQuery<Order> q = em.createQuery(cq);
		setPaging(filter, q);
		return q.getResultList();
	}

	@Override
	public Order findCopyBook(OrderFilter filter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Order> cq = cb.createQuery(Order.class);
		Root<Order> from = cq.from(Order.class);
		cq.select(from);
		if (filter.getCopyBook() != null && filter.isStatusActive()) {
			cq.where(cb.and(cb.isNotNull(from.get(Order_.copyBook)),
					cb.equal(from.get(Order_.copyBook), filter.getCopyBook()), cb.isNull(from.get(Order_.closed))));
		}
		cq.distinct(true);
		TypedQuery<Order> q = em.createQuery(cq);
		Order current = q.getSingleResult();
		return current;
	}

	@Override
	public Order getOrderFetchAll(Long id) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Order> cq = cb.createQuery(Order.class);
		Root<Order> from = cq.from(Order.class);
		cq.select(from);
		from.fetch(Order_.reader, JoinType.LEFT);
		from.fetch(Order_.librarian, JoinType.LEFT);
		from.fetch(Order_.copyBook, JoinType.LEFT);
		// from.fetch(Order_.comments, JoinType.LEFT);
		cq.where(cb.equal(from.get(Order_.id), id));
		cq.distinct(true);
		TypedQuery<Order> q = em.createQuery(cq);
		return q.getSingleResult();
	}
}
