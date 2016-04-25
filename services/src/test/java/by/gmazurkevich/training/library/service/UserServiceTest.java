package by.gmazurkevich.training.library.service;

import javax.inject.Inject;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.Contact;
import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.datamodel.UserRole;
import by.gmazurkevich.training.library.datamodel.UserState;
import by.gmazurkevich.training.library.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class UserServiceTest {

	@Inject
	private UserService userService;

	private UserProfile userProfile;
	private UserCredentials userCredentials;
	private Contact contact;

	@Test
	public void testRegistration() {
		UserProfile registredProfile = userService.getProfile(userProfile.getId());
		UserCredentials registredCredentials = userService.getCredentials(userCredentials.getId());
		Assert.assertNotNull(registredProfile);
		Assert.assertNotNull(registredCredentials);
	}

	@Test
	public void testUpdateUserProfile() {
		String firstName = "OtherFirstName";
		String lastName = "OtherLastName";
		UserState state = UserState.BLOCKED;
		userProfile.setFirstName(firstName);
		userProfile.setLastName(lastName);
		userProfile.setUserState(state);
		userService.update(userProfile);
		Assert.assertEquals(firstName, userProfile.getFirstName());
		Assert.assertEquals(lastName, userProfile.getLastName());
		Assert.assertEquals(state, userProfile.getUserState());
	}

	@Test
	public void delete() {
		userService.delete(userProfile.getId());
		Assert.assertNull(userService.getProfile(userProfile.getId()));
		Assert.assertNull(userService.getCredentials(userCredentials.getId()));
	}

	@Before
	public void initializeData() {
		userProfile = new UserProfile();
		userCredentials = new UserCredentials();
		Long randomValue = System.currentTimeMillis();
		contact = new Contact();
		contact.setAddress("Grodno, Sovetskaya "+randomValue);
		contact.setPhone(String.valueOf(randomValue));
		userCredentials.setEmail( randomValue + "mail@test.by");
		userCredentials.setPassword("pswd");
		userProfile.setFirstName("Vasya");
		userProfile.setLastName("Ivanov");
		userProfile.setRole(UserRole.ADMIN);
		userProfile.setUserState(UserState.ACTIVE);
		userService.register(userProfile, userCredentials, contact);
	}

}
