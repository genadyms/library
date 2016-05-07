package com.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.DepartmentDao;
import com.gmazurkevich.training.library.datamodel.Department;

@Repository
public class DepartmentDaoImpl extends AbstractDaoImpl<Department, Long> implements DepartmentDao {

	protected DepartmentDaoImpl() {
		super(Department.class);
	}

}