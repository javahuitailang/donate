package com.donate.po;

import java.util.Date;
/**
 * 处理中间结果，最新捐款排行
 * @author mmz
 *
 */

public class DonateInfo {
	private Integer id;
	private String realName;
	private Integer sex;
	private Double totalMoney;//捐款总数
	private Date donorDate;//最新捐款时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Date getDonorDate() {
		return donorDate;
	}
	public void setDonorDate(Date donorDate) {
		this.donorDate = donorDate;
	}
	@Override
	public String toString() {
		return "DonateInfo [id=" + id + ", realName=" + realName + ", sex="
				+ sex + ", totalMoney=" + totalMoney + ", donorDate="
				+ donorDate + "]";
	}
	
}
