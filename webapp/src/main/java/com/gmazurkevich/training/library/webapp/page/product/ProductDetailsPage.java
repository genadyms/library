package com.gmazurkevich.training.library.webapp.page.product;

import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class ProductDetailsPage extends AbstractPage {

    public ProductDetailsPage(PageParameters parameters) {
        super(parameters);
    }

    public ProductDetailsPage(Book book) {
        super();

    }

}
