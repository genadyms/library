package by.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.CatalogDao;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;

@Repository
public class CatalogDaoImpl extends AbstractDaoImpl<Catalog, Long> implements CatalogDao {

	protected CatalogDaoImpl() {
		super(Catalog.class);
	}

	@Override
	public List<Catalog> getCatalogs(Catalog parent) {
		EntityManager em = getEntityManager();
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<String> criteriaQuery = builder.createQuery(String.class);
		Root<Catalog> catalogRoot = criteriaQuery.from(Catalog.class);
		criteriaQuery.select(catalogRoot.get("path").as(String.class));
		criteriaQuery.where(builder.equal(catalogRoot.get("pathParent"),parent.getPathParent()));
		List<String> nameList = em.createQuery(criteriaQuery).getResultList();
		for(String s: nameList) System.out.println(s);
		return null;
	}
	
	
}
