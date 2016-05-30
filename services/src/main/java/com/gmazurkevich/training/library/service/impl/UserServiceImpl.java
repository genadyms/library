package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

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
	@Inject
	private UserProfileDao userProfileDao;

	@Inject
	private UserCredentialsDao userCredentialsDao;

	@Override
	public void register(UserProfile profile, UserCredentials userCredentials) {
		userCredentialsDao.insert(userCredentials);
		profile.setUserCredentials(userCredentials);
		userProfileDao.insert(profile);
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
	}

	@Override
	public void delete(Long id) throws DeleteActiveUserException{
		UserProfile userProfile = userProfileDao.get(id);
		if(userProfile.getState()!=UserState.NOT_ACTIVE) throw new DeleteActiveUserException();
		userProfileDao.delete(id);
		userCredentialsDao.delete(id);
	}
	@Override
	public	List<UserProfile> find(UserFilter filter) {
        return userProfileDao.find(filter);
    }

	@Override
	public long count(UserFilter userFilter) {
		return userProfileDao.count(userFilter);
	}
	
}
