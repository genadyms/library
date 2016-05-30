package com.gmazurkevich.training.library.service.mocks;

import java.util.Date;

import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.datamodel.UserState;

public class UserUtil {
	
	public static UserProfile createUser(){
		UserProfile userProfile = new UserProfile();
		userProfile.setCreated(new Date());
		userProfile.setRole(UserRole.ADMIN);
		userProfile.setFirstName("Ivan");
		userProfile.setLastName("Ivanov");
		userProfile.setAddress("Grodno, ul.Gorkogo, 89");
		userProfile.setPhone(String.valueOf(System.currentTimeMillis()));
		userProfile.setState(UserState.NOT_ACTIVE);
		UserCredentials userCredentials = new UserCredentials();
		userCredentials.setEmail(System.currentTimeMillis()+"test@gmail.com");
		userCredentials.setPassword("pass");
		userProfile.setUserCredentials(userCredentials);
		return userProfile;
	}

}
