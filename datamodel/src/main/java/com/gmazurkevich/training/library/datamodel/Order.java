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

	@ManyToOne(targetEntity = UserProfile.class, fetch = FetchType.LAZY)
	private UserProfile reader;

	@ManyToOne(targetEntity = UserProfile.class, fetch = FetchType.LAZY)
	private UserProfile librarian;

	@ManyToOne(targetEntity = CopyBook.class, fetch = FetchType.LAZY)
	private CopyBook copyBook;

	@OneToMany(fetch = FetchType.LAZY, targetEntity = Comment.class)
	@JoinTable(name = "order_2_comment", joinColumns = { @JoinColumn(name = "order_id") }, inverseJoinColumns = {
			@JoinColumn(name = "comment_id", referencedColumnName = "id", unique = true) })
	private List<Comment> comments;

	@Column(insertable = false, updatable = false)
	private Date created;

	@Column
	private Date handled;

	@Column
	private Date closed;


	public CopyBook getCopyBook() {
		return copyBook;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((closed == null) ? 0 : closed.hashCode());
		result = prime * result + ((comments == null) ? 0 : comments.hashCode());
		result = prime * result + ((copyBook == null) ? 0 : copyBook.hashCode());
		result = prime * result + ((created == null) ? 0 : created.hashCode());
		result = prime * result + ((handled == null) ? 0 : handled.hashCode());
		result = prime * result + ((librarian == null) ? 0 : librarian.hashCode());
		result = prime * result + ((reader == null) ? 0 : reader.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Order other = (Order) obj;
		if (closed == null) {
			if (other.closed != null)
				return false;
		} else if (!closed.equals(other.closed))
			return false;
		if (comments == null) {
			if (other.comments != null)
				return false;
		} else if (!comments.equals(other.comments))
			return false;
		if (copyBook == null) {
			if (other.copyBook != null)
				return false;
		} else if (!copyBook.equals(other.copyBook))
			return false;
		if (created == null) {
			if (other.created != null)
				return false;
		} else if (!created.equals(other.created))
			return false;
		if (handled == null) {
			if (other.handled != null)
				return false;
		} else if (!handled.equals(other.handled))
			return false;
		if (librarian == null) {
			if (other.librarian != null)
				return false;
		} else if (!librarian.equals(other.librarian))
			return false;
		if (reader == null) {
			if (other.reader != null)
				return false;
		} else if (!reader.equals(other.reader))
			return false;
		return true;
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
