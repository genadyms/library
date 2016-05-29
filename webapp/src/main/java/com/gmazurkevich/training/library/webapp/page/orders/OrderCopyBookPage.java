package com.gmazurkevich.training.library.webapp.page.orders;

import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.behavior.Behavior;
import org.apache.wicket.extensions.markup.html.form.DateTextField;
import org.apache.wicket.extensions.markup.html.form.palette.Palette;
import org.apache.wicket.extensions.markup.html.form.palette.theme.DefaultTheme;
import org.apache.wicket.extensions.yui.calendar.DatePicker;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.model.util.CollectionModel;
import org.apache.wicket.request.component.IRequestableComponent;
import org.apache.wicket.request.component.IRequestablePage;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.AuthorService;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CatalogService;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.OrderService;
import com.gmazurkevich.training.library.webapp.common.CatalogChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.AuthorChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;

public class OrderCopyBookPage extends AbstractPage {

	@Inject
	private CopyBookService copybookService;

	@Inject
	private OrderService orderService;
	

	private Book book;

	public OrderCopyBookPage(PageParameters parameters) {
		super(parameters);
	}

	public OrderCopyBookPage(Book book) {
		super();
		this.book = book;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		CopyBookFilter filter = new CopyBookFilter();
		filter.setBook(book);
		Integer countCopyBooks = copybookService.find(filter).size();
		
		add(new Label("copy-book", countCopyBooks));
//		Form<Order> form = new BookForm<Book>("form", new CompoundPropertyModel<Book>(book));
//		add(form);
//
//		TextField<String> titleField = new TextField<>("title");
//		titleField.setRequired(true);
//		// titleField.setEnabled(false);
//		form.add(titleField);
//
//		TextField<String> isbnField = new TextField<>("isbn");
//		form.add(isbnField);
//
//		TextField<Integer> pagesTitle = new TextField<>("pages");
//		pagesTitle.setRequired(true);
//		form.add(pagesTitle);
//
//		TextField<String> publishingOfficeField = new TextField<>("publishingOffice");
//		publishingOfficeField.setRequired(true);
//		form.add(publishingOfficeField);
//
//		DateTextField yearField = new DateTextField("year");
//		yearField.add(new DatePicker());
//		yearField.setRequired(true);
//		form.add(yearField);
//		List<Author> allAuthors = authorService.getAll();
//		final Palette<Author> palette = new Palette<Author>("authors", Model.ofList(book.getAuthors()),
//				new CollectionModel<Author>(allAuthors), AuthorChoiceRenderer.INSTANCE, 15, false, true);
//
//		palette.add(new DefaultTheme());
//		form.add(palette);
//
//
////        List<Product> allProducts = productService.find(new ProductFilter());
////        form.add(new DropDownChoice<>("product", allProducts, ProductChoiceRenderer.INSTANCE));
//
//        List<Catalog> allCatalogs = catalogService.getAll();
//        form.add(new DropDownChoice<>("catalog", allCatalogs, CatalogChoiceRenderer.INSTANCE));
//        
//		form.add(new SubmitLink("save") {
//			@Override
//			public void onSubmit() {
//				super.onSubmit();
//				bookService.saveOrUpdate(book);
//				setResponsePage(new BooksPage());
//			}
//		});
//
//		add(new FeedbackPanel("feedback"));
	}

}
