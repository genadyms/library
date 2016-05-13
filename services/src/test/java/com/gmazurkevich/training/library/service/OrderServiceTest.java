package com.gmazurkevich.training.library.service;

import java.util.Date;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.service.mocks.BookUtil;
import com.gmazurkevich.training.library.service.mocks.DepartmentUtil;
import com.gmazurkevich.training.library.service.mocks.UserUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class OrderServiceTest {
	@Inject
	private CopyBookService copyBookService;

	@Inject
	private OrderService orderService;

	@Inject
	private UserService userService;

	@Inject
	private DepartmentService departmentService;

	@Inject
	private BookService bookService;
	@Test
	public void test() {
		Assert.assertNotNull(orderService);
	}

	@Test
	public void testSave() {
		UserProfile reader = UserUtil.createUser();
		reader.setRole(UserRole.READER);
		userService.register(reader, reader.getUserCredentials());
//		UserProfile librarian = UserUtil.createUser();
//		librarian.setRole(UserRole.LIBRARIAN);
//		userService.register(librarian, librarian.getUserCredentials());
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
		order.setReaderId(reader);
//		order.setCreated(new Date());
		orderService.save(order);
		Assert.assertNotNull(orderService.get(order.getId()));
	}
}
