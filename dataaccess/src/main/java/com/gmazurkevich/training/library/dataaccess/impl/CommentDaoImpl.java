package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.CommentDao;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.dataaccess.filters.CommentFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Book_;
import com.gmazurkevich.training.library.datamodel.Comment;
import com.gmazurkevich.training.library.datamodel.Comment_;

@Repository
public class CommentDaoImpl extends AbstractDaoImpl<Comment, Long> implements CommentDao {

	protected CommentDaoImpl() {
		super(Comment.class);
	}

	@Override
	public List<Comment> find(CommentFilter commentFilter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Comment> cq = cb.createQuery(Comment.class);
		Root<Comment> from = cq.from(Comment.class);
		cq.select(from);
		if (commentFilter.getBook() != null) {
			cq.where(cb.equal(from.get(Comment_.id), commentFilter.getBook().getBookComment()));
		}
//		if (commentFilter.getIsbn() != null) {
//			cq.where(cb.equal(from.get(Book_.isbn), commentFilter.getIsbn()));
//		}
//		if (commentFilter.getPublishingOffice() != null) {
//			cq.where(cb.equal(from.get(Book_.publishingOffice), commentFilter.getPublishingOffice()));
//		}
//		if (commentFilter.getTitle() != null) {
//			cq.where(cb.equal(from.get(Book_.title), commentFilter.getTitle()));
//		}
//		if (commentFilter
//				.getAuthors() != null/* && !bookFilter.getAuthors().isEmpty() */) {
//			final List<Predicate> ands = new ArrayList();
//			Set<Author> authors = commentFilter.getAuthors();
//			for (final Author author : authors) {
//				ands.add(cb.isMember(author, from.get(Book_.authors)));
//			}
//			cq.where(cb.and(ands.toArray(new Predicate[ands.size()])));
//		}
		List<Comment> res = em.createQuery(cq).getResultList();
		return res;
//		return null;
	}

}
