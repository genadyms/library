package by.gmazurkevich.training.library.service;

import java.util.Date;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.Comment;
import by.gmazurkevich.training.library.datamodel.UserCredentials;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.service.util.MockUser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CommentServiceTest {

	@Inject
	private CommentService commentService;

	@Inject
	private UserService userService;

	@Test
	public void testCreate() {
		UserProfile userProfile = createUserProfile();
		Comment comment = createComment(userProfile);
		Comment commentDb = commentService.getComment(comment.getId());
		Assert.assertNotNull(commentDb);
		clearDb(userProfile, commentDb);
	}
	
	@Test
	public void testDelete() {
		UserProfile userProfile = createUserProfile();
		Comment comment = createComment(userProfile);
		Long commentId = comment.getId();
		Assert.assertNotNull(commentService.getComment(commentId));
		commentService.delete(comment.getId());
		Assert.assertNull(commentService.getComment(commentId));
		userService.delete(userProfile.getId());
	}
	
	@Test
	public void testUpdate() {
		UserProfile userProfile = createUserProfile();
		Comment comment = createComment(userProfile);
		String content = "new comment content";
		comment.setContent(content);
		Integer dislike = 234;
		comment.setDislike(dislike);
		Integer like = 2;
		comment.setLike(like);
		commentService.update(comment);
		Comment commentDb = commentService.getComment(comment.getId());
		Assert.assertEquals(commentDb.getContent(), content);
		Assert.assertEquals(commentDb.getDislike(), dislike);
		Assert.assertEquals(commentDb.getLike(), like);
		clearDb(userProfile, commentDb);
	}
	
	private void clearDb(UserProfile profile, Comment comment) {
		commentService.delete(comment.getId());
		userService.delete(profile.getId());
	}

	private UserProfile createUserProfile() {
		MockUser user = new MockUser();
		UserProfile userProfile = user.getUserProfile();
		UserCredentials userCredentials = user.getUserCredentials();
		userService.register(userProfile, userCredentials);
		return userProfile;
	}

	private Comment createComment(UserProfile userProfile) {
		Comment comment = new Comment();
		comment.setContent("comment content 1");
		comment.setUserProfile(userProfile);
		comment.setCreated(new Date());
		comment.setLike(1);
		comment.setDislike(1);
		commentService.create(comment);
		return comment;
	}

}
