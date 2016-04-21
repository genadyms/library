package by.gmazurkevich.training.library.service;

import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;

public interface UserService {

    void register(UserProfile profile, UserCredentials userCredentials);
}
