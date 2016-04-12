package by.gmazurkevich.training.library.datamodel;

import java.util.Date;
import java.util.List;

public class Order extends AbstractModel {
	private UserProfile reader;
	private UserProfile librarian;
	private CopyBook copyBook;
	private TypeOrder typeOrder;
	private Date created;
	private Date handled;
	private Date closed;
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
