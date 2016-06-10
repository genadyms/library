package com.gmazurkevich.training.library.dataaccess.filters;

public class OrderFilter extends AbstractFilter {
	private boolean fetchCopyBook;
	private boolean fetchUserProfile;
	public boolean isFetchCopyBook() {
		return fetchCopyBook;
	}
	public void setFetchCopyBook(boolean fetchCopyBook) {
		this.fetchCopyBook = fetchCopyBook;
	}
}
