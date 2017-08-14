package com.donate.service.impl;

import com.donate.dao.ApplyDao;
import com.donate.po.Appeal;
import com.donate.po.Pager;
import com.donate.service.ApplyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("applyService")
public class ApplyServiceImpl implements ApplyService {

	@Resource
	private ApplyDao applyDao;
	
	/**
	 * 获取求助信息总记录数
	 */
	@Override
	public Integer getApplyCount() {
		// TODO Auto-generated method stub
		return applyDao.getApplyCount();
	}
	/**
	 * 初始化分页信息
	 * 1、对传入当前页进行控制
	 * 		*如果页数大于总页数，将当前设置为总页数（最大页数）
	 * 		*如果页数小于1，将当前页设置为首页（第一页)
	 */
	@Override
	public void initPage(Pager<Appeal> page) {
		// TODO Auto-generated method stub
		//得到所有记录数
		page.setRecordCount(applyDao.getApplyCount());
				
		if(page.getPageCurrent() > page.getTotalPage()){
			page.setPageCurrent(page.getTotalPage());
		}
		if(page.getPageCurrent() < 1){
			page.setPageCurrent(1);
		}		
	}
	
	

	/**
	 * 根据id查询申请记录
	 */
	@Override
	public Appeal getApplyById(Integer id) {
		// TODO Auto-generated method stub
		return applyDao.getApplyById(id);
	}
	
	/**
	 * 管理员通过申请
	 */
	@Override
	public void adoptApplyById(Integer id) {
		// TODO Auto-generated method stub
		applyDao.adoptApplyById(id);
	}
	/**
	 * 管理根据拒绝申请
	 */
	@Override
	public void refuseApplyById(Integer id) {
		// TODO Auto-generated method stub
		applyDao.refuseApplyById(id);
	}
	
	/**
	 * 管理员根据时间或者标题查询求助申请
	 */
	@Override
	public Pager<Appeal> getApplysByTimeOrTitle(Pager<Appeal> page,
			String startTime, String endTime, String title) {
		// TODO Auto-generated method stub
		initPage(page);
		int pageCurrenet = (page.getPageCurrent() - 1)*page.getPageSize();
		page.setDatas(applyDao.getApplysByTimeOrTitle(startTime, endTime, title,
				pageCurrenet, page.getPageSize()));
		return page;
	}
	
	/**
	 * 管理员查询所有求助信息 
	 */
	@Override
	public Pager<Appeal> getAllApplys(Pager<Appeal> page) {
		// TODO Auto-generated method stub
		initPage(page);
		page.setDatas(applyDao.getAllApplys((page.getPageCurrent() - 1 )*page.getPageSize(), page.getPageSize()));
		return page;
	}
	
	/**
	 * 管理员编辑后通过申请
	 */
	@Override
	public void editThenAdoptApply(Integer id, Double goalMoney, String title, String content) {
		// TODO Auto-generated method stub
		applyDao.editThenAdoptApply(id, goalMoney, title, content);
	}
	

}
