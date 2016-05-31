package com.gmazurkevich.training.library.service;

import java.util.Collection;
import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.UserFilter;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.service.exception.DeleteActiveUserException;

public interface UserService {
	
	UserProfile getProfile(Long id);

	UserCredentials getCredentials(Long id);

	@Transactional
	void update(UserProfile profile);

	@Transactional
	void delete(Long id) throws DeleteActiveUserException;
	
	
	@Transactional
	void register(UserProfile profile, UserCredentials userCredentials);

	List<UserProfile> getAll();
	
	List<UserProfile> find(UserFilter userFilter);

	long count(UserFilter userFilter);

	UserCredentials getByNameAndPassword(String userName, String password);

	Collection<? extends String> resolveRoles(Long id);
}
