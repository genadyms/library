package com.gmazurkevich.training.library.service;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.datamodel.Contact;

public interface ContactService {
	
	@Transactional
	void persist(Contact contact);
	
	@Transactional
	void update(Contact contact);
	
	@Transactional
	void delete(Long id);
	
	Contact getContact(Long id);
	

}
