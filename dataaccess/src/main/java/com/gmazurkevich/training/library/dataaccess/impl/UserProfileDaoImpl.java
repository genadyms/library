package com.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.UserProfileDao;
import com.gmazurkevich.training.library.dataaccess.impl.AbstractDaoImpl;
import com.gmazurkevich.training.library.datamodel.UserProfile;

@Repository
public class UserProfileDaoImpl extends AbstractDaoImpl<UserProfile, Long> implements UserProfileDao {

	protected UserProfileDaoImpl() {
		super(UserProfile.class);
	}

}
