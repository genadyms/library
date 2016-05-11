package com.gmazurkevich.training.library.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.ContactDao;
import com.gmazurkevich.training.library.datamodel.Contact;
import com.gmazurkevich.training.library.service.ContactService;
@Service
public class ContactServiceImpl implements ContactService {
	
	@Inject
	private ContactDao contactDao;
	
	@Override
	public void persist(Contact contact) {
		contactDao.insert(contact);
	}

	@Override
	public void update(Contact contact) {
		contactDao.update(contact);
	}

	@Override
	public void delete(Long id) {
		contactDao.delete(id);
	}

	@Override
	public Contact getContact(Long id) {
		return contactDao.get(id);	
	}

}
