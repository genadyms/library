package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.sql.Delete;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.dataaccess.filters.UserFilter;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.datamodel.UserState;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.service.exception.DeleteActiveUserException;
import com.gmazurkevich.training.library.service.mocks.UserUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class UserServiceTest {
	
	@Inject
	private UserService userService;

	@Test
	public void testRegistration() {
		UserProfile userProfile = UserUtil.createUser();
		UserCredentials userCredentials = userProfile.getUserCredentials();
		userService.register(userProfile, userCredentials);
		UserProfile registredProfile = userService.getProfile(userProfile.getId());
		UserCredentials registredCredentials = userService.getCredentials(userCredentials.getId());
		Assert.assertNotNull(registredProfile);
		Assert.assertNotNull(registredCredentials);
	}

	@Test
	public void testUpdate() {
		UserProfile userProfile = UserUtil.createUser();
		UserCredentials userCredentials = userProfile.getUserCredentials();
		userService.register(userProfile, userCredentials);
		UserProfile savedUserProfile = userService.getProfile(userProfile.getId());
		String firstName = "OtherFirstName";
		String lastName = "OtherLastName";
		String newPhone = "(095)-1234-54321";
		String newAddress = "Grodno, ul.NewStreet";
		UserRole newRole = UserRole.READER;
		UserState state = UserState.NOT_ACTIVE;
		savedUserProfile.setFirstName(firstName);
		savedUserProfile.setLastName(lastName);
		savedUserProfile.setState(state);
		savedUserProfile.setPhone(newPhone);
		savedUserProfile.setAddress(newAddress);
		savedUserProfile.setRole(newRole);
		userService.update(savedUserProfile);
		Assert.assertEquals(firstName, savedUserProfile.getFirstName());
		Assert.assertEquals(lastName, savedUserProfile.getLastName());
		Assert.assertEquals(state, savedUserProfile.getState());
		Assert.assertEquals(newPhone, savedUserProfile.getPhone());
		Assert.assertEquals(newRole, savedUserProfile.getRole());
		Assert.assertEquals(newAddress, savedUserProfile.getAddress());
	}

	@Test
	public void testDelete() {
		UserProfile userProfile = UserUtil.createUser();
		userProfile.setState(UserState.ACTIVE);
		UserCredentials userCredentials = userProfile.getUserCredentials();
		userService.register(userProfile, userCredentials);
		DeleteActiveUserException exception = null;
		try {
			userService.delete(userProfile.getId());
		} catch (DeleteActiveUserException e) {
			exception=e;
		}
		Assert.assertNotNull(exception);
		Assert.assertNotNull(userService.getProfile(userProfile.getId()));
		Assert.assertNotNull(userService.getCredentials(userCredentials.getId()));
		
		userProfile = userService.getProfile(userProfile.getId());
		userProfile.setState(UserState.NOT_ACTIVE);
		userService.update(userProfile);
		
		exception = null;
		try {
			userService.delete(userProfile.getId());
		} catch (DeleteActiveUserException e) {
			exception=e;
		}
		Assert.assertNull(exception);
		Assert.assertNull(userService.getProfile(userProfile.getId()));
		Assert.assertNull(userService.getCredentials(userCredentials.getId()));
	}
	
	@Test
	public void testFind(){
		UserProfile userProfile =  UserUtil.createUser();
		userService.register(userProfile, userProfile.getUserCredentials());
		String firstName = userProfile.getFirstName();
		UserFilter userFilter = new UserFilter();
		userFilter.setUserName(firstName);
		Assert.assertEquals(userService.find(userFilter).size(), 1);
	}
	
	@Before
	public void clearDb(){
		List<UserProfile> userProfiles = userService.getAll();
		for(UserProfile currentUser: userProfiles){
			try {
				userService.delete(currentUser.getId());
			} catch (DeleteActiveUserException e) {
				e.printStackTrace();
			}
		}
	}
	
}
