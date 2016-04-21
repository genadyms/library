package by.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.UserProfileDao;
import by.gmazurkevich.training.library.datamodel.UserProfile;

@Repository
public class UserProfileDaoImpl extends AbstractDaoImpl implements UserProfileDao {

    @Override
    public UserProfile get(Long id) {
        return null;
    }

    @Override
    public UserProfile save() {
        return null;
    }

}
