package by.gmazurkevich.training.library.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Department extends AbstractModel {
	@Column
	private String name;
	@Column
	private Contact contact;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}
}
