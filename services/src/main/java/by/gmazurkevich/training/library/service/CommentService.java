package by.gmazurkevich.training.library.service;

import javax.transaction.Transactional;

import by.gmazurkevich.training.library.datamodel.Comment;

public interface CommentService {
	
	@Transactional
	void create(Comment comment);
	
	@Transactional
	void update(Comment comment);
	
	@Transactional
	void delete(Long id);
	
	Comment getComment(Long id);

}
