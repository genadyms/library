package by.gmazurkevich.training.library.datamodel;

import java.util.List;

public class Keyword extends AbstractModel {
	private String value;
	private Integer weight;
	private List<Book> book;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public List<Book> getBook() {
		return book;
	}

	public void setBook(List<Book> book) {
		this.book = book;
	}
}
