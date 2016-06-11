package com.gmazurkevich.training.library.webapp.page.issue;

import org.apache.wicket.markup.html.basic.Label;

import com.gmazurkevich.training.library.webapp.component.catalog.CatalogPanel;
import com.gmazurkevich.training.library.webapp.component.search.SearchPanel;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;
import com.gmazurkevich.training.library.webapp.page.home.MyTestLabel;

public class IssuePage extends AbstractPage {

	public  IssuePage () {
		super();
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();
		add(new CatalogPanel("catalog-panel"));
		add(new SearchPanel("search-panel"));
		Label myLabel = new MyTestLabel("test-label", "test label");
		add(myLabel);
	}

}
