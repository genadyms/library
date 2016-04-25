package by.gmazurkevich.training.library.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.CommentDao;
import by.gmazurkevich.training.library.dataaccess.UserProfileDao;
import by.gmazurkevich.training.library.datamodel.Comment;
import by.gmazurkevich.training.library.datamodel.UserProfile;
import by.gmazurkevich.training.library.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	@Inject
	private CommentDao commentDao;

	@Override
	public void create(Comment comment) {
		commentDao.insert(comment);
	}

	@Override
	public void update(Comment comment, String content) {
		
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Comment getComment(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

}
