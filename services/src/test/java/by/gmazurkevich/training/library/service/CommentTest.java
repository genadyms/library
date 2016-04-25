package by.gmazurkevich.training.library.service;

import java.util.Date;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.dataaccess.CommentDao;
import by.gmazurkevich.training.library.datamodel.Comment;
import by.gmazurkevich.training.library.datamodel.Contact;
import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.datamodel.UserRole;
import by.gmazurkevich.training.library.datamodel.UserState;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CommentTest {
	
	@Inject
	private CommentService commentService;
	
	@Inject
	private CommentDao commentDao;
	
	@Inject
	private UserService userService;
	
	@Test
	public void test() {
		Assert.assertNotNull(commentService);
	}
	
	@Test
	public void create(){
		Comment comment = new Comment();
		comment.setContent("content");
		comment.setCreated(new Date());
		comment.setUserProfile(userService.getProfile(111L));
//		commentDao.insert(comment);
		commentService.create(comment);
		Comment saveComment = commentDao.get(comment.getId());
		System.out.println(comment.getContent());
		Assert.assertNotNull(saveComment);
	}
	
//	public void initializeData() {
//		userProfile = new UserProfile();
//		userCredentials = new UserCredentials();
//		Long randomValue = System.currentTimeMillis();
//		contact = new Contact();
//		contact.setAddress("Grodno, Sovetskaya "+randomValue);
//		contact.setPhone(String.valueOf(randomValue));
//		userCredentials.setEmail( randomValue + "mail@test.by");
//		userCredentials.setPassword("pswd");
//		userProfile.setFirstName("Vasya");
//		userProfile.setLastName("Ivanov");
//		userProfile.setRole(UserRole.ADMIN);
//		userProfile.setUserState(UserState.ACTIVE);
//		userService.register(userProfile, userCredentials, contact);
//	}
}
