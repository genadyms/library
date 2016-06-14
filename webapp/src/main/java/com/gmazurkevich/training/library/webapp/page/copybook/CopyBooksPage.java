package com.gmazurkevich.training.library.webapp.page.copybook;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.extensions.ajax.markup.html.modal.ModalWindow;
import org.apache.wicket.extensions.ajax.markup.html.modal.ModalWindow.WindowClosedCallback;

import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.copybook.panel.CopyBooksListPanel;
import com.googlecode.wicket.kendo.ui.widget.notification.Notification;

public class CopyBooksPage extends AbstractPage {
	private static final long serialVersionUID = 1L;

	private CopyBooksListPanel listPanel;
	public ModalWindow modalWindow;
	final public Notification notification = new Notification("notification");
	
	public CopyBooksPage() {
		super();
		listPanel = new CopyBooksListPanel("list-panel");
		listPanel.setOutputMarkupId(true);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		add(listPanel);
		addModalWindow(listPanel);
		add(notification);
	}

	private void addModalWindow(CopyBooksListPanel authorsListPanel) {
		modalWindow = new ModalWindow("modal");
		add(modalWindow);
		modalWindow.setWindowClosedCallback(new WindowClosedCallback() {

			@Override
			public void onClose(AjaxRequestTarget target) {
				target.add(authorsListPanel);

			}
		});
	}
}