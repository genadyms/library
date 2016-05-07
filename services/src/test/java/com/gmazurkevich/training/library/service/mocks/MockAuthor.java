package com.gmazurkevich.training.library.service.mocks;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyParentException;

public class MockAuthor extends MockBook {

	@Inject
	protected AuthorService authorService;

	public Author createAuthor() {
		Author author = new Author();
		author.setFirstName("Anton");
		author.setSecondName("Chehov");
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
		for (Author author : authors) {
			try {
				authorService.delete(author);
			} catch (DeleteNotEmptyParentException e) {
				e.printStackTrace();
			}
		}
		deleteAllBooks();
	}
}
