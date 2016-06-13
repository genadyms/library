package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.AuthorFilter;
import com.gmazurkevich.training.library.datamodel.Author;

public interface AuthorDao extends AbstractDao<Author, Long> {
	List<Author> find(String substring);

	List<Author> find(AuthorFilter filter);
	
	Long count(AuthorFilter filter);
}
