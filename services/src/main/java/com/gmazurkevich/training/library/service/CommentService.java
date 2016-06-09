package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.CommentFilter;
import com.gmazurkevich.training.library.datamodel.Comment;

public interface CommentService {
	
	@Transactional
	void save(Comment comment);
	
	@Transactional
	void update(Comment comment);
	
	@Transactional
	void delete(Long id);
	
	List<Comment> find(CommentFilter commentFilter);
	
	Comment getComment(Long id);

	long count(CommentFilter commentFilter);

}
