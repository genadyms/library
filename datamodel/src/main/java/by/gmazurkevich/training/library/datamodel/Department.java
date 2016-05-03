package by.gmazurkevich.training.library.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Department extends AbstractModel {
	@Column
	private String name;

	@Column
	@Enumerated(value = EnumType.ORDINAL)
	private DepartmentType type;

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

	public DepartmentType getType() {
		return type;
	}

	public void setType(DepartmentType type) {
		this.type = type;
	}

}
