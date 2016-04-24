package by.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.impl.AbstractDaoImpl;
import by.gmazurkevich.training.library.dataaccess.UserProfileDao;
import by.gmazurkevich.training.library.datamodel.UserProfile;

@Repository
public class UserProfileDaoImpl extends AbstractDaoImpl<UserProfile, Long> implements UserProfileDao {

	protected UserProfileDaoImpl() {
		super(UserProfile.class);
	}

}
