package by.gmazurkevich.training.library.service;

import javax.transaction.Transactional;

import by.gmazurkevich.training.library.datamodel.Comment;
import by.gmazurkevich.training.library.datamodel.UserProfile;

public interface CommentService {
	
	@Transactional
	void create(Comment comment);
	
	@Transactional
	void update(Comment comment, String content);
	
	@Transactional
	void delete(Long id);
	
	Comment getComment(Long id);

}
