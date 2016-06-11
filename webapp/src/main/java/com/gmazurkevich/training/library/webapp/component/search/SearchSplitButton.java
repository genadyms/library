package com.gmazurkevich.training.library.webapp.component.search;

import java.util.ArrayList;
import java.util.List;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.Model;

import com.gmazurkevich.training.library.webapp.page.home.HomePage;
import com.googlecode.wicket.jquery.ui.JQueryIcon;
import com.googlecode.wicket.jquery.ui.form.button.SplitButton;
import com.googlecode.wicket.jquery.ui.panel.JQueryFeedbackPanel;
import com.googlecode.wicket.jquery.ui.widget.menu.IMenuItem;
import com.googlecode.wicket.jquery.ui.widget.menu.MenuItem;

public class SearchSplitButton extends Panel {
	private static final long serialVersionUID = 1L;
	private final FeedbackPanel feedback;

	public SearchSplitButton(String id) {
		super(id);
		this.feedback = new JQueryFeedbackPanel("feedback");
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		final Form<Void> form = new Form<Void>("wrapper-form") {

			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit()
			{
				info("Form submitted");
			}
		};

		this.add(form);
		form.add(this.feedback.setOutputMarkupId(true));

		// TextField //
		final RequiredTextField<String> textField = new RequiredTextField<String>("text", new Model<String>());
		form.add(textField);

		// Buttons //
		form.add(new SplitButton("button", newMenuList()) {

			private static final long serialVersionUID = 1L;

			@Override
			protected void onError()
			{
				this.error("Validation failed!");
			}

			@Override
			protected void onSubmit(IMenuItem item)
			{
				this.info(String.format("%s: %s",item.getTitle().getObject(), textField.getModelObject()));
			}
		});
	}
	private List<IMenuItem> newMenuList()
	{
		List<IMenuItem> list = new ArrayList<IMenuItem>();

		list.add(new MenuItem("Find", JQueryIcon.WRENCH) {

			private static final long serialVersionUID = 1L;
			
			@Override
			public void onClick(AjaxRequestTarget target)
			{
				info("Selected " + this.getTitle().getObject());
				target.add(feedback);
				
			}
		});

		list.add(new MenuItem("Advanced Search", JQueryIcon.SEARCH) {

			private static final long serialVersionUID = 1L;

			@Override
			public void onClick(AjaxRequestTarget target)
			{
				info("Selected " + this.getTitle().getObject());
				target.add(feedback);
				setResponsePage(new HomePage());
			}
		});

//		list.add(new MenuItem("Delete", JQueryIcon.NOTICE) {
//
//			private static final long serialVersionUID = 1L;
//
//			@Override
//			public void onClick(AjaxRequestTarget target)
//			{
//				info("Selected " + this.getTitle().getObject());
//				target.add(feedback);
//			}
//		});

		return list;
	}
}
