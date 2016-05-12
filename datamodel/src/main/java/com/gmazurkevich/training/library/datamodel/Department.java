package com.gmazurkevich.training.library.datamodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;

@Entity
public class Department extends AbstractModel {
	@Column
	private String name;

	@Column
	@Enumerated(value = EnumType.ORDINAL)
	private DepartmentType type;
	
	@Column
	private String phone;
	
	@Column
	private String address;
	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "department_2_user_profile", joinColumns = { @JoinColumn(name = "department_id") }, inverseJoinColumns = {
			@JoinColumn(name = "user_profile_id", unique = true) })
	private List<UserProfile> librarian;
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public DepartmentType getType() {
		return type;
	}

	public void setType(DepartmentType type) {
		this.type = type;
	}

}
