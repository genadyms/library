package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.AuthorDao;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Author_;

@Repository
public class AuthorDaoImpl extends AbstractDaoImpl<Author, Long> implements AuthorDao {

	protected AuthorDaoImpl() {
		super(Author.class);
	}

	public List<Author> find(String substring) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Author> cq = cb.createQuery(Author.class);
		Root<Author> from = cq.from(Author.class);
		Expression<String> upperFname = cb.upper(from.get(Author_.firstName));
		Expression<String> upperSname = cb.upper(from.get(Author_.secondName));
		Predicate predicateFname = cb.like(upperFname, "%" + substring.toUpperCase() + "%");
		Predicate predicateSname = cb.like(upperSname, "%" + substring.toUpperCase() + "%");
		cq.where(cb.or(predicateFname, predicateSname));
		TypedQuery<Author> q = em.createQuery(cq);
		return q.getResultList();
	}
}
