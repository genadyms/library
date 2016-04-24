package by.gmazurkevich.training.library.dataaccess.impl;

import org.springframework.stereotype.Repository;

import by.gmazurkevich.training.library.dataaccess.CommentDao;
import by.gmazurkevich.training.library.datamodel.Comment;

@Repository
public class CommentDaoImpl extends AbstractDaoImpl<Comment,Long> implements CommentDao {

	protected CommentDaoImpl() {
		super(Comment.class);
	}

	
}
