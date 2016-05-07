package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
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
	public List<Book> find(BookFilter bookFilter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Book> cq = cb.createQuery(Book.class);
		Root<Book> from = cq.from(Book.class);
		cq.select(from);
		if (bookFilter.getCatalog() != null) {
			from.fetch(Book_.catalog, JoinType.LEFT);
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
		if (bookFilter.getAuthors() != null && !bookFilter.getAuthors().isEmpty()) {
			from.fetch(Book_.author);
			Join<Book, Author> authors = from.join(Book_.author);
			cq.where(authors.in(bookFilter.getAuthors()));
		}
		List<Book> res = em.createQuery(cq).getResultList();
		return res;
	}

}
