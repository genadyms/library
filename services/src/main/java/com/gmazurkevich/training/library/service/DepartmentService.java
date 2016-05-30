package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.DepartmentFilter;
import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyItemException;

public interface DepartmentService {

	Department getDepartment(Long id);

	@Transactional
	void update(Department department);

	@Transactional
	void delete(Department department) throws DeleteNotEmptyItemException;

	@Transactional
	void save(Department department);

	List<Department> find(DepartmentFilter departmentFilter);

	Long count(DepartmentFilter departmentFilter);

	List<Department> getAll();
}
