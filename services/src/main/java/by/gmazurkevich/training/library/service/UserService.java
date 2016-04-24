package by.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;

public interface UserService {
	@Transactional
	void register(UserProfile profile, UserCredentials userCredentials);

	UserProfile getProfile(Long id);

	UserCredentials getCredentials(Long id);
	
	List<UserCredentials> getAllCredentials();

	@Transactional
	void update(UserProfile profile);

	@Transactional
	void delete(Long id);
}
