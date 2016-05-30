package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.jpa.criteria.OrderImpl;
import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.DepartmentDao;
import com.gmazurkevich.training.library.dataaccess.filters.DepartmentFilter;
import com.gmazurkevich.training.library.datamodel.Department;

@Repository
public class DepartmentDaoImpl extends AbstractDaoImpl<Department, Long> implements DepartmentDao {

	protected DepartmentDaoImpl() {
		super(Department.class);
	}

	@Override
	public Long count(DepartmentFilter filter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<Department> from = cq.from(Department.class);
		cq.select(cb.count(from));
		TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult();
	}

	@Override
	public List<Department> find(DepartmentFilter departmentFilter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Department> cq = cb.createQuery(Department.class);
		Root<Department> from = cq.from(Department.class);
		cq.select(from);
		if (departmentFilter.getSortProperty() != null) {
			cq.orderBy(new OrderImpl(from.get(departmentFilter.getSortProperty()), departmentFilter.isSortOrder()));
		}
		TypedQuery<Department> q = em.createQuery(cq);
		setPaging(departmentFilter, q);
		return q.getResultList();
	}
}