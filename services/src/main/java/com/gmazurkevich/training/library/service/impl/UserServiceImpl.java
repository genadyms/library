package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.ContactDao;
import com.gmazurkevich.training.library.dataaccess.UserCredentialsDao;
import com.gmazurkevich.training.library.dataaccess.UserProfileDao;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserProfileDao userProfileDao;

	@Inject
	private UserCredentialsDao userCredentialsDao;

	@Inject
	private ContactDao contactDao;

	@Override
	public void register(UserProfile profile, UserCredentials userCredentials) {
		contactDao.insert(profile.getContact());
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
	public void delete(Long id) {
		Long contactId = getProfile(id).getContact().getId();
		userProfileDao.delete(id);
		contactDao.delete(contactId);
		userCredentialsDao.delete(id);
	}
	
}
