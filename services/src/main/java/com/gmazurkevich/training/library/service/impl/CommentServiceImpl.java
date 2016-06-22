package com.gmazurkevich.training.library.service.impl;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.CommentDao;
import com.gmazurkevich.training.library.dataaccess.filters.CommentFilter;
import com.gmazurkevich.training.library.datamodel.Comment;
import com.gmazurkevich.training.library.service.AuthorServiceTest;
import com.gmazurkevich.training.library.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	private static Logger LOGGER = LoggerFactory.getLogger(CommentServiceImpl.class);
	@Inject
	private CommentDao commentDao;

	@Override
	public void save(Comment comment) {
		commentDao.insert(comment);
		LOGGER.info("Save {}", comment);
	}

	@Override
	public void update(Comment comment) {
		commentDao.update(comment);
		LOGGER.info("Update {}", comment);
	}

	@Override
	public void delete(Long id) {
		commentDao.delete(id);
		LOGGER.info("Delete comment with id {}", id);

	}

	@Override
	public Comment getComment(Long id) {
		return commentDao.get(id);
	}

	@Override
	public List<Comment> find(CommentFilter commentFilter) {
		return commentDao.find(commentFilter);
	}

	@Override
	public long count(CommentFilter commentFilter) {
		return commentDao.count(commentFilter);
	}

}
