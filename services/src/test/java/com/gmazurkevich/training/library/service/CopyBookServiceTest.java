package com.gmazurkevich.training.library.service;

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
import com.gmazurkevich.training.library.service.mocks.BookUtil;
import com.gmazurkevich.training.library.service.mocks.DepartmentUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CopyBookServiceTest {
	@Inject
	private CopyBookService copyBookService;

	@Inject
	private DepartmentService departmentService;

	@Inject
	private BookService bookService;

	@Test
	public void test() {
		Assert.assertNotNull(copyBookService);
	}

	@Test
	public void testPersist() {
		Book book = BookUtil.createBook(null, null);
		bookService.save(book);
		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);
		CopyBook copyBook = new CopyBook();
		copyBook.setBook(book);
		copyBook.setDepartment(department);
		copyBookService.save(copyBook);
		Assert.assertNotNull(copyBookService.get(copyBook.getId()));
	}

	@Test
	public void testDelete() {
		Book book = BookUtil.createBook(null, null);
		bookService.save(book);
		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);
		CopyBook copyBook = new CopyBook();
		copyBook.setBook(book);
		copyBook.setDepartment(department);
		copyBookService.save(copyBook);
		copyBookService.delete(copyBook.getId());
		Assert.assertNull(copyBookService.get(copyBook.getId()));
	}

	@Test
	public void testFindByBook() {
		Book book = BookUtil.createBook(null, null);
		bookService.save(book);
		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);
		int countCopyBook = 5;
		for (int i = 0; i < countCopyBook; i++) {
			CopyBook copyBook = new CopyBook();
			copyBook.setBook(book);
			copyBook.setDepartment(department);
			copyBookService.save(copyBook);
		}
		CopyBookFilter filter = new CopyBookFilter();
		filter.setBook(book);
		Assert.assertEquals(copyBookService.find(filter).size(), countCopyBook);
		
		CopyBookFilter filterDepartment = new CopyBookFilter();
		filterDepartment.setDepartment(department);;
		Assert.assertEquals(copyBookService.find(filterDepartment).size(), countCopyBook);
	}
}
