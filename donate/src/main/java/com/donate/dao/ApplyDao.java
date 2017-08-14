package com.donate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.donate.po.Appeal;
import com.donate.po.Apply;

public interface ApplyDao {
	//获得总记录数
	public Integer getApplyCount();
	
	//根据id查询申请记录
	public Appeal getApplyById(@Param("id") Integer id);
	
	//管理员查询所有申请
	public List<Appeal> getAllApplys(@Param("pageCurrent") Integer pageCurrent, @Param("pageSize") Integer pageSize);
	
	//管理员通过申请
	public void adoptApplyById(@Param("id") Integer id);
	
	//管理员拒绝申请
	public void refuseApplyById(@Param("id") Integer id);
	
	//管理员根据时间或者是标题查询求助申请
	public List<Appeal> getApplysByTimeOrTitle(@Param("startTime") String startTime, @Param("endTime") String endTime,
                                               @Param("title") String title, @Param("pageCurrent") Integer pageCurrent, @Param("pageSize") Integer pageSize);
	
	//管理员编辑求助信息后同意申请（id）
	public void editThenAdoptApply(@Param("id") Integer id, @Param("goalMoney") Double goalMoney, @Param("title") String title, @Param("content") String content);
}
