package com.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.ContactDao;
import com.gmazurkevich.training.library.dataaccess.filters.ContactFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Book_;
import com.gmazurkevich.training.library.datamodel.Contact;
import com.gmazurkevich.training.library.datamodel.Contact_;

@Repository
public class ContactDaoImpl extends AbstractDaoImpl<Contact, Long> implements ContactDao {

	protected ContactDaoImpl() {
		super(Contact.class);
	}

	@Override
	public List<Contact> find(ContactFilter contactFilter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Contact> cq = cb.createQuery(Contact.class);
		Root<Contact> from = cq.from(Contact.class);
		cq.select(from);
		if (contactFilter.getAddress() != null) {
			cq.where(cb.equal(from.get(Contact_.address), contactFilter.getAddress()));
		}
		if (contactFilter.getPhone() != null) {
			cq.where(cb.equal(from.get(Contact_.phone), contactFilter.getPhone()));
		}
		return em.createQuery(cq).getResultList();
	
	}

}
