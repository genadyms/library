package com.gmazurkevich.training.library.service;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.dataaccess.ContactDao;
import com.gmazurkevich.training.library.datamodel.Contact;
import com.gmazurkevich.training.library.service.mocks.ContactUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class ContactServiceTest extends ContactUtil{

	@Inject
	private ContactService contactService;

	@Test
	public void test() {
		Assert.assertNotNull(contactService);
	}
	
	@Test
	public void testPersist(){
		Contact contact = ContactUtil.createContact();
		contactService.persist(contact);
		Assert.assertNotNull(contactService.getContact(contact.getId()));
	}
	
	@Test
	public void testDelete(){
		Contact contact = ContactUtil.createContact();
		contactService.persist(contact);
		Contact savedContact = contactService.getContact(contact.getId());
		Assert.assertNotNull(savedContact);
		contactService.delete(savedContact.getId());
		Assert.assertNull(contactService.getContact(savedContact.getId()));
		
	}
	
	@Test
	public void testUpdate(){
		Contact contact = ContactUtil.createContact();
		contactService.persist(contact);
		Contact savedContact = contactService.getContact(contact.getId());
		String newAddress = "new test "+savedContact.getAddress();
		savedContact.setAddress(newAddress);
		String newPhone = "new phone "+savedContact.getPhone();
		savedContact.setPhone(newPhone);
		contactService.update(savedContact);
		Contact updatedContact = contactService.getContact(savedContact.getId());
		Assert.assertEquals(savedContact.getAddress(), newAddress);
		Assert.assertEquals(savedContact.getPhone(), newPhone);
	}
	
	@Before
	public void clearDb(){
		ContactUtil.deleteAllContact(contactService);
	}
}
