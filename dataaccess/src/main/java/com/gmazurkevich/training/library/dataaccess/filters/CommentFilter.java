package com.gmazurkevich.training.library.dataaccess.filters;

import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Order;

public class CommentFilter extends AbstractFilter {
	private Book book;
	private Order order;

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	
}
