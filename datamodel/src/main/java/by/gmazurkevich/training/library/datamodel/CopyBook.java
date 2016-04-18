package by.gmazurkevich.training.library.datamodel;

import java.awt.print.Book;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

@Entity
public class CopyBook extends AbstractModel {
	@ManyToOne(targetEntity = Book.class, fetch = FetchType.LAZY)
	private Book book;
	
	@ManyToOne(targetEntity = Department.class, fetch = FetchType.LAZY)
	private Department department;

	@Column
	@Enumerated(value = EnumType.STRING)
	private StateBook state;

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public StateBook getState() {
		return state;
	}

	public void setState(StateBook state) {
		this.state = state;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
}
