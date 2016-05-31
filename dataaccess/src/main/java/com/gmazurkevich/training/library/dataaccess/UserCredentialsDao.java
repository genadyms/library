package com.gmazurkevich.training.library.dataaccess;

import com.gmazurkevich.training.library.datamodel.UserCredentials;

public interface UserCredentialsDao  extends AbstractDao<UserCredentials, Long> {

	UserCredentials find(String userName, String password);

}
