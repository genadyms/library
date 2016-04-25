package by.gmazurkevich.training.library.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.ContactDao;
import by.gmazurkevich.training.library.dataaccess.UserCredentialsDao;
import by.gmazurkevich.training.library.dataaccess.UserProfileDao;
import by.gmazurkevich.training.library.datamodel.Contact;
import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserProfileDao userProfileDao;

	@Inject
	private UserCredentialsDao userCredentialsDao;

	@Inject
	private ContactDao contactDao;

	@Override
	public void register(UserProfile profile, UserCredentials userCredentials, Contact contact) {
		contactDao.insert(contact);
		userCredentialsDao.insert(userCredentials);
		profile.setUserCredentials(userCredentials);
		profile.setContact(contact);
		userProfileDao.insert(profile);
	}

	@Override
	public UserProfile getProfile(Long id) {
		return userProfileDao.get(id);
	}

	@Override
	public UserCredentials getCredentials(Long id) {
		return userCredentialsDao.get(id);
	}

	@Override
	public void update(UserProfile profile) {
		userProfileDao.update(profile);
	}

	@Override
	public void delete(Long id) {
		Long contactId = userProfileDao.get(id).getContact().getId();
		userProfileDao.delete(id);
		contactDao.delete(contactId);
		userCredentialsDao.delete(id);
	}

}
