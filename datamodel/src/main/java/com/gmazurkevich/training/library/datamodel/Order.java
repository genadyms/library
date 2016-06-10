package com.gmazurkevich.training.library.datamodel;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "\"order\"")
public class Order extends AbstractModel {
	private static final long serialVersionUID = 1L;

	@ManyToOne(targetEntity = UserProfile.class, fetch = FetchType.LAZY)
	private UserProfile reader;

	@ManyToOne(targetEntity = UserProfile.class, fetch = FetchType.LAZY)
	private UserProfile librarian;

	@ManyToOne(targetEntity = CopyBook.class, fetch = FetchType.LAZY)
	private CopyBook copyBook;

	@Column
	private Date created;

	@Column
	private Date handled;

	@Column
	private Date closed;

	@Column
	private Date reserved;

	public Date getReserved() {
		return reserved;
	}

	public void setReserved(Date reserved) {
		this.reserved = reserved;
	}

	public CopyBook getCopyBook() {
		return copyBook;
	}

	public void setCopyBook(CopyBook copyBook) {
		this.copyBook = copyBook;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getHandled() {
		return handled;
	}

	public void setHandled(Date handled) {
		this.handled = handled;
	}

	public Date getClosed() {
		return closed;
	}

	public void setClosed(Date closed) {
		this.closed = closed;
	}

	public UserProfile getReader() {
		return reader;
	}

	public void setReader(UserProfile reader) {
		this.reader = reader;
	}

	public UserProfile getLibrarian() {
		return librarian;
	}

	public void setLibrarian(UserProfile librarian) {
		this.librarian = librarian;
	}

}
