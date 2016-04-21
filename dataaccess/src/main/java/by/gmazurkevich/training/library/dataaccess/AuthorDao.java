package by.gmazurkevich.training.library.dataaccess;

import by.gmazurkevich.training.library.datamodel.Author;

public interface AuthorDao {

	Author get(Long id);

	Author save();
	
}
