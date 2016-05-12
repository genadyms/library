package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.CommentFilter;
import com.gmazurkevich.training.library.datamodel.Comment;

public interface CommentDao extends AbstractDao<Comment, Long> {

	List<Comment> find(CommentFilter commentFilter);

}
