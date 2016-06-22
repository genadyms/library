package com.gmazurkevich.training.library.service.old;

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
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.datamodel.UserCredentials;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CommentService;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.DepartmentService;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.service.old.mocks.BookUtil;
import com.gmazurkevich.training.library.service.old.mocks.CommentUtil;
import com.gmazurkevich.training.library.service.old.mocks.DepartmentUtil;
import com.gmazurkevich.training.library.service.old.mocks.UserUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CommentServiceTest {

	@Inject
	private CommentService commentService;

	@Inject
	private DepartmentService departmentService;

	@Inject
	private CopyBookService copyBookService;

	@Inject
	private UserService userService;

	@Inject
	private BookService bookService;

	@Inject
	private OrderService orderService;

	@Test
	public void testCreate() {
		UserProfile userProfile = UserUtil.createUser();
		userService.register(userProfile, userProfile.getUserCredentials());
		Comment comment = CommentUtil.createComment(userProfile);
		commentService.save(comment);
		Assert.assertNotNull(commentService.getComment(comment.getId()));
	}

	@Test
	public void testBookCooments() {
		UserProfile userProfile = UserUtil.createUser();
		userService.register(userProfile, userProfile.getUserCredentials());
		List<Comment> comments = new ArrayList();
		int countComments = 10;
		Book book = BookUtil.createBook(null, null);
		bookService.save(book);
		for (int i = 0; i < countComments; i++) {
			Comment comment = CommentUtil.createComment(userProfile);
			comment.setBook(book);
			commentService.save(comment);
			comments.add(comment);
		}
		CommentFilter commentFilter = new CommentFilter();
		commentFilter.setBook(book);
		Assert.assertEquals(commentService.find(commentFilter).size(), countComments);
	}

	@Test
	public void testOrderCooments() {
		UserProfile userProfile = UserUtil.createUser();
		userService.register(userProfile, userProfile.getUserCredentials());
		Book book = BookUtil.createBook(null, null);
		bookService.save(book);
		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);
		CopyBook copyBook = new CopyBook();
		copyBook.setBook(book);
		copyBook.setDepartment(department);
		copyBookService.save(copyBook);
		Order order = new Order();
		order.setCopyBook(copyBook);
		order.setReader(userProfile);
		orderService.save(order);
		List<Comment> comments = new ArrayList();
		int countComments = 10;
		for (int i = 0; i < countComments; i++) {
			Comment comment = CommentUtil.createComment(userProfile);
			comment.setOrder(order);
			commentService.save(comment);
			comments.add(comment);
		}
		CommentFilter commentFilter = new CommentFilter();
		commentFilter.setOrder(order);
		int res = commentService.find(commentFilter).size();
		Assert.assertEquals(res, countComments);
	}

	@Test
	public void testDelete() {
		UserProfile userProfile = UserUtil.createUser();
		userService.register(userProfile, userProfile.getUserCredentials());
		Comment comment = CommentUtil.createComment(userProfile);
		commentService.save(comment);
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
		commentService.save(comment);
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
	public void clearDB() {
		CommentFilter commentFilter = new CommentFilter();
		List<Comment> comments = commentService.find(commentFilter);
		for (Comment comment : comments)
			commentService.delete(comment.getId());
	}
}
