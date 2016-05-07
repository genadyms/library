package com.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.CopyBookDao;
import com.gmazurkevich.training.library.datamodel.CopyBook;

@Repository
public class CopyBookDaoImpl extends AbstractDaoImpl<CopyBook, Long> implements CopyBookDao {
	protected CopyBookDaoImpl() {
		super(CopyBook.class);
	}
}