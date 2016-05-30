package com.gmazurkevich.training.library.webapp.page.department;

import java.util.Arrays;

import javax.inject.Inject;

import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.SubmitLink;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.FeedbackPanel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.request.mapper.parameter.PageParameters;

import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.datamodel.DepartmentType;
import com.gmazurkevich.training.library.service.DepartmentService;
import com.gmazurkevich.training.library.webapp.common.DepartmentTypeChoiceRenderer;
import com.gmazurkevich.training.library.webapp.page.AbstractPage;


public class DepartmentEditPage extends AbstractPage {

	@Inject
	private DepartmentService departmentService;

	private Department department;

	public DepartmentEditPage(PageParameters parameters) {
		super(parameters);
	}

	public DepartmentEditPage(Department department) {
		super();
		this.department = department;
	}

	@Override
	protected void onInitialize() {
		super.onInitialize();

		Form<Department> form = new DepartmentForm<Department>("form",
				new CompoundPropertyModel<Department>(department));
		add(form);

		TextField<String> nameField = new TextField<>("name");
		nameField.setRequired(true);
		form.add(nameField);

		DropDownChoice<DepartmentType> typeField = new DropDownChoice<>("type", Arrays.asList(DepartmentType.values()),
				DepartmentTypeChoiceRenderer.INSTANCE);
		typeField.setRequired(true);
		form.add(typeField);

		TextField<String> phoneField = new TextField<>("phone");
		phoneField.setRequired(true);
		form.add(phoneField);

		TextField<String> addressField = new TextField<>("address");
		addressField.setRequired(true);
		form.add(addressField);

		form.add(new SubmitLink("save") {
			@Override
			public void onSubmit() {
				super.onSubmit();
				if(department.getId()!=null){
					departmentService.update(department);
				} else {
					departmentService.save(department);
				}
				setResponsePage(new DepartmentsPage());
			}
		});

		add(new FeedbackPanel("feedback"));
	}

	private class DepartmentForm<T> extends Form<T> {

		public DepartmentForm(String id, IModel<T> model) {
			super(id, model);
		}
	}

}
