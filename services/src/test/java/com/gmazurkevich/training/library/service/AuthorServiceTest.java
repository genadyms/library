package com.gmazurkevich.training.library.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.mocks.MockAuthor;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class AuthorServiceTest extends MockAuthor{
	
//	@Test
//	public void test() {
//		Assert.assertNotNull(authorService);
//	}
//	
//	@Test
//	public void testCreate() {
//		Author author = createAuthor();
//		Assert.assertNotNull(authorService.getAuthor(author.getId()));
//	}
//	
//	@Test
//	public void testUpdate() {
//		Author author = createAuthor();
//		String newFirstName = "new first name";
//		String newSecondName = "new second name";
//		author.setFirstName(newFirstName);
//		author.setSecondName(newSecondName);
//		authorService.update(author);
//		Author authorUpdate = authorService.getAuthor(author.getId());
//		Assert.assertEquals(authorUpdate.getFirstName(), newFirstName);
//		Assert.assertEquals(authorUpdate.getSecondName(), newSecondName);
//	}
//	
//
//	@Test
//	public void testDelete() {
//		Author author = createAuthor();
//		try {
//			authorService.delete(author);
//		} catch (ElementHasChildException e) {
//			e.printStackTrace();
//		}
//		Assert.assertNull(authorService.getAuthor(author.getId()));
//	}
	
	@Test
	public void testDeleteWithBook() {
		System.out.println(authorService.getBooks(createAuthorWithBook()).size());
//		for (Book b : authorService.getBooks( createAuthorWithBook())){
//			System.out.println(b.getTitle());
//			if (!b.getAuthor().isEmpty()){
//				for(Author a : b.getAuthor()){
//					System.out.println(a.getFirstName());
//				}
//			}
//		}
//		Author author = createAuthorWithBook();
//		try {
//			authorService.delete(author);
//		} catch (ElementHasChildException e) {
//			e.printStackTrace();
//		}
//		Assert.assertNull(authorService.getAuthor(author.getId()));
	}
//	@Before
//	@After
//	public void clearDb(){
//		deleteAllAuthors();
//	}
}
