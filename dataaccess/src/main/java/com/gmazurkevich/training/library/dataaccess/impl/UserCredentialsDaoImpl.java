package com.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.UserCredentialsDao;
import com.gmazurkevich.training.library.dataaccess.impl.AbstractDaoImpl;
import com.gmazurkevich.training.library.datamodel.UserCredentials;

@Repository
public class UserCredentialsDaoImpl extends AbstractDaoImpl<UserCredentials, Long> implements UserCredentialsDao {

    protected UserCredentialsDaoImpl() {
        super(UserCredentials.class);
    }

}
