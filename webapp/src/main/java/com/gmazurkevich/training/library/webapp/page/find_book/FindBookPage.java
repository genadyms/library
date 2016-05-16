package com.gmazurkevich.training.library.webapp.page.find_book;

import javax.inject.Inject;

import com.gmazurkevich.training.library.service.BookService;

public class FindBookPage {
	@Inject
	private BookService bookService;

	public FindBookPage() {
		super();

		System.out.print("FindBook = " + bookService);
	}
}
