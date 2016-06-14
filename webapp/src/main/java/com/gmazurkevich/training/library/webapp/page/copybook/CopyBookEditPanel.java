package com.gmazurkevich.training.library.webapp.page.copybook;

import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.ajax.markup.html.form.AjaxSubmitLink;
import org.apache.wicket.extensions.ajax.markup.html.modal.ModalWindow;
import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.IModel;

import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.DepartmentService;
import com.gmazurkevich.training.library.webapp.common.DepartmentChoiceRenderer;

public class CopyBookEditPanel extends Panel {
	@Inject
	private CopyBookService copyBookService;

	@Inject
	private DepartmentService departmentService;

	private ModalWindow modalWindow;
	private CopyBook copyBook;

	public CopyBookEditPanel(ModalWindow modalWindow, CopyBook copyBook) {
		super(modalWindow.getContentId());
		this.copyBook = copyBook;
		this.modalWindow = modalWindow;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		Form<CopyBook> form = new CopyBookForm<CopyBook>("form", new CompoundPropertyModel<CopyBook>(copyBook));
		add(form);

		List<Department> allDepartments = departmentService.getAll();
		form.add(new DropDownChoice<>("department", allDepartments, DepartmentChoiceRenderer.INSTANCE));
		form.add(new AjaxSubmitLink("save") {
			@Override
			protected void onSubmit(AjaxRequestTarget target, Form<?> form) {
				super.onSubmit(target, form);
				copyBookService.update(copyBook);
				modalWindow.close(target);
				((CopyBooksPage) this.getPage()).notification.info(target, "Sample info message");
			}
		});

		form.add(new AjaxLink("cancel") {
			@Override
			public void onClick(AjaxRequestTarget target) {
				modalWindow.close(target);
			}
		});
	}

	private class CopyBookForm<T> extends Form<T> {

		public CopyBookForm(String id, IModel<T> model) {
			super(id, model);
		}
	}

}
