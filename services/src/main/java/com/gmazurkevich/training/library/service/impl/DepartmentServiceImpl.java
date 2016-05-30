package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.DepartmentDao;
import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.dataaccess.filters.DepartmentFilter;
import com.gmazurkevich.training.library.dataaccess.filters.UserFilter;
import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.service.CopyBookService;
import com.gmazurkevich.training.library.service.DepartmentService;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyItemException;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Inject
	private DepartmentDao departmentDao;

	@Inject
	private UserService userService;

	@Inject
	private CopyBookService copyBookService;

	@Override
	public Department getDepartment(Long id) {
		return departmentDao.get(id);
	}

	@Override
	public void update(Department department) {
		departmentDao.update(department);
	}

	@Override
	public void delete(Department department) throws DeleteNotEmptyItemException {
		if (isNotEmpty(department))
			throw new DeleteNotEmptyItemException();
		departmentDao.delete(department.getId());
	}

	private boolean isNotEmpty(Department department) {
		boolean result = isUsers(department) || isBooks(department);
		return result;
	}

	private boolean isBooks(Department department) {
		CopyBookFilter filter = new CopyBookFilter();
		filter.setDepartment(department);
		return !copyBookService.find(filter).isEmpty();
	}

	private boolean isUsers(Department department) {
		UserFilter userFilter = new UserFilter();
		userFilter.setDepartment(department);
		return !userService.find(userFilter).isEmpty();
	}

	@Override
	public void save(Department department) {
		departmentDao.insert(department);
	}

	@Override
	public List<Department> find(DepartmentFilter departmentFilter) {
		return departmentDao.find(departmentFilter);
	}

	@Override
	public Long count(DepartmentFilter departmentFilter) {
		return departmentDao.count(departmentFilter);
	}

	@Override
	public List<Department> getAll() {
		return departmentDao.getAll();
	}

}
