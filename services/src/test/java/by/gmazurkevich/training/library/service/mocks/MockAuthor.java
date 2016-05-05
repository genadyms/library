package by.gmazurkevich.training.library.service.mocks;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import by.gmazurkevich.training.library.datamodel.Author;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.service.AuthorService;
import by.gmazurkevich.training.library.service.ElementHasChildException;

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

	public Author createAuthorWithBook() {
		Author author = new Author();
		author.setFirstName("Anton");
		author.setSecondName("Chehov");
		authorService.create(author);
		List<Author>  authors = new ArrayList();
		authors.add(author);
		createBook(null, authors);
		return author;
	}

	public void deleteAllAuthors() {
		List<Author> authors = authorService.getAll();
		for (Author author : authors) {
			try {
				authorService.delete(author);
			} catch (ElementHasChildException e) {
				e.printStackTrace();
			}
		}
		deleteAllBooks();
	}
}
