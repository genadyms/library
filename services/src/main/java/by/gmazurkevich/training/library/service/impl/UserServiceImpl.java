package by.gmazurkevich.training.library.service.impl;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.UserCredentialsDao;
import by.gmazurkevich.training.library.dataaccess.UserProfileDao;
import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserProfileDao userProfileDao;

	@Inject
	private UserCredentialsDao userCredentialsDao;

	@Override
	public void register(UserProfile profile, UserCredentials userCredentials) {

		userCredentialsDao.insert(userCredentials);
//		profile.setUserCredentials(userCredentials);
//
//		profile.setCreated(new Date());
//		userProfileDao.insert(profile);
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
		userProfileDao.delete(id);
		userCredentialsDao.delete(id);
	}

	@Override
	public List<UserCredentials> getAllCredentials() {
		return userCredentialsDao.getAll();
	}

}
