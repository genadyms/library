package com.gmazurkevich.training.library.dataaccess.filters;

import com.gmazurkevich.training.library.datamodel.Catalog;

public class CatalogFilter extends AbstractFilter {
	private String title;
	private Catalog parent;
	private boolean fetchParent;
	private boolean root;
	private boolean books;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Catalog getParent() {
		return parent;
	}

	public void setParent(Catalog parent) {
		this.parent = parent;
	}

	public boolean isFetchParent() {
		return fetchParent;
	}

	public void setFetchParent(boolean fetchParent) {
		this.fetchParent = fetchParent;
	}

	public boolean isRoot() {
		return root;
	}

	public void setRoot(boolean root) {
		this.root = root;
	}

	public boolean isBooks() {
		return books;
	}

	public void setBooks(boolean books) {
		this.books = books;
	}

}
