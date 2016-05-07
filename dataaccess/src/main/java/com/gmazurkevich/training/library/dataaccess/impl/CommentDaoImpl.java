package com.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import com.gmazurkevich.training.library.dataaccess.CommentDao;
import com.gmazurkevich.training.library.datamodel.Comment;

@Repository
public class CommentDaoImpl extends AbstractDaoImpl<Comment,Long> implements CommentDao {

	protected CommentDaoImpl() {
		super(Comment.class);
	}

	
}
