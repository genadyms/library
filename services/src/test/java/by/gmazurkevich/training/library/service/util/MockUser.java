package by.gmazurkevich.training.library.service.util;

import by.gmazurkevich.training.library.datamodel.Contact;
import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.datamodel.UserRole;
import by.gmazurkevich.training.library.datamodel.UserState;

public class MockUser {
	private UserProfile userProfile;
	private UserCredentials userCredentials;
	private Contact contact;

	public MockUser() {
		initialize();
	}

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public UserCredentials getUserCredentials() {
		return userCredentials;
	}

	public Contact getContact() {
		return contact;
	}

	private void initialize() {
		userProfile = new UserProfile();
		userCredentials = new UserCredentials();
		Long randomValue = System.currentTimeMillis();
		contact = new Contact();
		contact.setAddress("Grodno, Sovetskaya " + randomValue);
		contact.setPhone(String.valueOf(randomValue));
		userCredentials.setEmail(randomValue + "mail@test.by");
		userCredentials.setPassword("pswd");
		userProfile.setFirstName("Vasya");
		userProfile.setLastName("Ivanov");
		userProfile.setRole(UserRole.ADMIN);
		userProfile.setUserState(UserState.ACTIVE);
		userProfile.setContact(contact);
	}

}
