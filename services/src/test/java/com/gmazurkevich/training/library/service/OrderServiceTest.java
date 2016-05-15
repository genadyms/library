package com.gmazurkevich.training.library.service;

import java.util.Date;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.datamodel.Order;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.datamodel.UserRole;
import com.gmazurkevich.training.library.service.impl.DeleteActiveOrderException;
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
		UserProfile librarian = UserUtil.createUser();
		librarian.setRole(UserRole.LIBRARIAN);
		userService.register(librarian, librarian.getUserCredentials());
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
		order.setReader(reader);
		order.setLibrarian(librarian);
		orderService.save(order);
		Assert.assertNotNull(orderService.get(order.getId()));
	}

	@Test
	public void testDelete() {
		UserProfile reader = UserUtil.createUser();
		reader.setRole(UserRole.READER);
		userService.register(reader, reader.getUserCredentials());
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
		order.setReader(reader);
		order.setCreated(new Date());
		orderService.save(order);

		Order savedOrder = orderService.get(order.getId());
		DeleteActiveOrderException exception = null;
		try {
			orderService.delete(savedOrder.getId());
		} catch (DeleteActiveOrderException e) {
			exception = e;
		}

		Assert.assertNull(exception);
		Assert.assertNull(orderService.get(savedOrder.getId()));

	}

	@Test
	public void testDeleteWithLibrarian() {
		UserProfile reader = UserUtil.createUser();
		reader.setRole(UserRole.READER);
		userService.register(reader, reader.getUserCredentials());
		Book book = BookUtil.createBook(null, null);
		bookService.save(book);

		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);

		CopyBook copyBook = new CopyBook();
		copyBook.setBook(book);
		copyBook.setDepartment(department);
		copyBookService.save(copyBook);

		UserProfile librarian = UserUtil.createUser();
		librarian.setRole(UserRole.LIBRARIAN);
		userService.register(librarian, librarian.getUserCredentials());

		Order order = new Order();
		order.setCopyBook(copyBook);
		order.setReader(reader);
		order.setCreated(new Date());
		order.setLibrarian(librarian);
		orderService.save(order);

		Order savedOrder = orderService.get(order.getId());
		DeleteActiveOrderException exception = null;
		try {
			orderService.delete(savedOrder.getId());
		} catch (DeleteActiveOrderException e) {
			exception = e;
		}

		Assert.assertNotNull(exception);
		Assert.assertNotNull(orderService.get(savedOrder.getId()));

	}

	@Test
	public void testTempFindCopyBook() {
		UserProfile reader = UserUtil.createUser();
		reader.setRole(UserRole.READER);
		userService.register(reader, reader.getUserCredentials());
		UserProfile librarian = UserUtil.createUser();
		librarian.setRole(UserRole.LIBRARIAN);
		userService.register(librarian, librarian.getUserCredentials());
		Book book = BookUtil.createBook(null, null);
		bookService.save(book);
		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);

		int countCopyBook = 10;
		for (int i = 0; i < countCopyBook; i++) {
			CopyBook copyBook = new CopyBook();
			copyBook.setBook(book);
			copyBook.setDepartment(department);
			copyBookService.save(copyBook);
			Order order = new Order();
			order.setCopyBook(copyBook);
			order.setReader(reader);
			order.setLibrarian(librarian);
			if (i<9)
				order.setClosed(new Date());
			orderService.save(order);
		}
		CopyBookFilter filter = new CopyBookFilter();
		filter.setFindFreeCopyBook(true);
		filter.setBook(book);
		Assert.assertEquals(copyBookService.find(filter).size(), 9);//countCopyBook);
	}
}
