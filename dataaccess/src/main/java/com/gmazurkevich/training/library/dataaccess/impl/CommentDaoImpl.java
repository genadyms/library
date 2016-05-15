package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.CommentDao;
import com.gmazurkevich.training.library.dataaccess.filters.CommentFilter;
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
			cq.where(cb.equal(from.get(Comment_.book), commentFilter.getBook()));
		}
		if (commentFilter.getOrder() != null) {
			cq.where(cb.equal(from.get(Comment_.order), commentFilter.getOrder()));
		}
		List<Comment> res = em.createQuery(cq).getResultList();
		return res;
	}

}
