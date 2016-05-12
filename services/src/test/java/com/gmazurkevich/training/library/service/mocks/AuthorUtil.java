package com.gmazurkevich.training.library.service.mocks;

import com.gmazurkevich.training.library.datamodel.Author;

public class AuthorUtil {
	
	public static Author createAuthor() {
		Author author = new Author();
		author.setFirstName("Anton");
		author.setSecondName("Chehov "+System.currentTimeMillis());
		return author;
	}
}
