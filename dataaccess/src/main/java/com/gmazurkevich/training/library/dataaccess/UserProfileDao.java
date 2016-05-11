package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.datamodel.UserProfile;

import com.gmazurkevich.training.library.dataaccess.filters.UserFilter;

public interface UserProfileDao  extends AbstractDao<UserProfile, Long> {

	List<UserProfile> find(UserFilter filter);
}
