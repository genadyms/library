package com.gmazurkevich.training.library.webapp.page.author;

import javax.inject.Inject;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.ajax.markup.html.form.AjaxSubmitLink;
import org.apache.wicket.extensions.ajax.markup.html.modal.ModalWindow;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.CompoundPropertyModel;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.service.AuthorService;

public class AuthorEditPanel extends Panel {

	@Inject
	private AuthorService authorService;

	private Author author;

	private ModalWindow modalWindow;

	public AuthorEditPanel(ModalWindow modalWindow, Author author) {
		super(modalWindow.getContentId());
		this.author = author;
		this.modalWindow = modalWindow;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		Form<Author> form = new Form<>("form", new CompoundPropertyModel<>(author));
		add(form);

		form.add(new TextField<>("firstName"));
		form.add(new TextField<>("secondName"));

		form.add(new AjaxSubmitLink("save") {
			@Override
			protected void onSubmit(AjaxRequestTarget target, Form<?> form) {
				super.onSubmit(target, form);
				authorService.saveOrUpdate(author);
				modalWindow.close(target);
			}
		});

		form.add(new AjaxLink("cancel") {
			@Override
			public void onClick(AjaxRequestTarget target) {
				modalWindow.close(target);
			}
		});
	}
}
