package by.gmazurkevich.training.library.dataaccess.filters;

import java.util.List;

import javax.persistence.metamodel.SingularAttribute;

import by.gmazurkevich.training.library.datamodel.Author;
import by.gmazurkevich.training.library.datamodel.Catalog;

public class BookFilter {
	private String isbn;
	private Catalog catalog;
	private String publishingOffice;
	private String title;
	private List<Author> authors;;
//	private SingularAttribute sortProperty;
//	private boolean sortOrder;
//	private Integer offset;
//	private Integer limit;
//	private boolean isFetchCatalog;
//	private boolean isFetchAuthors;

	
	public Catalog getCatalog() {
		return catalog;
	}

	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getPublishingOffice() {
		return publishingOffice;
	}

	public void setPublishingOffice(String publishingOffice) {
		this.publishingOffice = publishingOffice;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Author> getAuthors() {
		return authors;
	}

	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}


}
