package com.gmazurkevich.training.library.webapp.app;

import javax.inject.Inject;

import org.apache.wicket.Page;
import org.apache.wicket.protocol.http.WebApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import com.gmazurkevich.training.library.webapp.page.home.HomePage;

@Component("wicketWebApplicationBean")
public class WicketApplication extends WebApplication {
	@Inject
    private ApplicationContext applicationContext;
	@Override
	public Class<? extends Page> getHomePage() {
		return HomePage.class;
	}

}
