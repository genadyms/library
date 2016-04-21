package by.gmazurkevich.training.library.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.UserCredentialsDao;
import by.gmazurkevich.training.library.dataaccess.UserProfileDao;
import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Inject
    private UserProfileDao userProfileDao;

    @Inject
    private UserCredentialsDao userCredentialsDao;

    @Override
    public void register(UserProfile profile, UserCredentials userCredentials) {
        // TODO Auto-generated method stub
    }

}
