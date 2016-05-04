package by.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.JoinType;
import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.CatalogTestDao;
import by.gmazurkevich.training.library.datamodel.CatalogTest;
import by.gmazurkevich.training.library.datamodel.CatalogTest_;

@Repository
public class CatalogTestDaoImpl  extends AbstractDaoImpl<CatalogTest, String> implements CatalogTestDao{

	protected CatalogTestDaoImpl() {
		super(CatalogTest.class);
	}

	@Override
	public List<CatalogTest> getChilds(CatalogTest parent) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<CatalogTest> cq = cb.createQuery(CatalogTest.class);
		Root<CatalogTest> from = cq.from(CatalogTest.class);
//		from.fetch(CatalogTest_.parent, JoinType.LEFT);
		cq.select(from);
		cq.where(cb.equal(from.get("parent"),parent));
		List<CatalogTest> res = em.createQuery(cq).getResultList();
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
	public List<CatalogTest> getRootCatalogs() {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<CatalogTest> cq = cb.createQuery(CatalogTest.class);
		Root<CatalogTest> from = cq.from(CatalogTest.class);
		cq.select(from).where(cb.isNull(from.get("parent")));
		List<CatalogTest> res = em.createQuery(cq).getResultList();
		return res;
	}

}
