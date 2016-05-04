package by.gmazurkevich.training.library.dataaccess.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.BookDao;
import by.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Book_;
import by.gmazurkevich.training.library.datamodel.CatalogOld;
import by.gmazurkevich.training.library.datamodel.Catalog_;

@Repository
public class BookDaoImpl extends AbstractDaoImpl<Book, Long> implements BookDao {

	protected BookDaoImpl() {
		super(Book.class);
	}

//	@Override
//	public List<Book> getBooks(Catalog catalog) {
//		EntityManager em = getEntityManager();
//		CriteriaBuilder builder = em.getCriteriaBuilder();
//		CriteriaQuery<String> criteriaQuery = builder.createQuery(String.class);
//		Root<Book> bookRoot = criteriaQuery.from(Book.class);
//		criteriaQuery.select(bookRoot.get("title").as(String.class));
//		criteriaQuery.where(builder.equal(bookRoot.get("pages"),"321"));
//		List<String> nameList = em.createQuery(criteriaQuery).getResultList();
//		for (String name : nameList) {
//		    System.out.println(name);
//		}
		///////////////////////////////////////////////////////////////////////////////////
//		CriteriaBuilder cb = em.getCriteriaBuilder();
//		CriteriaQuery<Book> cq = cb.createQuery(Book.class);
//		Root<Book> from = cq.from(Book.class);
//		from.fetch(Book_.catalog, JoinType.LEFT);
//		cq.select(from);
//		cq.where(cb.equal(from.get("catalog"), catalog));
//		List<Book> res = em.createQuery(cq).getResultList();
//		System.out.println(res.get(0).getCatalog());
//		return res;
//	}

	@Override
	public List<Book> find(BookFilter bookFilter) {
		EntityManager em = getEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Book> cq = cb.createQuery(Book.class);
		Root<Book> from = cq.from(Book.class);
		cq.select(from);
		if (bookFilter.getCatalog()!=null){
			from.fetch(Book_.catalog, JoinType.LEFT);
			cq.where(cb.equal(from.get(Book_.catalog), bookFilter.getCatalog()));
		}
		if (bookFilter.getIsbn()!=null){
			cq.where(cb.equal(from.get(Book_.isbn), bookFilter.getIsbn()));
		}
		if (bookFilter.getPublishingOffice()!=null){
			cq.where(cb.equal(from.get(Book_.publishingOffice), bookFilter.getPublishingOffice()));
		}
		if (bookFilter.getTitle()!=null){
			cq.where(cb.equal(from.get(Book_.title), bookFilter.getTitle()));
		}
		List<Book> res = em.createQuery(cq).getResultList();
		return res;
	}

}
