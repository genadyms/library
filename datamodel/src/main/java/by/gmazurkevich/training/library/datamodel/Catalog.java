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

	@OneToMany(mappedBy = "catalog", fetch = FetchType.LAZY)
	private List<Book> book;

	public List<Book> getBooks() {
		return book;
	}

	public void setBooks(List<Book> books) {
		this.book = books;
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
