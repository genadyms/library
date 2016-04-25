package by.gmazurkevich.training.library.service;

import javax.transaction.Transactional;

import by.gmazurkevich.training.library.datamodel.Contact;
import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;

public interface UserService {
	
	UserProfile getProfile(Long id);

	UserCredentials getCredentials(Long id);

	@Transactional
	void update(UserProfile profile);

	@Transactional
	void delete(Long id);
	
	@Transactional
	void register(UserProfile profile, UserCredentials userCredentials, Contact contact);
}
