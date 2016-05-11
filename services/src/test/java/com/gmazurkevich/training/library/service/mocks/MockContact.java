package com.gmazurkevich.training.library.service.mocks;

import com.gmazurkevich.training.library.datamodel.Contact;
import com.gmazurkevich.training.library.service.ContactService;

public class MockContact {
	
	public static Contact createContact(){
		Contact contact = new Contact();
		contact.setAddress("Grodno " + System.currentTimeMillis());
		contact.setPhone("phone "+System.currentTimeMillis());
		return contact;
	}
	
	public static void deleteAllContact(ContactService contactService){
	}
}
