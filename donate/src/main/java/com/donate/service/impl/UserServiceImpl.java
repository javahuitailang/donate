package com.donate.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.donate.dao.UserDao;
import com.donate.po.Pager;
import com.donate.po.User;
import com.donate.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	// 根据用户名获取密码
	public String getPassWordByName(String username) {
		return userDao.getPassWordByName(username);
	}

	// 根据id修改用户成为管理员
	public User userToAdmin(Integer id) {
		User userToAdmin = userDao.userToAdmin(id);
		return userToAdmin;
	}

	// 添加用户
	public void addUser(User user) {
		userDao.addUser(user);

	}

	// 根据姓名获取用户信息
	public User getUserByName(String username) {
		return userDao.getUserByName(username);
	}

	@Override
	public void updateUserByName(User user) {
		userDao.updateUserByName(user);
	}

	private <T> void initPageBean(Pager<T> pageBean) {
		if (pageBean.getPageCurrent() >= pageBean.getTotalPage()) {
			pageBean.setPageCurrent(pageBean.getTotalPage());
		}
		if (pageBean.getPageCurrent() <= 1) {
			pageBean.setPageCurrent(1);// 设置当前页
		}
	}

	/**
	 * 分页条件查询 
	 */
	@Override
	public Pager<User> getUserByPage(Pager<User> pageBean, String queryUserName) {
		pageBean.setRecordCount(userDao.getTotalRecord(queryUserName, 0));
		initPageBean(pageBean);
		pageBean.setDatas(userDao.getAllUser(queryUserName, (pageBean.getPageCurrent() - 1) * pageBean.getPageSize(), pageBean.getPageSize()));
		return pageBean;
	}

	/**
	 * 分页查询管理员
	 * 
	 */
	public Pager<User> getManageByPage(Pager<User> pageBean, String queryUserName) {
		pageBean.setRecordCount(userDao.getTotalRecord(queryUserName, 1));
		initPageBean(pageBean);
		pageBean.setDatas(userDao.getAllManage(queryUserName, (pageBean.getPageCurrent() - 1) * pageBean.getPageSize(), pageBean.getPageSize()));
		return pageBean;
	}

	// 根据主键删除管理员
	public void deleteById(Integer id) {
		userDao.deleteById(id);
	}

	/**
	 * 根据主键批量删除
	 */
	@Override
	public void deleteByIds(Integer[] ids) {
		for (int i = 0; i < ids.length; i++) {
			userDao.updateCountStateById(ids[i]);
		}
	}

	/**
	 * 根据主键拉黑
	 */
	@Override
	public void updateCountStateById(Integer id) {
		userDao.updateCountStateById(id);
	}

	/**
	 * 通过主键查找用户所有信息
	 */
	@Override
	public User findUserById(Integer id) {

		return userDao.findUserById(id);
	}

	/**
	 * 通过用户名修改用户状态
	 */
	/*
	 * public void updateCountStateByName(String userName) {
	 * userDao.updateCountStateByName(userName); }
	 */

	@Override
	public void updateEffectDateAndCountStateByUser(User user) {
		userDao.updateEffectDateAndCountStateByUser(user);

	}

}
