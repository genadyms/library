package by.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;

public interface CatalogService {

	Catalog getCatalog(Long id);

//	@Transactional
//	void addBook(Catalog catalog, Book book);

//	@Transactional
//	void deleteBook(Catalog catalog, Book book);

//	@Transactional
//	void update(Catalog catalog);

	@Transactional
	void delete(Catalog catalog);

	@Transactional
	void create(Catalog catalog);

	List<Catalog> getChildCatalog(Catalog parent);

}
