package by.gmazurkevich.training.library.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Department extends AbstractModel {
	@Column
	private String name;

	@OneToOne
	@JoinColumn(name = "contact_id")
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
