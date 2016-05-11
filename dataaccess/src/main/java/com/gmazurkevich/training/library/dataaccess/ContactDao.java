package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.ContactFilter;
import com.gmazurkevich.training.library.datamodel.Contact;

public interface ContactDao extends AbstractDao<Contact, Long> {
	List<Contact> find(ContactFilter contactFilter);
}
