package com.gmazurkevich.training.library.webapp.page.search;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.model.PropertyModel;

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.webapp.common.CatalogChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;

public class AdvancedSearchPage extends AbstractPage {
	private static final long serialVersionUID = 1L;
	private Book book;
	@Inject
	private CatalogService catalogService;
	@Inject
	private AuthorService authorService;
	private Model<String> name = new Model<String>();;

	public AdvancedSearchPage() {
		super();
		book = new Book();
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		Form<?> form = new Form<Void>("form");
		add(form);

		TextField<String> titleField = new TextField<>("title", new PropertyModel<String>(book, "title"));
		form.add(titleField);

		TextField<String> nameAuthorFiels = new TextField<>("author", name);
		form.add(nameAuthorFiels);

		TextField<String> isbnField = new TextField<>("isbn", new PropertyModel<String>(book, "isbn"));
		form.add(isbnField);

		List<Catalog> catalogField = catalogService.getAll();
		DropDownChoice selectCatalog = new DropDownChoice<>("catalog", new PropertyModel<Catalog>(book, "catalog"),
				catalogField, CatalogChoiceRenderer.INSTANCE);
		form.add(selectCatalog);

		TextField<String> publishingOfficeField1 = new TextField<>("publishingOffice",
				new PropertyModel<String>(book, "publishingOffice"));
		form.add(publishingOfficeField1);

		FeedbackPanel feedbackPanel = new FeedbackPanel("feedback");
		add(feedbackPanel);

		form.add(new SubmitLink("find") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onSubmit() {
				super.onSubmit();
				String title = titleField.getInput().trim();
				String nameAuthor = nameAuthorFiels.getInput().trim();
				String isbn = isbnField.getInput().trim();
				String catalog = selectCatalog.getInput().trim();
				String publishingOffice = publishingOfficeField1.getInput().trim();
				if (title.isEmpty() && nameAuthor.isEmpty() && isbn.isEmpty() && catalog.isEmpty()
						&& publishingOffice.isEmpty()) {
					feedbackPanel.error("no fields to search!!!");
				} else {
					BookFilter bookFilter = new BookFilter();
					bookFilter.setInnerJoin(true);
					bookFilter.setCatalog(book.getCatalog());
					bookFilter.setIsbn(book.getIsbn());
					bookFilter.setPublishingOffice(book.getPublishingOffice());
					bookFilter.setTitle(book.getTitle());
					if (nameAuthor != null&&!nameAuthor.trim().isEmpty()) {
						List<Author> authors = authorService.find(nameAuthor);
						if(!authors.isEmpty()) bookFilter.setAuthors(authors);
					}
					setResponsePage(new BooksPage(bookFilter));
				}

			}

		});
	}

	private class BookForm<T> extends Form<T> {

		public BookForm(String id, IModel<T> model) {
			super(id, model);
		}
	}

}
