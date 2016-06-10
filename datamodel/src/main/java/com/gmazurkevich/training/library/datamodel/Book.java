package com.gmazurkevich.training.library.datamodel;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Book extends AbstractModel {

	private static final long serialVersionUID = 1L;

	@Column
	private String publishingOffice;

	@Column
	private String isbn;

	@ManyToOne(targetEntity = Catalog.class, fetch = FetchType.LAZY)
	private Catalog catalog;

	@Column
	private String title;

	@Column
	private Integer pages;

	@Column
	private Date year;

	@JoinTable(name = "book_2_author", joinColumns = { @JoinColumn(name = "book_id") }, inverseJoinColumns = {
			@JoinColumn(name = "author_id") })
	@ManyToMany(targetEntity = Author.class, fetch = FetchType.LAZY)
	private List<Author> authors = new ArrayList<Author>();

	@Override
	public String toString() {
		return "Book [isbn=" + isbn + ", title=" + title + ", pages=" + pages + ", year=" + year + ", bookComment="
		/* + comments */ + ", publishingOffice=" + publishingOffice + "]";
	}

	public List<Author> getAuthors() {
		return authors;
	}

	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}

	public Catalog getCatalog() {
		return catalog;
	}

	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public Date getYear() {
		return year;
	}

	public void setYear(Date year) {
		this.year = year;
	}

	public String getPublishingOffice() {
		return publishingOffice;
	}

	public void setPublishingOffice(String publishingOffice) {
		this.publishingOffice = publishingOffice;
	}
}
