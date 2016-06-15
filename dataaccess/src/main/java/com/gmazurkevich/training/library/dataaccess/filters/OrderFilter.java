package com.gmazurkevich.training.library.dataaccess.filters;

import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.UserProfile;

public class OrderFilter extends AbstractFilter {
private static final long serialVersionUID = 1L;
	private boolean fetchCopyBook;
	private boolean fetchUserProfile;
	private CopyBook copyBook;
	private boolean statusActive;
	private UserProfile reader;
	
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
	public UserProfile getReader() {
		return reader;
	}
	public void setReader(UserProfile reader) {
		this.reader = reader;
	}
	
}
