package com.donate.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.donate.po.Pager;
import com.donate.po.Privilege;

public interface PrivilegeService {
	
			//获得全部privilege信息数据
			public Pager<Privilege> getAllPrivileges(Pager<Privilege> pageBean, String queryPrivilegeName);

			//获取全部Privilege总数
			public Integer getPrivilegesCount();
			
			//根据名称模糊查找Privilege信息
			public Pager<Privilege> getPrivilegeByName(@Param("privilegeName") String privilegeName, Pager<Privilege> pageBean);
			
			//根据名称获取Privilege总数
			public int gettotalPrivilegeByName(String privilegeName);

			//根据ID更新Privilege
			public void updateById(Privilege privilege);
		
			//根据主键ID删除改行
			public void deleteById(Integer id);
			
			//根据主键批量删除
			public void deleteByIds(Integer[] ids);
			
			//添加Privilege
			public void addPrivilege(Privilege privilege);
			
			//根据ID 查询到列信息 ，显示出来
			public Privilege getPrivilegeById(Integer id);

			//获得用户所有权限
			public List<Privilege> getUserAllPrivilegeByUserId(Integer id);
			
			//获得用户未获得的所有权限
			public List<Privilege> getUserNoPrivilegeByUserId(Integer id);
		
}
