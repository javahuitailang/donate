package com.donate.po;

import java.util.Date;

public class Bulletin {
	private Integer Id;
	private String Title;
	private String content;
	private Integer State;
	private User createUser;
	private Date createDate;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getState() {
		return State;
	}

	public void setState(Integer state) {
		State = state;
	}

	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Bulletin [Id=" + Id + ", Title=" + Title + ", content=" + content + ", State=" + State + ", createUser=" + createUser
				+ ", createDate=" + createDate + "]";
	}
}
