package com.gmazurkevich.training.library.webapp.app;

import javax.inject.Inject;

import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.protocol.http.WebApplication;
import org.apache.wicket.spring.injection.annot.SpringComponentInjector;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import com.gmazurkevich.training.library.webapp.page.home.HomePage;

@Component("wicketWebApplicationBean")
public class WicketApplication extends WebApplication {
	@Inject
	private ApplicationContext applicationContext;

	/**
	 * @see org.apache.wicket.Application#init()
	 */
	@Override
	public void init() {
		super.init();
		getMarkupSettings().setStripWicketTags(true);
		// add your configuration here

		getComponentInstantiationListeners().add(new SpringComponentInjector(this, getApplicationContext()));
		
//		getSecuritySettings().setAuthorizationStrategy(new AnnotationsRoleAuthorizationStrategy(this));
		// mount
		// mountPage("/productDetails", ProductEditPage.class);
	}

	public ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	

	/**
	 * @see org.apache.wicket.Application#getHomePage()
	 */
	@Override
	public Class<? extends WebPage> getHomePage() {
		return HomePage.class;
	}

}
