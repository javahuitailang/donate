package com.donate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.donate.po.User;

public interface UserDao {
	// 根据姓名获取user
	public String getPassWordByName(String username);

	// 根据id修改用户成为管理员
	public User userToAdmin(Integer id);

	// 添加用户
	public void addUser(User user);

	// 根据姓名获取User
	public User getUserByName(String username);

	// 根据用户名更新user
	public void updateUserByName(User user);

	// 根据当前页显示所有的会员信息
	public List<User> getAllUser(@Param("queryUserName") String queryUserName, @Param("pageCurrent") Integer pageCurrent,
                                 @Param("pageSize") Integer pageSize);

	// 根据当前页显示所有的管理员信息
	public List<User> getAllManage(@Param("queryUserName") String queryUserName, @Param("pageCurrent") Integer pageCurrent,
                                   @Param("pageSize") Integer pageSize);

	// 获取总记录数
	public Integer getTotalRecord(@Param("queryUserName") String queryUserName, @Param("countType") Integer conuntType);

	// 根据主键批量删除
	public void deleteByIds(Integer[] ids);

	// 根据主键删除管理员
	public void deleteById(Integer id);

	// 根据主键拉黑
	public void updateCountStateById(Integer id);

	// 通过主键查找用户所有信息
	public User findUserById(Integer id);

	// 修改用户状态根据用户姓名

	// public void updateCountStateByName(String userName);

	public void updateEffectDateAndCountStateByUser(User user);

	/*
	 * //通过姓名得到用户激活状态 public Integer getCountStateByName(String userName);
	 */
}
