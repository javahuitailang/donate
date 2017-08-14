package com.donate.po;

import java.util.Date;

public class Apply {

	private Integer id;
	private String title;
	private String content;
	private Double goalMoney;
	private User applyUser;
	private Date applyDate;
	private Integer applyState;
	private User verifyUser;
	
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
	public Double getGoalMoney() {
		return goalMoney;
	}
	public void setGoalMoney(Double goalMoney) {
		this.goalMoney = goalMoney;
	}
	public User getApplyUser() {
		return applyUser;
	}
	public void setApplyUser(User applyUser) {
		this.applyUser = applyUser;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public Integer getApplyState() {
		return applyState;
	}
	public void setApplyState(Integer applyState) {
		this.applyState = applyState;
	}
	public User getVerifyUser() {
		return verifyUser;
	}
	public void setVerifyUser(User verifyUser) {
		this.verifyUser = verifyUser;
	}
	
}
