package by.gmazurkevich.training.library.datamodel;

import java.util.Date;
import java.util.List;

public class Book {

	private Long isbn;
	private Catalog catalog;
	private String title;
	private Integer pages;
	private Date year;
	private List<Author> author;
	private List<BookComment> bookComment;
	private List<Keyword> keyword;
	private String publishingOffice;

	public Long getIsbn() {
		return isbn;
	}

	public void setIsbn(Long isbn) {
		this.isbn = isbn;
	}

	public Catalog getCatalog() {
		return catalog;
	}

	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public Date getYear() {
		return year;
	}

	public void setYear(Date year) {
		this.year = year;
	}

	public List<Author> getAuthor() {
		return author;
	}

	public void setAuthor(List<Author> author) {
		this.author = author;
	}

	public List<BookComment> getBookComment() {
		return bookComment;
	}

	public void setBookComment(List<BookComment> bookComment) {
		this.bookComment = bookComment;
	}

	public List<Keyword> getKeyword() {
		return keyword;
	}

	public void setKeyword(List<Keyword> keyword) {
		this.keyword = keyword;
	}

	public String getPublishingOffice() {
		return publishingOffice;
	}

	public void setPublishingOffice(String publishingOffice) {
		this.publishingOffice = publishingOffice;
	}
}
