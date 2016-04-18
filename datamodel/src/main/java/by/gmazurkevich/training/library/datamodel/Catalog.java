package by.gmazurkevich.training.library.datamodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

@Entity
public class Catalog extends AbstractModel {
	@Column
	private String path;

	@Column
	private String pathParent;

	@OneToMany(mappedBy = "Catalog", fetch = FetchType.LAZY)
	private List<Book> books;

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPathParent() {
		return pathParent;
	}

	public void setPathParent(String pathParent) {
		this.pathParent = pathParent;
	}
}
