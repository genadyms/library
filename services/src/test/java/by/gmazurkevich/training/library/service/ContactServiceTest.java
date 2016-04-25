package by.gmazurkevich.training.library.service;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.dataaccess.ContactDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class ContactServiceTest {

	@Inject
	private ContactDao contactDao;

	@Test
	public void test() {
		Assert.assertNotNull(contactDao);
	}
}
