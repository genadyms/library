package com.gmazurkevich.training.library.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.dataaccess.filters.CommentFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Comment;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.service.mocks.BookUtil;
import com.gmazurkevich.training.library.service.mocks.CommentUtil;
import com.gmazurkevich.training.library.service.mocks.UserUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CommentServiceTest {

	@Inject
	private CommentService commentService;

	@Inject
	private UserService userService;

	@Inject
	private BookService bookService;

	@Test
	public void testCreate() {
		UserProfile userProfile = UserUtil.createUser();
		userService.register(userProfile, userProfile.getUserCredentials());
		List<Comment> comments = new ArrayList();
		int countComments = 10;
		Book book = BookUtil.createBook(null, null);
		bookService.save(book);
		for (int i = 0; i < countComments; i++) {
			Comment comment = CommentUtil.createComment(userProfile);
			comment.setBook(book);
			commentService.create(comment);
			comments.add(comment);

		}
		CommentFilter commentFilter = new CommentFilter();
		commentFilter.setBook(book);
		Assert.assertEquals(commentService.find(commentFilter).size(), countComments);
	}

	@Test
	public void testDelete() {
		UserProfile userProfile = UserUtil.createUser();
		userService.register(userProfile, userProfile.getUserCredentials());
		Comment comment = CommentUtil.createComment(userProfile);
		commentService.create(comment);
		Long commentId = comment.getId();
		Assert.assertNotNull(commentService.getComment(commentId));
		commentService.delete(comment.getId());
		Assert.assertNull(commentService.getComment(commentId));
	}

	@Test
	public void testUpdate() {
		UserProfile userProfile = UserUtil.createUser();
		userService.register(userProfile, userProfile.getUserCredentials());
		Comment comment = CommentUtil.createComment(userProfile);
		commentService.create(comment);
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
	}
	
	@After
	public void clearDB(){
		CommentFilter commentFilter = new CommentFilter();
		List<Comment> comments = commentService.find(commentFilter);
		for(Comment comment:comments) commentService.delete(comment.getId());
	}
}
