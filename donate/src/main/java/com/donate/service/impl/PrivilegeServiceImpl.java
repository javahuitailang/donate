package com.donate.service.impl;

import com.donate.dao.PrivilegeDao;
import com.donate.po.Pager;
import com.donate.po.Privilege;
import com.donate.service.PrivilegeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class PrivilegeServiceImpl implements PrivilegeService {

	@Resource
	private PrivilegeDao privilegeDao;

	// 添加权限
	public void addPrivilege(Privilege privilege) {
		privilegeDao.addPrivilege(privilege);
	}

	// 根据ID更新信息
	public void updateById(Privilege privilege) {
		privilegeDao.updateById(privilege);
	}

	// 根据主键ID删除改行
	public void deleteById(Integer id) {
		privilegeDao.deleteById(id);
	}

	// 根据名称获得权限总数
	public int gettotalPrivilegeByName(String privilegeName) {
		return privilegeDao.gettotalPrivilegeByName(privilegeName);
	}

	private void initPageBean(Pager<Privilege> pageBean) {
		System.out.println(privilegeDao.getPrivilegesCount());
		pageBean.setRecordCount(privilegeDao.getPrivilegesCount());
		if (pageBean.getPageCurrent() > pageBean.getTotalPage()) {
			pageBean.setPageCurrent(pageBean.getTotalPage());
		}
		if (pageBean.getPageCurrent() < 1) {
			pageBean.setPageCurrent(1);// 设置当前页
		}
	}

	// 根据名称模糊分页查找Privilege信息
	public Pager<Privilege> getPrivilegeByName(String privilegeName, Pager<Privilege> pageBean) {

		initPageBean(pageBean);
		pageBean.setRecordCount(privilegeDao.gettotalPrivilegeByName(privilegeName));

		pageBean.setDatas(privilegeDao.getPrivilegeByName(privilegeName, (pageBean.getPageCurrent() - 1) * pageBean.getPageSize(),
				pageBean.getPageSize()));
		return pageBean;
	}

	// 获取全部Privilege总数
	public Integer getPrivilegesCount() {

		return privilegeDao.getPrivilegesCount();
	}

	// 获得全部privilege信息数据
	public Pager<Privilege> getAllPrivileges(Pager<Privilege> pageBean, String queryPrivilegeName) {
		// 获取该类型所有数据

		// ---------以上由控制层自动封装数据setPageCurrent--------------

		pageBean.setRecordCount(privilegeDao.gettotalPrivilegeByName(queryPrivilegeName));// 获得总记录数
		initPageBean(pageBean);
		// 判断是否有记录,没有直接吧dates设为null,不在像数据库查询
		if (pageBean.getRecordCount() == 0) {
			pageBean.setDatas(null);
		} else {
			pageBean.setDatas(privilegeDao.getAllPrivileges(queryPrivilegeName, (pageBean.getPageCurrent() - 1) * pageBean.getPageSize(),
					pageBean.getPageSize()));
		}
		return pageBean;
	}

	// 根据ID 查询到列信息，显示出来
	public Privilege getPrivilegeById(Integer id) {
		return privilegeDao.getPrivilegeById(id);
	}

	// 批量删除
	public void deleteByIds(Integer[] ids) {
		privilegeDao.deleteByIds(ids);
	}

	@Override
	public List<Privilege> getUserAllPrivilegeByUserId(Integer id) {
		return privilegeDao.getUserAllPrivilegeByUserId(id);
	}

	@Override
	public List<Privilege> getUserNoPrivilegeByUserId(Integer id) {
		List<Privilege> allPrivileges = privilegeDao.getAllPrivileges1();
		List<Privilege> userAllPrivilege = privilegeDao.getUserAllPrivilegeByUserId(id);
		Set<Privilege> userprivilegeSet = new HashSet<Privilege>();
		List<Privilege> privilegeSet = new ArrayList<Privilege>();
		for (Privilege p : userAllPrivilege) {
			userprivilegeSet.add(p);
		}
		for (Privilege pr : allPrivileges) {
			if (userprivilegeSet.add(pr)) {
				privilegeSet.add(pr);
			}
		}
		return privilegeSet;
	}

}
