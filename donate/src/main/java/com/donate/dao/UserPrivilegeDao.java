package com.donate.dao;

import org.apache.ibatis.annotations.Param;

import com.donate.po.UserPrivilege;

public interface UserPrivilegeDao {
	public UserPrivilege getUserPrivilegeById(int id);

	public void save(@Param("user_id") Integer user_id, @Param("privilege_id") Integer privilege_id);

	public void delete(@Param("user_id") Integer user_id, @Param("privilege_id") Integer privilege_id);

}
