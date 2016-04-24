package by.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.impl.AbstractDaoImpl;
import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.dataaccess.UserCredentialsDao;

@Repository
public class UserCredentialsDaoImpl extends AbstractDaoImpl<UserCredentials, Long> implements UserCredentialsDao {

    protected UserCredentialsDaoImpl() {
        super(UserCredentials.class);
    }

}
