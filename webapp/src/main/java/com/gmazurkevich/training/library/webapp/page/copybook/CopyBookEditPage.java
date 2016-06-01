package com.gmazurkevich.training.library.webapp.page.copybook;

import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class CopyBookEditPage extends AbstractPage {

	private CopyBook copyBook;

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
		Form<CopyBook> form = new CopyBookForm<CopyBook>("form", new CompoundPropertyModel<CopyBook>(copyBook));
		add(form);

	}

	private class CopyBookForm<T> extends Form<T> {

		public CopyBookForm(String id, IModel<T> model) {
			super(id, model);
		}
	}

}
