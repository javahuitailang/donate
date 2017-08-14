package com.donate.service;

import com.donate.po.Pager;
import com.donate.po.User;

public interface UserService {
	//根据姓名获取用户
	public String getPassWordByName(String username);
	
	//添加用户
	public void addUser(User user);
	
	//根据id修改用户成为管理员
	public User userToAdmin(Integer id);
	
	public User getUserByName(String username);
	
	//补全用户信息
	public void updateUserByName(User user);
	
	//分页条件查询显示会员信息
	public Pager<User> getUserByPage(Pager<User> pageBean, String queryUserName);
	
	//分页条件查询显示管理员信息
	public Pager<User> getManageByPage(Pager<User> pageBean, String queryUserName);
	
	//批量删除用户
	public void deleteByIds(Integer[] ids);
	
	//根据主键删除管理员
	public void deleteById(Integer id);
	
	//根据主键拉黑
	public void updateCountStateById(Integer id);
	
	//通过主键查找用户所有信息
	public User findUserById(Integer id);
	
	//通过用户名修改用户状态
	
	//public void updateCountStateByName(String userName);
	
	
	public void updateEffectDateAndCountStateByUser(User user);


	
/*	//通过姓名得到用户激活状态
	public Integer getCountStateByName(String userName);*/
}
