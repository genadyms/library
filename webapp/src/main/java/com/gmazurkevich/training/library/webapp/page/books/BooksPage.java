package com.gmazurkevich.training.library.webapp.page.books;

import javax.inject.Inject;

import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class BooksPage extends AbstractPage {

    @Inject
    private BookService bookService;

    public BooksPage() {
        super();

        System.out.print(bookService);
    }

}
