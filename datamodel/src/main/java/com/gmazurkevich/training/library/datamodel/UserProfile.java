package com.gmazurkevich.training.library.datamodel;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;

@Entity
public class UserProfile extends AbstractModel {
	private static final long serialVersionUID = 1L;

	@MapsId
	@OneToOne(fetch = FetchType.LAZY, optional = false, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(nullable = false, updatable = false, name = "id")
	private UserCredentials userCredentials;

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinTable(name = "department_2_user_profile", joinColumns = {
			@JoinColumn(name = "user_profile_id", unique = true) }, inverseJoinColumns = {
					@JoinColumn(name = "department_id") })
	private Department department;

	@Column
	private String firstName;

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Column
	private String lastName;

	@Column(insertable = false)
	private Date created;

	@PrePersist
	protected void onCreate() {
		created = new Date();
	}

	@Column
	@Enumerated(value = EnumType.ORDINAL)
	private UserState state;

	@Column
	@Enumerated(value = EnumType.ORDINAL)
	private UserRole role;

	@Column
	private String phone;

	@Column
	private String address;

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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public UserCredentials getUserCredentials() {
		return userCredentials;
	}

	public void setUserCredentials(UserCredentials userCredentials) {
		this.userCredentials = userCredentials;
	}

	public UserState getState() {
		return state;
	}

	public void setState(UserState state) {
		this.state = state;
	}

	public UserRole getRole() {
		return role;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}
}
