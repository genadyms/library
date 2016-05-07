package com.gmazurkevich.training.library.dataaccess.filters;

import com.gmazurkevich.training.library.datamodel.Catalog;

public class CatalogFilter {
	private String title;
	private Catalog parent;
	private boolean fetchParent;

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

}
