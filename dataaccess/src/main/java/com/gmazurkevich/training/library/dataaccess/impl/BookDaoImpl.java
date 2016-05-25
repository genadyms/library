package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

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
	public Long count(BookFilter filter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<Book> from = cq.from(Book.class);
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
		if (bookFilter.getCatalog() != null) {
			from.fetch(Book_.catalog);
			cq.where(cb.equal(from.get(Book_.catalog), bookFilter.getCatalog()));
		}
		if (bookFilter.getIsbn() != null) {
			cq.where(cb.equal(from.get(Book_.isbn), bookFilter.getIsbn()));
		}
		if (bookFilter.getPublishingOffice() != null) {
			cq.where(cb.equal(from.get(Book_.publishingOffice), bookFilter.getPublishingOffice()));
		}
		if (bookFilter.getTitle() != null) {
			cq.where(cb.equal(from.get(Book_.title), bookFilter.getTitle()));
		}
		if (bookFilter
				.getAuthors() != null/* && !bookFilter.getAuthors().isEmpty() */) {
			final List<Predicate> ands = new ArrayList();
			Set<Author> authors = bookFilter.getAuthors();
			for (final Author author : authors) {
				ands.add(cb.isMember(author, from.get(Book_.authors)));
			}
			cq.where(cb.and(ands.toArray(new Predicate[ands.size()])));
		}
		List<Book> res = em.createQuery(cq).getResultList();
		return res;
	}

}
