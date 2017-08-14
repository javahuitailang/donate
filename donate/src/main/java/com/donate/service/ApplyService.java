package com.donate.service;

import org.springframework.stereotype.Service;

import com.donate.po.Appeal;
import com.donate.po.Apply;
import com.donate.po.Pager;

@Service
public interface ApplyService {
	//获得求助信息总记录数
	public Integer getApplyCount();
	//初始化分页管理
	public void initPage(Pager<Appeal> page);
	
	//根据id查询申请记录
	public Appeal getApplyById(Integer id);

	//管理员查询求助申请
	public Pager<Appeal> getAllApplys(Pager<Appeal> page);
	
	//管理员通过申请
	public void adoptApplyById(Integer id);
	
	//管理员拒绝申请
	public void refuseApplyById(Integer id);
	
	//管理员根据时间或者标题查询求助申请
	public Pager<Appeal> getApplysByTimeOrTitle(Pager<Appeal> page, String startTime, String endTime, String title);
	
	//管理员比编辑后通过申请
	public void editThenAdoptApply(Integer id, Double goalMoney, String title, String content);
}
