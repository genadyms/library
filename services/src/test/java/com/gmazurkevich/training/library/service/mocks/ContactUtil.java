package com.gmazurkevich.training.library.service.mocks;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.ContactFilter;
import com.gmazurkevich.training.library.datamodel.Contact;
import com.gmazurkevich.training.library.service.ContactService;

public class ContactUtil {
	
	public static Contact createContact(){
		Contact contact = new Contact();
		contact.setAddress("Grodno " + System.currentTimeMillis());
		contact.setPhone("phone "+System.currentTimeMillis());
		return contact;
	}
	
	public static void deleteAllContact(ContactService contactService){
		ContactFilter cf = new ContactFilter();
		List<Contact> contacts = contactService.find(cf);
		for(Contact contact : contacts){
			contactService.delete(contact.getId());
		}
	}
}
