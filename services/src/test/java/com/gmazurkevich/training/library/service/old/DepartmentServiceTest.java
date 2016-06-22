package com.gmazurkevich.training.library.service.old;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.datamodel.DepartmentType;
import com.gmazurkevich.training.library.datamodel.UserProfile;
import com.gmazurkevich.training.library.service.DepartmentService;
import com.gmazurkevich.training.library.service.UserService;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyItemException;
import com.gmazurkevich.training.library.service.old.mocks.DepartmentUtil;
import com.gmazurkevich.training.library.service.old.mocks.UserUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class DepartmentServiceTest {
	@Inject
	private DepartmentService departmentService;
	
	@Inject
	private UserService userService;
	
	@Test
	public void test() {
		Assert.assertNotNull(departmentService);
	}

	@Test
	public void testPersist() {
		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);
		Assert.assertNotNull(departmentService.getDepartment(department.getId()));
	}

	@Test
	public void testUpdate() {
		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);
		Department savedDepartment = departmentService.getDepartment(department.getId());
		String name = "new name";
		String phone = "2345" + System.currentTimeMillis();
		DepartmentType type = DepartmentType.READING_ROOM;
		String address = "grodno " + System.currentTimeMillis();
		savedDepartment.setAddress(address);
		savedDepartment.setName(name);
		savedDepartment.setType(type);
		savedDepartment.setPhone(phone);
		departmentService.update(savedDepartment);
		Department updatedDepartment = departmentService.getDepartment(savedDepartment.getId());
		Assert.assertEquals(updatedDepartment.getAddress(), address);
		Assert.assertEquals(updatedDepartment.getName(), name);
		Assert.assertEquals(updatedDepartment.getType(), type);
		Assert.assertEquals(updatedDepartment.getPhone(), phone);
	}

	@Test
	public void testDelete() {
		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);
		Assert.assertNotNull(departmentService.getDepartment(department.getId()));
		DeleteNotEmptyItemException exception = null;
		try {
			departmentService.delete(department);
		} catch (DeleteNotEmptyItemException e) {
			exception = e;
		}
		Assert.assertNull(exception);
		Assert.assertNull(departmentService.getDepartment(department.getId()));
	}
	
	@Test
	public void testDeleteWithUser() {
		Department department = DepartmentUtil.createDepartment();
		departmentService.save(department);
		UserProfile user = UserUtil.createUser();
		user.setDepartment(department);
		userService.register(user,user.getUserCredentials());
		DeleteNotEmptyItemException exception = null;
		try {
			departmentService.delete(department);
		} catch (DeleteNotEmptyItemException e) {
			exception = e;
		}
		Assert.assertNotNull(exception);
		Assert.assertNotNull(departmentService.getDepartment(department.getId()));
	}
}
