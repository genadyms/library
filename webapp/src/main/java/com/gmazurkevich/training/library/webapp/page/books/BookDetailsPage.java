package com.gmazurkevich.training.library.webapp.page.books;

import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class BookDetailsPage extends AbstractPage {

    public BookDetailsPage(PageParameters parameters) {
        super(parameters);
    }

    public BookDetailsPage(Book book) {
        super();

    }

}
