package com.gmazurkevich.training.library.datamodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.JoinColumn;


@Entity
public class Author extends AbstractModel {
	@Column
	private String firstName;
	
	@Column
	private String secondName;
	
	@JoinTable(name = "book_2_author", joinColumns = {@JoinColumn(name = "author_id") }, inverseJoinColumns = { @JoinColumn(name = "book_id") })
    @ManyToMany(targetEntity = Book.class, fetch = FetchType.LAZY)
	private List<Book> book;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSecondName() {
		return secondName;
	}

	public void setSecondName(String secondName) {
		this.secondName = secondName;
	}

	public List<Book> getBook() {
		return book;
	}

	public void setBook(List<Book> book) {
		this.book = book;
	}
}
