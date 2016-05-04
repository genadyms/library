package by.gmazurkevich.training.library.datamodel;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class CatalogTest {
	
	@Id
	private String id;
	
	@ManyToOne(targetEntity = CatalogTest.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	private CatalogTest parent;
	
	@Override
	public String toString() {
		return "CatalogTest [id=" + id + ", parent=" + parent + ", childs=" + childs + "]";
	}

	@OneToMany(mappedBy = "parent")
	private List<CatalogTest> childs;

	public List<CatalogTest> getChilds() {
		return childs;
	}

	public void setChilds(List<CatalogTest> childs) {
		this.childs = childs;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public CatalogTest getParent() {
		return parent;
	}

	public void setParent(CatalogTest parent) {
		this.parent = parent;
	}
	
}
