package com.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.ContactDao;
import com.gmazurkevich.training.library.datamodel.Contact;


@Repository
public class ContactDaoImpl extends AbstractDaoImpl<Contact, Long> implements ContactDao {

	protected ContactDaoImpl() {
		super(Contact.class);
	}

}
