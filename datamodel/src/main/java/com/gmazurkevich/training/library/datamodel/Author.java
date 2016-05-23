package com.gmazurkevich.training.library.datamodel;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;

@Entity
public class Author extends AbstractModel {
	@Column
	private String firstName;

	@Column
	private String secondName;

	// @JoinTable(name = "book_2_author", joinColumns = {@JoinColumn(name =
	// "author_id") }, inverseJoinColumns = { @JoinColumn(name = "book_id") })
	// @ManyToMany(targetEntity = Book.class, fetch = FetchType.LAZY)
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "authors")
	private Set<Book> books;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((secondName == null) ? 0 : secondName.hashCode());
		return result;
	}

	@Override
	public String toString() {
		return "Author [firstName=" + firstName + ", secondName=" + secondName + ", getId()=" + getId() + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Author other = (Author) obj;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (secondName == null) {
			if (other.secondName != null)
				return false;
		} else if (!secondName.equals(other.secondName))
			return false;
		return true;
	}

	public String getSecondName() {
		return secondName;
	}

	public void setSecondName(String secondName) {
		this.secondName = secondName;
	}

	public Set<Book> getBooks() {
		return books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}
}
