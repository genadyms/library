package by.gmazurkevich.training.library.dataaccess.filters;

import javax.persistence.metamodel.SingularAttribute;

import by.gmazurkevich.training.library.datamodel.CatalogOld;

public class BookFilter {
	private String isbn;
	private CatalogOld catalog;
	private String publishingOffice;
	private String title;
//	private SingularAttribute sortProperty;
//	private boolean sortOrder;
//	private Integer offset;
//	private Integer limit;
//	private boolean isFetchCatalog;
//	private boolean isFetchAuthors;

	
	public CatalogOld getCatalog() {
		return catalog;
	}

	public void setCatalog(CatalogOld catalog) {
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
}
