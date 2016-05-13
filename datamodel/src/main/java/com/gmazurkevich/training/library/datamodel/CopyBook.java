package com.gmazurkevich.training.library.datamodel;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

@Entity
public class CopyBook extends AbstractModel {
	@ManyToOne(targetEntity = Book.class, fetch = FetchType.LAZY)
	private Book book;

	@ManyToOne(targetEntity = Department.class, fetch = FetchType.LAZY)
	private Department department;

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
}
