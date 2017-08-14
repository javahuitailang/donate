package com.donate.po;

import java.util.Date;

import com.donate.util.Constants;

//用户信息表
public class User {
	private Integer id;
	private String userName;
	private String password;
	private String photo;
	private String realName;
	private Integer sex;
	private String idCard;
	private String tel;
	private String email;
	private String address;
	private String code;
	private Date effectDate;
	private Integer countState;
	private Integer countType;
	private Date createDate;

	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getEffectDate() {
		return effectDate;
	}

	public void setEffectDate(Date effectDate) {
		this.effectDate = effectDate;
	}

	public Integer getCountState() {
		return countState;
	}

	public void setCountState(Integer countState) {
		this.countState = countState;
	}

	public Integer getCountType() {
		return countType;
	}

	public void setCountType(Integer countType) {
		this.countType = countType;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getHeadPhoto(){
		if(photo==null){
			return null;
		}else{
			return Constants.PICTURE_DIRECTORY+photo;
		}
	}
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
 
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", photo=" + photo + ", realName=" + realName + ", sex="
				+ sex + ", idCard=" + idCard + ", tel=" + tel + ", email=" + email + ", address=" + address + ", code=" + code + ", effectDate="
				+ effectDate + ", countState=" + countState + ", countType=" + countType + ", createDate=" + createDate + "]";
	}
}
