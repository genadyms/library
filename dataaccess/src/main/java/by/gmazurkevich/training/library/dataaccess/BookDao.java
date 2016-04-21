package by.gmazurkevich.training.library.dataaccess;

import by.gmazurkevich.training.library.datamodel.Book;

public interface BookDao {
	Book get(Long id);

	Book save();
}
