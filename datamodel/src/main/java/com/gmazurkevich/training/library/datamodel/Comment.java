package com.gmazurkevich.training.library.datamodel;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
public class Comment extends AbstractModel {

	@ManyToOne(targetEntity = UserProfile.class, fetch = FetchType.LAZY)
	private UserProfile userProfile;
	
	@ManyToOne(fetch = FetchType.LAZY,optional=true)
	@JoinTable(name="book_2_comment", joinColumns={@JoinColumn(name="comment_id", unique=true)}, inverseJoinColumns= {@JoinColumn(name="book_id")})
	private Book book;

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@ManyToOne(fetch = FetchType.LAZY,optional=true)
	@JoinTable(name="order_2_comment", joinColumns={@JoinColumn(name="comment_id", unique=true)}, inverseJoinColumns= {@JoinColumn(name="order_id")})
	private Order order;
	
	@Column
	private String content;

	@Column(insertable = false)
	private Date created;

	@Column
	private Integer likeCount;

	@Column
	private Integer dislikeCount;

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Integer getDislikeCount() {
		return dislikeCount;
	}

	public void setDislikeCount(Integer dislikeCount) {
		this.dislikeCount = dislikeCount;
	}

	public Integer getLike() {
		return likeCount;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
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
