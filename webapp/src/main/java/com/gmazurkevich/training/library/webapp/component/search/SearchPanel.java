package com.gmazurkevich.training.library.webapp.component.search;

import java.awt.Button;

import javax.inject.Inject;

import org.apache.wicket.Application;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.event.IEvent;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.link.BookmarkablePageLink;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.request.mapper.parameter.PageParameters;
import org.apache.wicket.util.string.Strings;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.webapp.page.book.BookEditPage;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;

public class SearchPanel extends Panel {
	private final static String MSG_ENTER = "Enter word for search...";

	public SearchPanel(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		final Form<Void> form = new Form<Void>("form-search");
		TextField<String> searchField = new TextField<String>("search-field");
		searchField.setDefaultModel(Model.of(MSG_ENTER));
		form.add(searchField);
		form.add(new SubmitLink("search-submit") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				String inputValue = searchField.getInput().trim();
				if (inputValue.isEmpty() || MSG_ENTER.equals(inputValue)) {
					setResponsePage(getPage());
				} else {
					PageParameters parameters = new PageParameters();
					parameters.add("find", inputValue);
					setResponsePage(BooksPage.class, parameters);
				}
			}
		});
		add(form);
	}

}
