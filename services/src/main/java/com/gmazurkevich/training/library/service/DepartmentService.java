package com.gmazurkevich.training.library.service;

import javax.transaction.Transactional;

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

}
