package by.gmazurkevich.training.library.dataaccess;

import java.util.List;

import by.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import by.gmazurkevich.training.library.datamodel.Book;

public interface BookDao extends AbstractDao<Book, Long> {

	List<Book> find(BookFilter bookFilter);

}
