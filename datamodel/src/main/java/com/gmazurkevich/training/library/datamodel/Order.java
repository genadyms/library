package com.gmazurkevich.training.library.datamodel;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Order extends AbstractModel {
	@ManyToOne(targetEntity = UserProfile.class, fetch = FetchType.LAZY)
	private UserProfile readerId;

	@ManyToOne(targetEntity = UserProfile.class, fetch = FetchType.LAZY)
	private UserProfile librarianId;

	@ManyToOne(targetEntity = CopyBook.class, fetch = FetchType.LAZY)
	private CopyBook copyBook;

	@Column
	private Date created;

	@Column
	private Date handled;

	@Column
	private Date closed;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "order_2_comment", joinColumns = {
			@JoinColumn(name = "order_id", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "comment_id", referencedColumnName = "id", unique = true) })
	private List<Comment> comment;

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

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

	public UserProfile getReaderId() {
		return readerId;
	}

	public void setReaderId(UserProfile readerId) {
		this.readerId = readerId;
	}

	public UserProfile getLibrarianId() {
		return librarianId;
	}

	public void setLibrarianId(UserProfile librarianId) {
		this.librarianId = librarianId;
	}

	
}
