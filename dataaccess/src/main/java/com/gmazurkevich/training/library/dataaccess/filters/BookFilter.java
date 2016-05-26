package com.gmazurkevich.training.library.dataaccess.filters;

import java.util.Set;

import com.gmazurkevich.training.library.datamodel.Author;
import com.gmazurkevich.training.library.datamodel.Catalog;

public class BookFilter extends AbstractFilter{
	private String isbn;
	private Catalog catalog;
	private String publishingOffice;
	private String title;
	private Set<Author> authors;
	private boolean fetchComment;

	public boolean isFetchComment() {
		return fetchComment;
	}

	public void setFetchComment(boolean fetchComment) {
		this.fetchComment = fetchComment;
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

	public String getPublishingOffice() {
		return publishingOffice;
	}

	public void setPublishingOffice(String publishingOffice) {
		this.publishingOffice = publishingOffice;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Set<Author> getAuthors() {
		return authors;
	}

	public void setAuthors(Set<Author> authors) {
		this.authors = authors;
	}

}
