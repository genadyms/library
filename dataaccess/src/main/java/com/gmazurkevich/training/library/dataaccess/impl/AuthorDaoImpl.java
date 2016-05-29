package com.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.AuthorDao;
import com.gmazurkevich.training.library.datamodel.Author;
@Repository
public class AuthorDaoImpl extends AbstractDaoImpl<Author,Long> implements AuthorDao {

	protected AuthorDaoImpl() {
		super(Author.class);
	}

//	@Override
//	public List<Author> find(Book book) {
//		EntityManager em = getEntityManager();
//        CriteriaBuilder cb = em.getCriteriaBuilder();
//        CriteriaQuery<Author> cq = cb.createQuery(Author.class);
//        Root<Author> from = cq.from(Author.class);
//        cq.select(from).where(cb.isMember(book,from.get(Author_.books)));
//        return em.createQuery(cq).getResultList();
//	}
//
//	
}
