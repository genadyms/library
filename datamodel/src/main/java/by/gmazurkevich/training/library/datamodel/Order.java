package by.gmazurkevich.training.library.datamodel;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Order extends AbstractModel {
	@Column(name="reader_id")
	@OneToOne(fetch = FetchType.LAZY, optional = false, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinColumn(nullable = false, updatable = false, name = "id")
	private UserProfile reader;
	
	@Column(name="librarian_id")
	@OneToOne(fetch = FetchType.LAZY, optional = false, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinColumn(updatable = false, name = "id")
	private UserProfile librarian;

	@ManyToOne(targetEntity = CopyBook.class, fetch = FetchType.LAZY)
	private CopyBook copyBook;

	@Column
	@Enumerated(value = EnumType.STRING)
	private TypeOrder typeOrder;

	@Column
	private Date created;

	@Column
	private Date handled;

	@Column
	private Date closed;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(name="order_2_comment", joinColumns={ @JoinColumn(name="order_id", referencedColumnName="id")},
	inverseJoinColumns={ @JoinColumn(name="comment_id",referencedColumnName="id", unique=true)})
	private List<Comment> comment;

	public CopyBook getCopyBook() {
		return copyBook;
	}

	public void setCopyBook(CopyBook copyBook) {
		this.copyBook = copyBook;
	}

	public TypeOrder getTypeOrder() {
		return typeOrder;
	}

	public void setTypeOrder(TypeOrder typeOrder) {
		this.typeOrder = typeOrder;
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
