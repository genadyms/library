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
import by.gmazurkevich.training.library.service.util.MockUser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CommentServiceTest extends MockUser {

	@Inject
	private CommentService commentService;

	@Inject
	private CommentDao commentDao;

	@Inject
	private UserService userService;

	public CommentServiceTest() {
		super();
		userService.register(userProfile, userCredentials);
	}

	@Test
	public void test() {
		Assert.assertNotNull(commentService);
	}

	@Test
	public void create() {
		Comment comment = new Comment();
		comment.setContent("content2");
		// comment.setCreated(new Date());
//		comment.setUserProfile(userProfile));
//		commentDao.insert(comment);
		commentService.create(comment);
		Comment saveComment = commentDao.get(comment.getId());
		System.out.println(comment.getContent());
		Assert.assertNotNull(saveComment);
	}

}
