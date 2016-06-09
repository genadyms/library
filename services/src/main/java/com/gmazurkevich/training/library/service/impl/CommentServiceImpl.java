package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.CommentDao;
import com.gmazurkevich.training.library.dataaccess.filters.BookFilter;
import com.gmazurkevich.training.library.dataaccess.filters.CommentFilter;
import com.gmazurkevich.training.library.datamodel.Book;
import com.gmazurkevich.training.library.datamodel.Comment;
import com.gmazurkevich.training.library.service.BookService;
import com.gmazurkevich.training.library.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	@Inject
	private CommentDao commentDao;

	@Override
	public void save(Comment comment) {
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

	@Override
	public List<Comment> find(CommentFilter commentFilter) {
		return commentDao.find(commentFilter);
	}

	@Override
	public long count(CommentFilter commentFilter) {
		return commentDao.count(commentFilter);
	}

	@Override
	public void saveOrUpdate(Comment comment) {
		if(comment.getId()==null) {
			save(comment);
		} else {
			update(comment);
		}
		
	}

}
