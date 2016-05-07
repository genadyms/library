package com.gmazurkevich.training.library.datamodel;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

@Entity
public class Comment extends AbstractModel {
	
	@ManyToOne(targetEntity = UserProfile.class, fetch = FetchType.LAZY)
	private UserProfile userProfile;
	
	@Column
	private String content;
	
	@Column(insertable=false)
	private Date created;
	
	@Column
	private Integer likeCount;
	
	@Column
	private Integer dislikeCount;

	public Integer getLike() {
		return likeCount;
	}

	public void setLike(Integer like) {
		this.likeCount = like;
	}

	public Integer getDislike() {
		return dislikeCount;
	}

	public void setDislike(Integer dislike) {
		this.dislikeCount = dislike;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

}
