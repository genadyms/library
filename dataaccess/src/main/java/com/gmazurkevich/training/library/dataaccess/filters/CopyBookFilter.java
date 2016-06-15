package com.gmazurkevich.training.library.dataaccess.filters;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Department;

public class CopyBookFilter extends AbstractFilter {

	private Book book;
	private boolean fetchBook;
	private boolean fetchDepartment;
	private boolean fetchIssue;
	private boolean fetchOrder;
	private Long copyBookId;

	public Long getCopyBookId() {
		return copyBookId;
	}

	public void setCopyBookId(Long copyBookId) {
		this.copyBookId = copyBookId;
	}

	public boolean isFetchIssue() {
		return fetchIssue;
	}

	public void setFetchIssue(boolean fetchIssue) {
		this.fetchIssue = fetchIssue;
	}

	public boolean isFetchOrder() {
		return fetchOrder;
	}

	public void setFetchOrder(boolean fetchOrder) {
		this.fetchOrder = fetchOrder;
	}

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

	private Department department;

	public boolean isFetchBook() {
		return fetchBook;
	}

	public void setFetchBook(boolean fetchBook) {
		this.fetchBook = fetchBook;
	}

	public boolean isFetchDepartment() {
		return fetchDepartment;
	}

	public void setFetchDepartment(boolean fetchDepartment) {
		this.fetchDepartment = fetchDepartment;
	}

}
