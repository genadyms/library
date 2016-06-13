package com.gmazurkevich.training.library.webapp.page.book;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.authroles.authorization.strategies.role.annotations.AuthorizeInstantiation;
import org.apache.wicket.extensions.markup.html.form.DateTextField;
import org.apache.wicket.extensions.markup.html.form.palette.Palette;
import org.apache.wicket.extensions.markup.html.form.palette.theme.DefaultTheme;
import org.apache.wicket.extensions.yui.calendar.DatePicker;
import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.model.util.CollectionModel;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.webapp.common.CatalogChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.googlecode.wicket.kendo.ui.form.multiselect.MultiSelect;
import com.googlecode.wicket.kendo.ui.panel.KendoFeedbackPanel;

@AuthorizeInstantiation(value = { "ADMIN" })
public class BookEditPage extends AbstractPage {

	@Inject
	private BookService bookService;

	@Inject
	private AuthorService authorService;

	@Inject
	private CatalogService catalogService;

	private Book book;
	
	public BookEditPage(PageParameters parameters) {
		super(parameters);
	}

	public BookEditPage(Book book) {
		super();
		this.book = book.getId()==null ? book : bookService.getBookFetchAll(book);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		Form<Book> form = new BookForm<Book>("form", new CompoundPropertyModel<Book>(book));
		add(form);
		List<Author> allAuthors = authorService.getAll();

		final MultiSelect<Author> multiselect = new MultiSelect<Author>("authors", Model.ofList(book.getAuthors()),
				Model.ofList(allAuthors), AuthorChoiceRenderer.INSTANCE);
		form.add(multiselect.setOutputMarkupId(true));
		TextField<String> titleField = new TextField<>("title");
		titleField.setRequired(true);
		form.add(titleField);

		TextField<String> isbnField = new TextField<>("isbn");
		form.add(isbnField);

		TextField<Integer> countPages = new TextField<>("pages");
		countPages.setRequired(true);
		form.add(countPages);

		TextField<String> publishingOfficeField = new TextField<>("publishingOffice");
		publishingOfficeField.setRequired(true);
		form.add(publishingOfficeField);

		DateTextField yearField = new DateTextField("year");
		yearField.add(new DatePicker());
		yearField.setRequired(true);
		form.add(yearField);

		List<Catalog> catalogsWithBook = catalogService.getCatalogsWithBooks();
		form.add(new DropDownChoice<>("catalog", catalogsWithBook, CatalogChoiceRenderer.INSTANCE));
		
		final KendoFeedbackPanel feedbackPanel = new KendoFeedbackPanel("feedback");
		add(feedbackPanel);
		
		form.add(new SubmitLink("save") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				bookService.saveOrUpdate(book);
				setResponsePage(new BooksPage());
			}
		});
	}

	private class BookForm<T> extends Form<T> {

		public BookForm(String id, IModel<T> model) {
			super(id, model);
		}
	}

}
