package by.gmazurkevich.training.library.datamodel;

import java.awt.print.Book;

public class CopyBook extends AbstractModel {
	private Book book;
	private Department department;
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
