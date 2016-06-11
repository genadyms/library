package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.jpa.criteria.OrderImpl;
import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.IssueDao;
import com.gmazurkevich.training.library.dataaccess.filters.IssueFilter;
import com.gmazurkevich.training.library.datamodel.Issue;

@Repository
public class IssueDaoImpl extends AbstractDaoImpl<Issue, Long> implements IssueDao {

	protected IssueDaoImpl() {
		super(Issue.class);
	}

	@Override
	public List<Issue> find(IssueFilter filter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Issue> cq = cb.createQuery(Issue.class);
		Root<Issue> from = cq.from(Issue.class);
		cq.select(from);
		if (filter.getSortProperty() != null) {
			cq.orderBy(new OrderImpl(from.get(filter.getSortProperty()), filter.isSortOrder()));
		}
		TypedQuery<Issue> q = em.createQuery(cq);
		setPaging(filter, q);
		return q.getResultList();
	}

	@Override
	public long count(IssueFilter filter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<Issue> from = cq.from(Issue.class);
		cq.select(cb.count(from));
		TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult();
	}
}
