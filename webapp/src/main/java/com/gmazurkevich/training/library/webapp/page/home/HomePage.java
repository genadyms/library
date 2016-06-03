package com.gmazurkevich.training.library.webapp.page.home;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.model.Model;

import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class HomePage extends AbstractPage {

    public HomePage() {
        super();
    }
    
    private void incrementAndUpdate(Model<Integer> counterModel, Label label, AjaxRequestTarget target) {
        counterModel.setObject(counterModel.getObject() + 1);
        target.add(label);
        
    }

}
