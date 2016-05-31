package com.gmazurkevich.training.library.webapp.page.home;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.model.Model;

import com.gmazurkevich.training.library.webapp.page.AbstractPage;

public class HomePage extends AbstractPage {

    public HomePage() {
        super();
       
//        Model<Integer> counterModel = new Model<Integer>();
//        counterModel.setObject(0);
//        Label label = new Label("counter", counterModel);
//        label.setOutputMarkupId(true);
//        label.setOutputMarkupPlaceholderTag(true);
//        add(label);
//
//        add(new AjaxLink<Void>("btn-increment") {
//            @Override
//            public void onClick(AjaxRequestTarget target) {
//                incrementAndUpdate(counterModel, label, target);
//            }
//        });

    }
    
    private void incrementAndUpdate(Model<Integer> counterModel, Label label, AjaxRequestTarget target) {
        counterModel.setObject(counterModel.getObject() + 1);
        target.add(label);
    }

}
