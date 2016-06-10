package com.gmazurkevich.training.library.datamodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;

@Entity
public class Department extends AbstractModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column
	private String name;

	@OneToMany(mappedBy = "department")
	private List<CopyBook> copyBooks;

	@OneToMany(mappedBy = "department")
	private List<UserProfile> librarians;

	@Column
	@Enumerated(value = EnumType.ORDINAL)
	private DepartmentType type;

	@Column
	private String phone;

	@Column
	private String address;

	@Override
	public String toString() {
		return "Department [name=" + name + ", type=" + type + ", phone=" + phone + ", address=" + address + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Department other = (Department) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (type != other.type)
			return false;
		return true;
	}

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

	public List<CopyBook> getCopyBooks() {
		return copyBooks;
	}

	public void setCopyBooks(List<CopyBook> copyBooks) {
		this.copyBooks = copyBooks;
	}

	public List<UserProfile> getLibrarians() {
		return librarians;
	}

	public void setLibrarians(List<UserProfile> librarians) {
		this.librarians = librarians;
	}

}
