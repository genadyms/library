package com.gmazurkevich.training.library.webapp.page.copybook;

import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.DepartmentService;
import com.gmazurkevich.training.library.webapp.common.BookChoiceRenderer;
import com.gmazurkevich.training.library.webapp.common.CatalogChoiceRenderer;
import com.gmazurkevich.training.library.webapp.common.DepartmentChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.book.BooksPage;

public class CopyBookEditPage extends AbstractPage {

	private CopyBook copyBook;
	
	@Inject
	private DepartmentService departmentService;

	@Inject
	private BookService bookService;
	

	@Inject
	private CopyBookService copyBookService;
	

	public CopyBookEditPage(PageParameters parameters) {
		super(parameters);
	}

	public CopyBookEditPage(CopyBook copyBook) {
		super();
		this.copyBook = copyBook;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		
		add(new Label("title", copyBook.getBook().getTitle()));
		Form<CopyBook> form = new CopyBookForm<CopyBook>("form", new CompoundPropertyModel<CopyBook>(copyBook));
		add(form);

		List<Department> allDepartments = departmentService.getAll();
        form.add(new DropDownChoice<>("department", allDepartments, DepartmentChoiceRenderer.INSTANCE));
        
        form.add(new SubmitLink("save") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				copyBookService.update(copyBook);
//				setResponsePage(new CopyBooksPage(copyBook.getBook()));
			}
		});
	}

	private class CopyBookForm<T> extends Form<T> {

		public CopyBookForm(String id, IModel<T> model) {
			super(id, model);
		}
	}

}
