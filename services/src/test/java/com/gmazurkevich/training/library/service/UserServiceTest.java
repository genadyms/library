package com.gmazurkevich.training.library.service;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserState;
import com.gmazurkevich.training.library.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class UserServiceTest {
	@Inject
	private UserService userService;

//	@Test
//	public void testRegistration() {
//		MockUser mUser = registerUser();
//		UserProfile registredProfile = userService.getProfile(mUser.getUserProfile().getId());
//		UserCredentials registredCredentials = userService.getCredentials(mUser.getUserCredentials().getId());
//		Assert.assertNotNull(registredProfile);
//		Assert.assertNotNull(registredCredentials);
//		clearDb(mUser);
//	}
//
//	@Test
//	public void testUpdateUserProfile() {
//		MockUser mUser = registerUser();
//		UserProfile userProfile = mUser.getUserProfile();
//		String firstName = "OtherFirstName";
//		String lastName = "OtherLastName";
//		UserState state = UserState.BLOCKED;
//		userProfile.setFirstName(firstName);
//		userProfile.setLastName(lastName);
//		userProfile.setUserState(state);
//		userService.update(userProfile);
//		Assert.assertEquals(firstName, userProfile.getFirstName());
//		Assert.assertEquals(lastName, userProfile.getLastName());
//		Assert.assertEquals(state, userProfile.getUserState());
//		clearDb(mUser);
//	}
//
//	@Test
//	public void delete() {
//		MockUser mUser = registerUser();
//		UserProfile userProfile = mUser.getUserProfile();
//		UserCredentials userCredentials = mUser.getUserCredentials();
//		userService.delete(userProfile.getId());
//		Assert.assertNull(userService.getProfile(userProfile.getId()));
//		Assert.assertNull(userService.getCredentials(userCredentials.getId()));
//	}
//
////	@Test
////	public void testGetAll() {
////		int countUsers = 105;
////		MockUser[] users = new MockUser[countUsers];
////		for (int i = 0; i < countUsers; i++) {
////			users[i] = registerUser();
////		}
////		Assert.assertEquals(userService.getAll().size(), countUsers);
////		clearDb(users);
////	}
//
//	public MockUser registerUser() {
//		MockUser mUser = new MockUser();
//		userService.register(mUser.getUserProfile(), mUser.getUserCredentials());
//		return mUser;
//	}
//
//	private void clearDb(MockUser[] users) {
//		for (MockUser user : users) {
//			clearDb(user);
//		}
//	}
//
//	private void clearDb(MockUser user) {
//		userService.delete(user.getUserProfile().getId());
//	}

}
