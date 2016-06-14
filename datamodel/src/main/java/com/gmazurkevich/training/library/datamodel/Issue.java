package com.gmazurkevich.training.library.datamodel;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

@Entity
public class Issue extends AbstractModel {

	private static final long serialVersionUID = 1L;
	
	@ManyToOne(targetEntity = CopyBook.class, fetch = FetchType.LAZY)
	private CopyBook copyBook;
	
	@ManyToOne(targetEntity = UserProfile.class, fetch = FetchType.LAZY)
	private UserProfile reader;

	@Column(updatable = false)
	private Date dateTake;

	@Column(updatable = false)
	private Date dateReturn;

	@Column
	private Date plannedDateReturn;

	public CopyBook getCopyBook() {
		return copyBook;
	}

	public void setCopyBook(CopyBook copyBook) {
		this.copyBook = copyBook;
	}

	public UserProfile getReader() {
		return reader;
	}

	public void setReader(UserProfile reader) {
		this.reader = reader;
	}

	public Date getDateTake() {
		return dateTake;
	}

	public void setDateTake(Date dateTake) {
		this.dateTake = dateTake;
	}

	public Date getDateReturn() {
		return dateReturn;
	}

	public void setDateReturn(Date dateReturn) {
		this.dateReturn = dateReturn;
	}

	public Date getPlannedDateReturn() {
		return plannedDateReturn;
	}

	public void setPlannedDateReturn(Date plannedDateReturn) {
		this.plannedDateReturn = plannedDateReturn;
	}

}
