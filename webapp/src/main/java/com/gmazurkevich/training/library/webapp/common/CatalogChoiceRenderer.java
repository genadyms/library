package com.gmazurkevich.training.library.webapp.common;

import org.apache.wicket.markup.html.form.ChoiceRenderer;

import com.gmazurkevich.training.library.datamodel.Catalog;

public class CatalogChoiceRenderer extends ChoiceRenderer<Catalog> {

    public static final CatalogChoiceRenderer INSTANCE = new CatalogChoiceRenderer();

    private CatalogChoiceRenderer() {
        super();
    }

    @Override
    public Object getDisplayValue(Catalog object) {
        return object.getTitle();
    }

    @Override
    public String getIdValue(Catalog object, int index) {
        return String.valueOf(object.getId());
    }
}