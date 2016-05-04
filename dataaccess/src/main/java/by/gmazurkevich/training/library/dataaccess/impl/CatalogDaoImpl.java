package by.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.JoinType;
import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.CatalogDao;
import by.gmazurkevich.training.library.datamodel.Catalog;

@Repository
public class CatalogDaoImpl  extends AbstractDaoImpl<Catalog, String> implements CatalogDao{

	protected CatalogDaoImpl() {
		super(Catalog.class);
	}

	@Override
	public List<Catalog> getChilds(Catalog parent) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Catalog> cq = cb.createQuery(Catalog.class);
		Root<Catalog> from = cq.from(Catalog.class);
//		from.fetch(CatalogTest_.parent, JoinType.LEFT);
		cq.select(from);
		cq.where(cb.equal(from.get("parent"),parent));
		List<Catalog> res = em.createQuery(cq).getResultList();
		return res;
	}
//	CriteriaBuilder cb = em.getCriteriaBuilder();
//	CriteriaQuery<Book> cq = cb.createQuery(Book.class);
//	Root<Book> from = cq.from(Book.class);
//	from.fetch(Book_.catalog, JoinType.LEFT);
//	cq.select(from);
//	cq.where(cb.equal(from.get("catalog"), catalog));
//	List<Book> res = em.createQuery(cq).getResultList();
//	System.out.println(res.get(0).getCatalog());
//	return res;

	@Override
	public List<Catalog> getRootCatalogs() {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Catalog> cq = cb.createQuery(Catalog.class);
		Root<Catalog> from = cq.from(Catalog.class);
		cq.select(from).where(cb.isNull(from.get("parent")));
		List<Catalog> res = em.createQuery(cq).getResultList();
		return res;
	}

}
