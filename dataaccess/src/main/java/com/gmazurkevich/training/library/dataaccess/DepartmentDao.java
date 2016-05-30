package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.DepartmentFilter;
import com.gmazurkevich.training.library.datamodel.Department;

public interface DepartmentDao extends AbstractDao<Department, Long> {

	List<Department> find(DepartmentFilter departmentFilter);

	Long count(DepartmentFilter filter);

}
