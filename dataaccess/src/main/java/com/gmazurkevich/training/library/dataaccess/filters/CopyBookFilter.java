package com.gmazurkevich.training.library.dataaccess.filters;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Department;

public class CopyBookFilter extends AbstractFilter {

	private Book book;

	private boolean findFreeCopyBook;

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public boolean isFindFreeCopyBook() {
		return findFreeCopyBook;
	}

	public void setFindFreeCopyBook(boolean findFreeCopyBook) {
		this.findFreeCopyBook = findFreeCopyBook;
	}

	private Department department;
}
