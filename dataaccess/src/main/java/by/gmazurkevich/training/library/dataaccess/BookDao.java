package by.gmazurkevich.training.library.dataaccess;

import java.util.List;

import by.gmazurkevich.training.library.datamodel.Book;
import by.gmazurkevich.training.library.datamodel.Catalog;

public interface BookDao extends AbstractDao<Book, Long> {

	List<Book> getBooks(Catalog catalog);

}
