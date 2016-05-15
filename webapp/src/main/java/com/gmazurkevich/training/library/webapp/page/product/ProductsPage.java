package com.gmazurkevich.training.library.webapp.page.product;

import javax.inject.Inject;

import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class ProductsPage extends AbstractPage {

    @Inject
    private BookService bookService;

    public ProductsPage() {
        super();

        System.out.print(bookService);
    }

}
