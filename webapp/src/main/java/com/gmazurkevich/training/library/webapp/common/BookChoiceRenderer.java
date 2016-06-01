package com.gmazurkevich.training.library.webapp.common;

import org.apache.wicket.markup.html.form.ChoiceRenderer;

import com.gmazurkevich.training.library.datamodel.Book;

public class BookChoiceRenderer extends ChoiceRenderer<Book> {

	public static final BookChoiceRenderer INSTANCE = new BookChoiceRenderer();

	private BookChoiceRenderer() {
		super();
	}

	@Override
	public Object getDisplayValue(Book object) {
		return object.getTitle();
	}

	@Override
	public String getIdValue(Book object, int index) {
		return String.valueOf(object.getId());
	}
}