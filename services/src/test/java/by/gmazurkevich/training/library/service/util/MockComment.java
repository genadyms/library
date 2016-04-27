package by.gmazurkevich.training.library.service.util;

import by.gmazurkevich.training.library.datamodel.Comment;

public class MockComment {
	
	public MockComment() {
		
		initialize();
	}

	private void initialize() {
		MockUser user = new MockUser();
		Comment comment = new Comment();
		comment.setContent("comment content 1");
		comment.setUserProfile(user.getUserProfile());
//		userProfile = new UserProfile();
//		userCredentials = new UserCredentials();
//		Long randomValue = System.currentTimeMillis();
//		contact = new Contact();
//		contact.setAddress("Grodno, Sovetskaya " + randomValue);
//		contact.setPhone(String.valueOf(randomValue));
//		userCredentials.setEmail(randomValue + "mail@test.by");
//		userCredentials.setPassword("pswd");
//		userProfile.setFirstName("Vasya");
//		userProfile.setLastName("Ivanov");
//		userProfile.setRole(UserRole.ADMIN);
//		userProfile.setUserState(UserState.ACTIVE);
//		userProfile.setContact(contact);
	}

}
