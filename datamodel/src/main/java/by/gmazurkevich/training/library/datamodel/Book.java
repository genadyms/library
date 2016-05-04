package by.gmazurkevich.training.library.datamodel;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Book extends AbstractModel {
	@Override
	public String toString() {
		return "Book [isbn=" + isbn + ", catalog=" + catalog + ", title=" + title + ", pages=" + pages + ", year="
				+ year + ", author=" + author + ", bookComment=" + bookComment + ", publishingOffice="
				+ publishingOffice + "]";
	}

	@Column
	private String isbn;

	@ManyToOne(targetEntity = CatalogOld.class, fetch = FetchType.LAZY)
	private CatalogOld catalog;

	@Column
	private String title;

	@Column
	private Integer pages;

	@Column
	private Date year;

	@JoinTable(name = "book_2_author", joinColumns = { @JoinColumn(name = "book_id") }, inverseJoinColumns = {
			@JoinColumn(name = "author_id") })
	@ManyToMany(targetEntity = Author.class, fetch = FetchType.LAZY)
	private List<Author> author;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "book_2_comment", joinColumns = { @JoinColumn(name = "book_id") }, inverseJoinColumns = {
			@JoinColumn(name = "comment_id", unique = true) })
	private List<Comment> bookComment;

	@Column
	private String publishingOffice;

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

	public List<Comment> getBookComment() {
		return bookComment;
	}

	public void setBookComment(List<Comment> bookComment) {
		this.bookComment = bookComment;
	}

	public String getPublishingOffice() {
		return publishingOffice;
	}

	public void setPublishingOffice(String publishingOffice) {
		this.publishingOffice = publishingOffice;
	}
}
