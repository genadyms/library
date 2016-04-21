package by.gmazurkevich.training.library.dataaccess;

import by.gmazurkevich.training.library.datamodel.UserProfile;

public interface UserProfileDao {

    UserProfile get(Long id);

    UserProfile save();

}
