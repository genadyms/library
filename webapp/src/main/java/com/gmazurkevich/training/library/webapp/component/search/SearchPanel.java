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
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.Model;
import org.apache.wicket.util.string.Strings;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.webapp.page.book.BookEditPage;

public class SearchPanel extends Panel {

	public SearchPanel(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
	
		final Form<Void> form = new Form<Void>("form-search");
		RequiredTextField<String> requiredTextField = new RequiredTextField<String>("search-field");
		form.add(requiredTextField);
		form.add(new SubmitLink("search-submit") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				if (requiredTextField.isInputNullable()) {
					requiredTextField.setVisible(false);
				}
			}
		});
		add(form);
//		Model<Integer> counterModel = new Model<Integer>();
//		counterModel.setObject(0);
//		Label label = new Label("counter", counterModel) {
//			@Override
//			public void onEvent(IEvent<?> event) {
//				counterModel.setObject(0);
//
//			}
//		};
//
//		label.setOutputMarkupId(true);
//		label.setOutputMarkupPlaceholderTag(true);
//		add(label);
//		
//		Link link = new Link("test-link"){
//			private boolean isVisible = false;
//			@Override
//			public void onClick() {
//				label.setVisible(isVisible);
//				isVisible = !isVisible;
//				
//			}
//			
//		};
//		add(link);
	}

}
