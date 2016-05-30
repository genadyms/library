package com.gmazurkevich.training.library.webapp.common;

import org.apache.wicket.markup.html.form.ChoiceRenderer;

import com.gmazurkevich.training.library.datamodel.DepartmentType;


public class DepartmentTypeChoiceRenderer extends ChoiceRenderer<DepartmentType> {

    public static final DepartmentTypeChoiceRenderer INSTANCE = new DepartmentTypeChoiceRenderer();

    private DepartmentTypeChoiceRenderer() {
        super();
    }

    @Override
    public Object getDisplayValue(DepartmentType object) {
        return object.name();
    }

    @Override
    public String getIdValue(DepartmentType object, int index) {
        return String.valueOf(object.ordinal());
    }
}