package by.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.BookDao;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;

@Repository
public class BookDaoImpl extends AbstractDaoImpl<Book, Long> implements BookDao {

	protected BookDaoImpl() {
		super(Book.class);
	}

	@Override
	public List<Book> getBooks(Catalog catalog) {
		EntityManager em = getEntityManager();
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<String> criteriaQuery = builder.createQuery(String.class);
		Root<Book> bookRoot = criteriaQuery.from(Book.class);
		criteriaQuery.select(bookRoot.get("title").as(String.class));
		criteriaQuery.where(builder.equal(bookRoot.get("pages"),"321"));
		List<String> nameList = em.createQuery(criteriaQuery).getResultList();
		for (String name : nameList) {
		    System.out.println(name);
		}
		///////////////////////////////////////////////////////////////////////////////////
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Book> cq = cb.createQuery(Book.class);
		Root<Book> from = cq.from(Book.class);
		cq.select(from);
		cq.where(cb.equal(from.get("catalog"), catalog));
		List<Book> res = em.createQuery(cq).getResultList();
		return res;
	}

}
