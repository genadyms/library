package com.gmazurkevich.training.library.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.AutoPopulatingList.ElementInstantiationException;

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.exception.DeleteAuthorWithBooksException;
import com.gmazurkevich.training.library.service.mocks.AuthorUtil;
import com.gmazurkevich.training.library.service.mocks.BookUtil;
import com.gmazurkevich.training.library.service.mocks.MockAuthor;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class AuthorServiceTest /* extends MockAuthor */ {
	@Inject
	private AuthorService authorService;

	@Inject
	private BookService bookService;

	@Test
	public void test() {
		Assert.assertNotNull(authorService);
	}

	@Test
	public void testCreate() {
		Author author = AuthorUtil.createAuthor();
		authorService.create(author);
		Assert.assertNotNull(authorService.getAuthor(author.getId()));
	}

	@Test
	public void testUpdate() {
		Author author = AuthorUtil.createAuthor();
		authorService.create(author);
		String newFirstName = "new first name";
		String newSecondName = "new second name " + System.currentTimeMillis();
		author.setFirstName(newFirstName);
		author.setSecondName(newSecondName);
		authorService.update(author);
		Author authorUpdate = authorService.getAuthor(author.getId());
		Assert.assertEquals(authorUpdate.getFirstName(), newFirstName);
		Assert.assertEquals(authorUpdate.getSecondName(), newSecondName);
	}

	@Test
	public void testDelete() {
		Author author = AuthorUtil.createAuthor();
		authorService.create(author);
		try {
			authorService.delete(author);
		} catch (DeleteAuthorWithBooksException e) {
			e.printStackTrace();
		}
		Assert.assertNull(authorService.getAuthor(author.getId()));
	}

	@Test
	public void testDeleteWithBook() {
		Author author = AuthorUtil.createAuthor();
		authorService.create(author);
		Author author2 = AuthorUtil.createAuthor();
		authorService.create(author2);
		
		List<Author> authors = new ArrayList<Author>();
		authors.add(author);
		authors.add(author2);
		
		Book book = BookUtil.createBook(null, authors);
		bookService.save(book);
		
		Book bookDb = bookService.getBookFetchAll(book);
		for(Author a: bookDb.getAuthors()){
			System.out.println(a.getFirstName());
			System.out.println(a.getSecondName());
			System.out.println("----------------------");
		}
		Author newAuth =AuthorUtil.createAuthor();
		authorService.create(newAuth);
		bookDb.getAuthors().add(newAuth);
		bookService.update(bookDb);
		Book bookDb1 = bookService.getBookFetchAll(book);
		for(Author a: bookDb1.getAuthors()){
			System.out.println(a.getFirstName());
			System.out.println(a.getSecondName());
			System.out.println("----------------------");
		}
		// List<Book> savedBooks = authorService.getBooks(authors);
		// Assert.assertEquals(savedBooks.size(), countBooks);
		// DeleteAuthorWithBooksException exception = null;
		// try {
		// authorService.delete(author);
		// } catch (DeleteAuthorWithBooksException e) {
		// exception=e;
		// }
		// Assert.assertNotNull(exception);
		// Assert.assertNotNull(null);
		// Assert.assertNotNull(authorService.getAuthor(author.getId()));
		//
	}

}
