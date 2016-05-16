package com.gmazurkevich.training.library.webapp.component.menu;

import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.panel.Panel;

import com.gmazurkevich.training.library.webapp.page.book.BooksPage;
import com.gmazurkevich.training.library.webapp.page.catalog.CatalogsPage;
import com.gmazurkevich.training.library.webapp.page.comment.CommentsPage;
import com.gmazurkevich.training.library.webapp.page.home.HomePage;

public class MenuPanel extends Panel {

    public MenuPanel(String id) {
        super(id);
    }

    @Override
    protected void onInitialize() {
        super.onInitialize();

        add(new Link("link-home") {
            @Override
            public void onClick() {
                setResponsePage(new HomePage());
            }
        });

        add(new Link("link-books") {
            @Override
            public void onClick() {
                setResponsePage(new BooksPage());
            }
        });
        

        add(new Link("link-find") {
            @Override
            public void onClick() {
                setResponsePage(new BooksPage());
            }
        });
        

        add(new Link("link-catalogs") {
            @Override
            public void onClick() {
                setResponsePage(new CatalogsPage());
            }
        });
        

        add(new Link("link-departments") {
            @Override
            public void onClick() {
                setResponsePage(new BooksPage());
            }
        });
        

        add(new Link("link-comments") {
            @Override
            public void onClick() {
                setResponsePage(new CommentsPage());
            }
        });
    }
}