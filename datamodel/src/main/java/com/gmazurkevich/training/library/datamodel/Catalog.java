package com.gmazurkevich.training.library.datamodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Catalog extends AbstractModel {

	private static final long serialVersionUID = 1L;

	@Column
	private String title;

	@ManyToOne(targetEntity = Catalog.class, fetch = FetchType.LAZY)
	private Catalog parent;

	@OneToMany(mappedBy = "catalog")
	private List<Book> book;

	@Override
	public String toString() {
		return title;
	}

	@OneToMany(mappedBy = "parent")
	private List<Catalog> childs;

	public List<Book> getBook() {
		return book;
	}

	public void setBook(List<Book> book) {
		this.book = book;
	}

	public List<Catalog> getChilds() {
		return childs;
	}

	public void setChilds(List<Catalog> childs) {
		this.childs = childs;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Catalog getParent() {
		return parent;
	}

	public void setParent(Catalog parent) {
		this.parent = parent;
	}

}
