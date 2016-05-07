package com.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.AuthorDao;
import com.gmazurkevich.training.library.datamodel.Author;
@Repository
public class AuthorDaoImpl extends AbstractDaoImpl<Author,Long> implements AuthorDao {

	protected AuthorDaoImpl() {
		super(Author.class);
	}

	
}
