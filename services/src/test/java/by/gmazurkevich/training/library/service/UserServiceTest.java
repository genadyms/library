package by.gmazurkevich.training.library.service;

import javax.inject.Inject;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.datamodel.UserState;
import by.gmazurkevich.training.library.service.UserService;
import by.gmazurkevich.training.library.service.util.MockUser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class UserServiceTest extends MockUser {
	@Inject
	private UserService userService;

	public UserServiceTest() {
		super();
	}
	@Test
	public void testRegistration() {
		userService.register(userProfile, userCredentials);
		UserProfile registredProfile = userService.getProfile(userProfile.getId());
		UserCredentials registredCredentials = userService.getCredentials(userCredentials.getId());
		Assert.assertNotNull(registredProfile);
		Assert.assertNotNull(registredCredentials);
	}

	@Test
	public void testUpdateUserProfile() {
		userService.register(userProfile, userCredentials);
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
		userService.register(userProfile, userCredentials);
		userService.delete(userProfile.getId());
		Assert.assertNull(userService.getProfile(userProfile.getId()));
		Assert.assertNull(userService.getCredentials(userCredentials.getId()));
	}

}
