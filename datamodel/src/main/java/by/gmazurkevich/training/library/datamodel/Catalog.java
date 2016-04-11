package by.gmazurkevich.training.library.datamodel;

public class Catalog extends AbstractModel {
	private Catalog parent;
	private String title;

	public Catalog getParent() {
		return parent;
	}

	public void setParent(Catalog parent) {
		this.parent = parent;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
