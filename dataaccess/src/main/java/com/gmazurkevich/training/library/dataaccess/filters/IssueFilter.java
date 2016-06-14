package com.gmazurkevich.training.library.dataaccess.filters;

import com.gmazurkevich.training.library.datamodel.CopyBook;

public class IssueFilter extends AbstractFilter {

	private static final long serialVersionUID = 1L;
	private CopyBook copyBook;
	private boolean statusActive;

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