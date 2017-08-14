package com.donate.po;

import java.util.Date;

//求助信息
public class Appeal {
	private Integer id;
	private String title;
	private String content;
	private Integer appealType;
	private Integer sortNum;
	private User recipient;
	private Double goalMoney;
	private Double holdMoney;
	private Date createDate;
	private Date updateDate;
	private Integer appealState;
	private User updateUser;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getAppealType() {
		return appealType;
	}

	public void setAppealType(Integer appealType) {
		this.appealType = appealType;
	}

	public Integer getSortNum() {
		return sortNum;
	}

	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
	}

	public Double getGoalMoney() {
		return goalMoney;
	}

	public void setGoalMoney(Double goalMoney) {
		this.goalMoney = goalMoney;
	}

	public Double getHoldMoney() {
		return holdMoney;
	}

	public void setHoldMoney(Double holdMoney) {
		this.holdMoney = holdMoney;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getAppealState() {
		return appealState;
	}

	public void setAppealState(Integer appealState) {
		this.appealState = appealState;
	}

	public User getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}

	public User getRecipient() {
		return recipient;
	}

	public void setRecipient(User recipient) {
		this.recipient = recipient;
	}

	@Override
	public String toString() {
		return "Appeal [id=" + id + ", title=" + title + ", content=" + content + ", appealType=" + appealType + ", sortNum=" + sortNum
				+ ", recipient=" + recipient + ", goalMoney=" + goalMoney + ", holdMoney=" + holdMoney + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + ", appealState=" + appealState + ", updateUser=" + updateUser + "]";
	}

}
