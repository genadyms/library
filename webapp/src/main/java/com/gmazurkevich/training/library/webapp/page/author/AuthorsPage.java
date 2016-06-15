package com.gmazurkevich.training.library.webapp.page.author;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.ajax.markup.html.form.AjaxSubmitLink;
import org.apache.wicket.extensions.ajax.markup.html.modal.ModalWindow;
import org.apache.wicket.extensions.ajax.markup.html.modal.ModalWindow.WindowClosedCallback;
import org.apache.wicket.markup.html.form.Form;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.webapp.app.AuthorizedSession;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.author.panel.AuthorsListPanel;

public class AuthorsPage extends AbstractPage {
	public ModalWindow modalWindow;
	@Override
	protected void onInitialize() {
		super.onInitialize();

		AuthorsListPanel authorsListPanel = new AuthorsListPanel("list");
		authorsListPanel.setOutputMarkupId(true);
		add(authorsListPanel);

		addModalWindow(authorsListPanel);

	}

	private void addModalWindow(AuthorsListPanel authorsListPanel) {
		modalWindow = new ModalWindow("modal");
		add(modalWindow);

		AjaxLink createLink = new AjaxLink("create") {
			@Override
			public void onClick(AjaxRequestTarget target) {
				modalWindow.setContent(new AuthorEditPanel(modalWindow, new Author()));
				modalWindow.show(target);
			}
		};
		add(createLink);
		createLink.setVisible(false);
		if (null!=AuthorizedSession.get().getRoles()&&AuthorizedSession.get().getRoles().contains("admin")) {
			createLink.setVisible(true);
		}
		modalWindow.setWindowClosedCallback(new WindowClosedCallback() {

			@Override
			public void onClose(AjaxRequestTarget target) {
				target.add(authorsListPanel);

			}
		});
	}
}
