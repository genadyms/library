package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.dataaccess.filters.UserFilter;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserState;
import com.gmazurkevich.training.library.service.UserService;
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
		String firstName = "OtherFirstName";
		String lastName = "OtherLastName";
		UserProfile savedUserProfile = userService.getProfile(userProfile.getId());
		UserState state = UserState.BLOCKED;
		savedUserProfile.setFirstName(firstName);
		savedUserProfile.setLastName(lastName);
		savedUserProfile.setUserState(state);
		userService.update(savedUserProfile);
		Assert.assertEquals(firstName, savedUserProfile.getFirstName());
		Assert.assertEquals(lastName, savedUserProfile.getLastName());
		Assert.assertEquals(state, savedUserProfile.getUserState());
	}

	@Test
	public void testDelete() {
		UserProfile userProfile = UserUtil.createUser();
		UserCredentials userCredentials = userProfile.getUserCredentials();
		userService.register(userProfile, userCredentials);
		userService.delete(userProfile.getId());
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
		int limit = 5;
		int cntUserProfile = limit+5;
		for(int i=0; i<cntUserProfile; i++){
			UserProfile userPr = UserUtil.createUser();
			userService.register(userPr, userPr.getUserCredentials());
		}
		Assert.assertEquals(userService.getAll().size(), cntUserProfile+1);
		userFilter = new UserFilter();
		userFilter.setLimit(limit);
		Assert.assertEquals(userService.find(userFilter).size(), limit);
		
	}
	
	@Before
	public void clearDb(){
		List<UserProfile> userProfiles = userService.getAll();
		for(UserProfile currentUser: userProfiles){
			userService.delete(currentUser.getId());
		}
	}
}
