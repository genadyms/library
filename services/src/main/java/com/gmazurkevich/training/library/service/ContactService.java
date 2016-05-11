package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.ContactFilter;
import com.gmazurkevich.training.library.datamodel.Contact;

public interface ContactService {
	
	@Transactional
	void persist(Contact contact);
	
	@Transactional
	void update(Contact contact);
	
	@Transactional
	void delete(Long id);
	
	Contact getContact(Long id);
	
	List<Contact> find(ContactFilter contactFilter);

}
