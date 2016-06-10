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

import com.gmazurkevich.training.library.dataaccess.OrderDao;
import com.gmazurkevich.training.library.dataaccess.filters.OrderFilter;
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
		TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult();
	}

	 @Override
	    public List<Order> find(OrderFilter orderFilter) {
	        EntityManager em = getEntityManager();
	        CriteriaBuilder cb = em.getCriteriaBuilder();
	        CriteriaQuery<Order> cq = cb.createQuery(Order.class);
	        Root<Order> from = cq.from(Order.class);
	        cq.select(from);
	        // set sort params
	        
	        if (orderFilter.getSortProperty() != null) {
	        	cq.orderBy(new OrderImpl(from.get(orderFilter.getSortProperty()), orderFilter.isSortOrder()));
	        }

	        TypedQuery<Order> q = em.createQuery(cq);
	        setPaging(orderFilter, q);
	        return q.getResultList();
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
//		from.fetch(Order_.comments, JoinType.LEFT);
		cq.where(cb.equal(from.get(Order_.id), id));
		cq.distinct(true);
		TypedQuery<Order> q = em.createQuery(cq);
		return q.getSingleResult();
	}
}
