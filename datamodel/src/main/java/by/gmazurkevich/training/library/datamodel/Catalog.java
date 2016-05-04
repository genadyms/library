package by.gmazurkevich.training.library.datamodel;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Catalog {
	
	@Id
	private String id;
	
	@ManyToOne(targetEntity = Catalog.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	private Catalog parent;
	
	@Override
	public String toString() {
		return "CatalogTest [id=" + id + ", parent=" + parent + ", childs=" + childs + "]";
	}

	@OneToMany(mappedBy = "parent")
	private List<Catalog> childs;

	public List<Catalog> getChilds() {
		return childs;
	}

	public void setChilds(List<Catalog> childs) {
		this.childs = childs;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Catalog getParent() {
		return parent;
	}

	public void setParent(Catalog parent) {
		this.parent = parent;
	}
	
}
