package com.donate.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.donate.po.Bulletin;
import com.donate.po.Pager;

@Service
public interface BulletinService {
	// 根据公告id获取公告
	Pager<Bulletin> getBulletinById(Pager<Bulletin> pageBean, int id);

	// 获取所有公告信息
	Pager<Bulletin> getAllBulletins(Pager<Bulletin> pageBean);

	// 获得全站的公告总记录数
	Integer getTotal();

	// 当用标题进行模糊查询时获取符合条件的公告条数
	Integer getSearchTotal(String title);

	// 添加公告
	public void addBulletin(Bulletin bulletin);

	// 根据id删除公告
	public void deleteBulletinById(@Param("id") Integer id);

	// 根据id修改公告
	public void updateBulletinById(Bulletin bulletin);

	// 根据id批量删除公告
	public int deleteBatchById(List<Integer> list);

	// 根据标题检索公告
	Pager<Bulletin> getBulletinByTitle(Pager<Bulletin> pageBean, String title);

	// 根据公告id获取公告
	public Bulletin getBulletinById(int id);

	// 获取最新公告
	List<Bulletin> getBulletins();

}
