package com.gmazurkevich.training.library.webapp.component.search;

import java.awt.Button;

import javax.inject.Inject;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.event.IEvent;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.Model;

public class SearchPanel extends Panel {

	public SearchPanel(String id) {
		super(id);
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		Model<Integer> counterModel = new Model<Integer>();
		counterModel.setObject(0);
		Label label = new Label("counter", counterModel) {
			@Override
			public void onEvent(IEvent<?> event) {
				counterModel.setObject(0);

			}
		};

		label.setOutputMarkupId(true);
		label.setOutputMarkupPlaceholderTag(true);
		add(label);
		
		Link link = new Link("test-link"){
			private boolean isVisible = false;
			@Override
			public void onClick() {
				label.setVisible(isVisible);
				isVisible = !isVisible;
				
			}
			
		};
		add(link);
	}

}
