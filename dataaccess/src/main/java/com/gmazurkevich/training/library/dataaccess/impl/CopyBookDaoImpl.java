package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.jpa.criteria.OrderImpl;
import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.CopyBookDao;
import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Book_;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.CopyBook_;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.datamodel.Issue_;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.datamodel.Order_;

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
		from.fetch(CopyBook_.department);
		if (filter.getSortProperty() != null) {
			cq.orderBy(new OrderImpl(from.get(filter.getSortProperty()), filter.isSortOrder()));
		}
		
		if(filter.getBook()!=null){
			cq.where(cb.equal(from.get(CopyBook_.book), filter.getBook()));
		}
		
//		if(filter.isFetchAll()){
//			from.fetch(CopyBook_.department, JoinType.INNER);
//			from.fetch(CopyBook_.orders, JoinType.LEFT);
//			from.fetch(CopyBook_.issues, JoinType.LEFT);
//		}
//		if(filter.isFindFreeCopyBook()) {
//			Join<CopyBook, Order> ordersJoin = from.join(CopyBook_.orders, JoinType.LEFT);
//			Predicate orderFreePredicate = cb.isNotNull(ordersJoin.get(Order_.closed));
//			Join<CopyBook, Issue> issuesJoin = from.join(CopyBook_.issues, JoinType.LEFT);
//			Predicate issuesFreePredicate = cb.isNotNull(issuesJoin.get(Issue_.dateReturn));
//			cq.where(cb.and(orderFreePredicate, issuesFreePredicate));		 
//		}
		TypedQuery<CopyBook> q = em.createQuery(cq);
		setPaging(filter, q);
		return q.getResultList();
	}

	@Override
	public Long count(CopyBookFilter filter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<CopyBook> from = cq.from(CopyBook.class);
		if (filter.getBook() != null) {
			cq.where(cb.equal(from.get(CopyBook_.book), filter.getBook()));
		}
		cq.select(cb.count(from));
		TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult();
	}

	@Override
	public CopyBook fetchAll(Long id) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<CopyBook> cq = cb.createQuery(CopyBook.class);
		Root<CopyBook> from = cq.from(CopyBook.class);
		cq.select(from);
		from.fetch(CopyBook_.department, JoinType.INNER);
		from.fetch(CopyBook_.orders, JoinType.INNER);
		from.fetch(CopyBook_.issues, JoinType.LEFT);
		from.fetch(CopyBook_.book, JoinType.INNER);
		cq.where(cb.equal(from.get(Book_.id), id));
		cq.distinct(true);
		TypedQuery<CopyBook> q = em.createQuery(cq);
		return q.getSingleResult();
	}
	
}