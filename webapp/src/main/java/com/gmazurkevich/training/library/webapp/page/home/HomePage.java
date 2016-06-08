package com.gmazurkevich.training.library.webapp.page.home;

import org.apache.wicket.markup.html.basic.Label;
import com.gmazurkevich.training.library.webapp.component.catalog.CatalogPanel;
import com.gmazurkevich.training.library.webapp.component.search.SearchPanel;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class HomePage extends AbstractPage {

	public HomePage() {
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
