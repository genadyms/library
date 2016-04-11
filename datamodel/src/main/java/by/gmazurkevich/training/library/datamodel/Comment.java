package by.gmazurkevich.training.library.datamodel;

import java.util.Date;

public class Comment extends AbstractModel {
	private UserProfile userProfile;
	private String content;
	private Date created;

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
