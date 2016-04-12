package by.gmazurkevich.training.library.datamodel;

import java.util.List;

public class Keyword extends AbstractModel {
	private String value;
	private String key;
	private List<Book> book;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public List<Book> getBook() {
		return book;
	}

	public void setBook(List<Book> book) {
		this.book = book;
	}

}
