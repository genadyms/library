package com.gmazurkevich.training.library.service.old.mocks;

import java.util.Date;

import com.gmazurkevich.training.library.datamodel.Comment;
import com.gmazurkevich.training.library.datamodel.UserProfile;

public class CommentUtil {
	public static Comment createComment(UserProfile userProfile) {
		Comment comment = new Comment();
		comment.setContent("comment content 1");
		comment.setUserProfile(userProfile);
		comment.setCreated(new Date());
		comment.setLike(1);
		comment.setDislike(1);
		return comment;
	}

}
