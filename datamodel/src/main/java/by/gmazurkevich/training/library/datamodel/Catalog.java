package by.gmazurkevich.training.library.datamodel;

public class Catalog extends AbstractModel {
	private String path;
	private String pathParent;

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
