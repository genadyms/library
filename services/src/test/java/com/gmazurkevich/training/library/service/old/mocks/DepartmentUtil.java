package com.gmazurkevich.training.library.service.old.mocks;

import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.datamodel.DepartmentType;

public class DepartmentUtil {

	public static Department createDepartment() {
		Department department = new Department();
		department.setAddress("Grodno, ul. departmentStreet");
		department.setName("department name");
		department.setType(DepartmentType.ABONEMENT);
		department.setPhone("phone "+System.currentTimeMillis());
		return department;
	}

}
