package by.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.DepartmentDao;
import by.gmazurkevich.training.library.datamodel.Department;

@Repository
public class DepartmentDaoImpl extends AbstractDaoImpl<Department, Long> implements DepartmentDao {

	protected DepartmentDaoImpl() {
		super(Department.class);
	}

}