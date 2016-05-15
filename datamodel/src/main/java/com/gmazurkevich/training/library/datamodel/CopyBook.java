package com.gmazurkevich.training.library.datamodel;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class CopyBook extends AbstractModel {
	@ManyToOne(targetEntity = Book.class, fetch = FetchType.LAZY)
	private Book book;

	@ManyToOne(targetEntity = Department.class, fetch = FetchType.LAZY)
	private Department department;
	
	@OneToMany(mappedBy = "copyBook")
	private List<Order> orders;
	
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

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
}
