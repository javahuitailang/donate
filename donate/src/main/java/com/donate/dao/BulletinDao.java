package com.donate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.donate.po.Bulletin;

public interface BulletinDao {

	// 获取最新公告
	List<Bulletin> getBulletins();

	// 根据公告id获取公告
	public Bulletin getABulletinById(int id);

	// 根据公告id获取公告
	List<Bulletin> getBulletinById(@Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize, @Param("Id") int id);

	// 获取所有公告信息
	List<Bulletin> getAllBulletins(@Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);

	// 获得全站的公告总记录数
	Integer getTotal();

	// 当用标题进行模糊查询时获取符合条件的公告条数
	Integer getSearchTotal(@Param("Title") String title);

	// 添加公告
	public void addBulletin(Bulletin bulletin);

	// 根据id删除公告
	public void deleteBulletinById(@Param("id") Integer id);

	// 根据id修改公告
	public void updateBulletinById(Bulletin bulletin);

	// 根据id批量删除公告
	public int deleteBatchById(List<Integer> list);

	// 根据标题检索公告
	// List<Bulletin> getBulletinByTitle(@Param("Title")String title);
	List<Bulletin> getBulletinByTitle(@Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize, @Param("Title") String title);

}
