package com.gmazurkevich.training.library.webapp.common;

import org.apache.wicket.markup.html.form.ChoiceRenderer;

import com.gmazurkevich.training.library.datamodel.Department;

public class DepartmentChoiceRenderer extends ChoiceRenderer<Department> {

    public static final DepartmentChoiceRenderer INSTANCE = new DepartmentChoiceRenderer();

    private DepartmentChoiceRenderer() {
        super();
    }

    @Override
    public Object getDisplayValue(Department object) {
        return object.getName();
    }

    @Override
    public String getIdValue(Department object, int index) {
        return String.valueOf(object.getId());
    }
}