package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.jpa.criteria.OrderImpl;
import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.BookDao;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Book_;

@Repository
public class BookDaoImpl extends AbstractDaoImpl<Book, Long> implements BookDao {

	protected BookDaoImpl() {
		super(Book.class);
	}

	@Override
	public Long count(BookFilter bookFilter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<Book> from = cq.from(Book.class);
		if (bookFilter.getCatalog() != null) {
			cq.where(cb.equal(from.get(Book_.catalog), bookFilter.getCatalog()));
		}

		List<Predicate> ands = getPredicates(bookFilter, cb, from);
		if (!ands.isEmpty()) {
			cq.where(cb.or(ands.toArray(new Predicate[ands.size()])));
		}
		cq.select(cb.count(from));
		TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult();
	}

	@Override
	public List<Book> find(BookFilter bookFilter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Book> cq = cb.createQuery(Book.class);
		Root<Book> from = cq.from(Book.class);
		cq.select(from);
		if (bookFilter.getSortProperty() != null) {
			cq.orderBy(new OrderImpl(from.get(bookFilter.getSortProperty()), bookFilter.isSortOrder()));
		}
		List<Predicate> ands = getPredicates(bookFilter, cb, from);
		if (!ands.isEmpty()) {
			cq.where(cb.or(ands.toArray(new Predicate[ands.size()])));
		}
		TypedQuery<Book> q = em.createQuery(cq);
		setPaging(bookFilter, q);
		return q.getResultList();
	}

	private List<Predicate> getPredicates(BookFilter bookFilter, CriteriaBuilder cb, Root<Book> from) {
		final List<Predicate> ands = new ArrayList();
		if (bookFilter.getTitle() != null) {
			Expression<String> upper = cb.upper(from.get(Book_.title));
			Predicate predicate = cb.like(upper, "%" + bookFilter.getTitle().toUpperCase() + "%");
			ands.add(predicate);
		}
		if (bookFilter
				.getAuthors() != null/* && !bookFilter.getAuthors().isEmpty() */) {

			List<Author> authors = bookFilter.getAuthors();
			for (final Author author : authors) {
				ands.add(cb.isMember(author, from.get(Book_.authors)));
			}
		}
		if (bookFilter.getCatalog() != null) {
			ands.add(cb.equal(from.get(Book_.catalog), bookFilter.getCatalog()));
		}
		return ands;

	}

	@Override
	public Book getBookFetchAll(Long id) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Book> cq = cb.createQuery(Book.class);
		Root<Book> from = cq.from(Book.class);
		cq.select(from);
		from.fetch(Book_.authors, JoinType.LEFT);
		from.fetch(Book_.catalog, JoinType.LEFT);
		cq.where(cb.equal(from.get(Book_.id), id));
		cq.distinct(true);
		TypedQuery<Book> q = em.createQuery(cq);
		return q.getSingleResult();
	}
}
