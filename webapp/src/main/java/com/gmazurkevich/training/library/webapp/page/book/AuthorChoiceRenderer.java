package com.gmazurkevich.training.library.webapp.page.book;

import org.apache.wicket.markup.html.form.ChoiceRenderer;

import com.gmazurkevich.training.library.datamodel.Author;


public class AuthorChoiceRenderer extends ChoiceRenderer<Author> {

    public static final AuthorChoiceRenderer INSTANCE = new AuthorChoiceRenderer();

    private AuthorChoiceRenderer() {
        super();
    }

    @Override
    public Object getDisplayValue(Author object) {
        return String.format("%s  %s", object.getFirstName(), object.getSecondName());
    }

    @Override
    public String getIdValue(Author object, int index) {
        return String.valueOf(object.getId());
    }
}