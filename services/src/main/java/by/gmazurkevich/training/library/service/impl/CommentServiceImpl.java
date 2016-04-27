package by.gmazurkevich.training.library.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import by.gmazurkevich.training.library.dataaccess.CommentDao;
import by.gmazurkevich.training.library.datamodel.Comment;
import by.gmazurkevich.training.library.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	@Inject
	private CommentDao commentDao;

	@Override
	public void create(Comment comment) {
		commentDao.insert(comment);
	}

	@Override
	public void update(Comment comment) {
		commentDao.update(comment);
	}

	@Override
	public void delete(Long id) {
		commentDao.delete(id);

	}

	@Override
	public Comment getComment(Long id) {
		return commentDao.get(id);
	}

}
