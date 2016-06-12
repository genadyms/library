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
		buildPredicateQuery(bookFilter, cb, cq, from);
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
		buildPredicateQuery(bookFilter, cb, cq, from);
		TypedQuery<Book> q = em.createQuery(cq);
		setPaging(bookFilter, q);
		return q.getResultList();
	}

	private void buildPredicateQuery(BookFilter bookFilter, CriteriaBuilder cb, CriteriaQuery<?> cq,
			Root<Book> from) {
		List<Predicate> allPredicates = new ArrayList<Predicate>();
		if (bookFilter.getAuthors() != null/* || !bookFilter.getAuthors().isEmpty()*/) {
			List<Predicate> authorsPredicates = new ArrayList<>();
			List<Author> authors = bookFilter.getAuthors();
			for (final Author author : authors) {
				authorsPredicates.add(cb.isMember(author, from.get(Book_.authors)));
			}
			Predicate fullPred = cb.or(authorsPredicates.toArray(new Predicate[authorsPredicates.size()]));
			allPredicates.add(fullPred);
		}
		if (bookFilter.getTitle() != null) {
			Expression<String> upper = cb.upper(from.get(Book_.title));
			Predicate predicate = cb.like(upper, "%" + bookFilter.getTitle().toUpperCase() + "%");
			allPredicates.add(predicate);
		}
		if (bookFilter.getPublishingOffice() != null) {
			Expression<String> upper = cb.upper(from.get(Book_.publishingOffice));
			Predicate predicate = cb.like(upper, "%" + bookFilter.getPublishingOffice().toUpperCase() + "%");
			allPredicates.add(predicate);
		}
		if (bookFilter.getCatalog() != null) {
			Predicate pred = cb.equal(from.get(Book_.catalog), bookFilter.getCatalog());
			allPredicates.add(pred);
		}
		if (bookFilter.getIsbn() != null) {
			Predicate pred = cb.equal(from.get(Book_.isbn), bookFilter.getIsbn());
			allPredicates.add(pred);
		}
		if (!allPredicates.isEmpty()) {
			if (bookFilter.isInnerJoin()) {
				cq.where(cb.and(allPredicates.toArray(new Predicate[allPredicates.size()])));
			} else {
				cq.where(cb.or(allPredicates.toArray(new Predicate[allPredicates.size()])));
			}
		}
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
