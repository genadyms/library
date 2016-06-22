package com.gmazurkevich.training.library.service.impl;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.UserCredentialsDao;
import com.gmazurkevich.training.library.dataaccess.UserProfileDao;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserState;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.service.exception.DeleteActiveUserException;
import com.gmazurkevich.training.library.dataaccess.filters.UserFilter;

@Service
public class UserServiceImpl implements UserService {
	private static Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);
	@Inject
	private UserProfileDao userProfileDao;

	@Inject
	private UserCredentialsDao userCredentialsDao;

	@Override
	public void register(UserProfile profile, UserCredentials userCredentials) {
		userCredentialsDao.insert(userCredentials);
		profile.setUserCredentials(userCredentials);
		userProfileDao.insert(profile);
		LOGGER.info("Save {} | {}", profile,userCredentials);

	}

	@Override
	public UserProfile getProfile(Long id) {
		return userProfileDao.get(id);
	}

	@Override
	public List<UserProfile> getAll() {
		return userProfileDao.getAll();
	}

	@Override
	public UserCredentials getCredentials(Long id) {
		return userCredentialsDao.get(id);
	}

	@Override
	public void update(UserProfile profile) {
		userProfileDao.update(profile);
		LOGGER.info("Update {}", profile);
	}

	@Override
	public void delete(Long id) throws DeleteActiveUserException {
		UserProfile userProfile = userProfileDao.get(id);
		if (userProfile.getState() != UserState.NOT_ACTIVE) {
			LOGGER.info("Throws DeleteActiveUserException in delete user with id {}", id);
			throw new DeleteActiveUserException();
		}
		userProfileDao.delete(id);
		userCredentialsDao.delete(id);
		LOGGER.info("Delete user with id  {}", id);
	}

	@Override
	public List<UserProfile> find(UserFilter filter) {
		return userProfileDao.find(filter);
	}

	@Override
	public long count(UserFilter userFilter) {
		return userProfileDao.count(userFilter);
	}

	@Override
	public UserCredentials getByNameAndPassword(String userName, String password) {
		return userCredentialsDao.find(userName, password);
	}

	@Override
	public Collection<? extends String> resolveRoles(Long id) {
		UserProfile userProfile = userProfileDao.get(id);
		return Collections.singletonList(userProfile.getRole().name());
	}
}
