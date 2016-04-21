package by.gmazurkevich.training.library.dataaccess;

import by.gmazurkevich.training.library.datamodel.Comment;

public interface CommentDao {
	Comment get(Long id);

	Comment save();
}
