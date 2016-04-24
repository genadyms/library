package by.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.BookDao;
import by.gmazurkevich.training.library.datamodel.Book;

@Repository
public class BookDaoImpl extends AbstractDaoImpl<Book,Long> implements BookDao {

	protected BookDaoImpl() {
		super(Book.class);
	}

}
