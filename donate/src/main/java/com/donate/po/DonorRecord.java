package com.donate.po;

import java.util.Date;

//捐款信息记录
public class DonorRecord {
	private Integer id;
	private String orderNumber;
	private User donor;// 捐款人
	private Appeal appeal;// 求助记录
	private Date donorDate;
	private Double donorMoney;
	private Integer donorState;
	private String comments;
	private Integer recordState;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public User getDonor() {
		return donor;
	}

	public void setDonor(User donor) {
		this.donor = donor;
	}

	public Date getDonorDate() {
		return donorDate;
	}

	public void setDonorDate(Date donorDate) {
		this.donorDate = donorDate;
	}

	public Double getDonorMoney() {
		return donorMoney;
	}

	public void setDonorMoney(Double donorMoney) {
		this.donorMoney = donorMoney;
	}

	public Integer getDonorState() {
		return donorState;
	}

	public void setDonorState(Integer donorState) {
		this.donorState = donorState;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Integer getRecordState() {
		return recordState;
	}

	public void setRecordState(Integer recordState) {
		this.recordState = recordState;
	}

	public Appeal getAppeal() {
		return appeal;
	}

	public void setAppeal(Appeal appeal) {
		this.appeal = appeal;
	}

	@Override
	public String toString() {
		return "DonorRecord [id=" + id + ", orderNumber=" + orderNumber
				+ ", donor=" + donor + ", appeal=" + appeal + ", donorDate="
				+ donorDate + ", donorMoney=" + donorMoney + ", donorState="
				+ donorState + ", comments=" + comments + ", recordState="
				+ recordState + "]";
	}

}
