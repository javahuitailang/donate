package com.donate.po;

public class UserPrivilege {
	private Integer user_id;
	private Integer privilege_id;

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getPrivilege_id() {
		return privilege_id;
	}

	public void setPrivilege_id(Integer privilege_id) {
		this.privilege_id = privilege_id;
	}

	@Override
	public String toString() {
		return "UserPrivilege [user_id=" + user_id + ", privilege_id=" + privilege_id + "]";
	}

}
