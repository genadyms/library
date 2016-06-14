package com.gmazurkevich.training.library.dataaccess.filters;

import com.gmazurkevich.training.library.datamodel.CopyBook;

public class OrderFilter extends AbstractFilter {
	private boolean fetchCopyBook;
	private boolean fetchUserProfile;
	private CopyBook copyBook;
	private boolean statusActive;
	
	public boolean isFetchCopyBook() {
		return fetchCopyBook;
	}
	public void setFetchCopyBook(boolean fetchCopyBook) {
		this.fetchCopyBook = fetchCopyBook;
	}
	public CopyBook getCopyBook() {
		return copyBook;
	}
	public void setCopyBook(CopyBook copyBook) {
		this.copyBook = copyBook;
	}
	public boolean isStatusActive() {
		return statusActive;
	}
	public void setStatusActive(boolean statusActive) {
		this.statusActive = statusActive;
	}
	
}
