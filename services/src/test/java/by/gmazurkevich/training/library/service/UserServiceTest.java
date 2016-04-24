package by.gmazurkevich.training.library.service;

import java.lang.reflect.Field;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.datamodel.UserRole;
import by.gmazurkevich.training.library.service.UserService;
import by.gmazurkevich.training.library.dataaccess.UserProfileDao;
import by.gmazurkevich.training.library.dataaccess.impl.AbstractDaoImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class UserServiceTest {

    @Inject
    private UserService userService;

    @Inject
    private UserProfileDao userProfileDao;

    @Test
    public void test() {
        Assert.assertNotNull(userService);
    }

    @Test
    public void testEntityManagerInitialization() throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
        Field f = AbstractDaoImpl.class.getDeclaredField("entityManager");
        f.setAccessible(true);
        EntityManager em = (EntityManager) f.get(userProfileDao);

        Assert.assertNotNull(em);
    }

    @Test
    public void testRegistration() {
//        UserProfile profile = new UserProfile();
        UserCredentials userCredentials = new UserCredentials();

//        profile.setFirstName("testFName");
//        profile.setLastName("testLName");
//        userCredentials.setId(Long.valueOf(9));
        userCredentials.setEmail(System.currentTimeMillis() + "mail@test.by");
        userCredentials.setPassword("pswd");
//        userService.register(profile, userCredentials);
        userService.register(null,userCredentials);
//        UserProfile registredProfile = userService.getProfile(profile.getId());
//        registredProfile.setRole(UserRole.ADMIN);
        UserCredentials registredCredentials = userService.getCredentials(userCredentials.getId());

//        Assert.assertNotNull(registredProfile);
        Assert.assertNotNull(registredCredentials);

//        String updatedFName = "updatedName";
//        profile.setFirstName(updatedFName);
//        userService.update(profile);
//
//        Assert.assertEquals(updatedFName, userService.getProfile(profile.getId()).getFirstName());
//
//        userService.delete(profile.getId());
//
//        Assert.assertNull(userService.getProfile(profile.getId()));
//        Assert.assertNull(userService.getCredentials(userCredentials.getId()));
    }
    
    @Test
    public void testGetAll(){
    	List<UserCredentials> curr = userService.getAllCredentials();
    	System.out.println(curr.size());
    	Assert.assertNotNull(curr.size());
    }

}

