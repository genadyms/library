package com.gmazurkevich.training.library.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Contact extends AbstractModel {
	
	@Column
	private String phone;
	
	@Column
	private String address;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
