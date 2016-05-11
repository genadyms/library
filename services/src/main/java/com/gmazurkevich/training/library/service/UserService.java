package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.UserFilter;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;

public interface UserService {
	
	UserProfile getProfile(Long id);

	UserCredentials getCredentials(Long id);

	@Transactional
	void update(UserProfile profile);

	@Transactional
	void delete(Long id);
	
	
	@Transactional
	void register(UserProfile profile, UserCredentials userCredentials);

	List<UserProfile> getAll();
	
	List<UserProfile> find(UserFilter userFilter);
}
