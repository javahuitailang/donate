package com.donate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.donate.po.Privilege;

public interface PrivilegeDao {

	// 获取全部Privilege信息总数
	public Integer getPrivilegesCount();

	// 获得全部privilege信息数据
	public List<Privilege> getAllPrivileges(@Param("queryPrivilegeName") String queryPrivilegeName, @Param("pageCurrent") Integer pageCurrent,
                                            @Param("pageSize") Integer pageSize);

	// 根据名称获取全部Privilege信息总数
	public int gettotalPrivilegeByName(@Param("privilegeName") String privilegeName);

	// 根据名称模糊分页查找Privilege信息
	public List<Privilege> getPrivilegeByName(String privilegeName, @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);

	// //根据id获取全部Privilege信息总数
	// List<Privilege> getPrivilegeByPrivilegeId(@Param("privilegeId")int
	// privilegeId,@Param("pageCurrent")int pageCurrent,@Param("pageSize")int
	// pageSize);

	// //根据countType获取全部Privilege信息
	// List<Privilege> getPrivilegeBycountType(@Param("countType")int
	// countType,@Param("pageCurrent")int pageCurrent,@Param("pageSize")int
	// pageSize);

	// 根据ID更新Privilege
	public void updateById(Privilege privilege);

	// 根据主键ID删除改行
	public void deleteById(Integer id);

	// 根据主键批量删除
	public void deleteByIds(Integer[] ids);

	// 添加Privilege
	public void addPrivilege(Privilege privilege);

	// 根据ID 查询到列信息 ，显示出来
	public Privilege getPrivilegeById(Integer id);

	public List<Privilege> getUserAllPrivilegeByUserId(Integer id);

	public List<Privilege> getAllPrivileges1();

}
