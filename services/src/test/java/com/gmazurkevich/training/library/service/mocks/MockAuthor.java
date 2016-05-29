package com.gmazurkevich.training.library.service.mocks;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.exception.DeleteAuthorWithBooksException;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyItemException;

public class MockAuthor extends MockBook {

	@Inject
	protected AuthorService authorService;

	public Author createAuthor() {
		Author author = new Author();
		author.setFirstName("Anton");
		author.setSecondName("Chehov "+System.currentTimeMillis());
		authorService.create(author);
		return author;
	}

	public List<Author> createAuthorWithBook() {
		List<Author> authors = new ArrayList();
		for (int i = 30; i < 33; i++) {
			Author a = new Author();
			a.setFirstName(String.format("namne %d", i));
			a.setSecondName(String.format("secnamne %d", i));
			authorService.create(a);
			authors.add(a);

		}
		createBook(null, authors);
		return authors;
	}

	public void deleteAllAuthors() {
		List<Author> authors = authorService.getAll();
		deleteAllBooks();
		for (Author author : authors) {
			try {
				authorService.delete(author);
			} catch (DeleteAuthorWithBooksException e) {
				e.printStackTrace();
			}
		}
	}
}
