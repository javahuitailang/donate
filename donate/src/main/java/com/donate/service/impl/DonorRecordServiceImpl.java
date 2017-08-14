package com.donate.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donate.dao.AppealDao;
import com.donate.dao.DonorRecordDao;
import com.donate.po.DonateInfo;
import com.donate.po.DonorRecord;
import com.donate.po.Pager;
import com.donate.service.DonorRecordService;

import javax.annotation.Resource;

@Service
public class DonorRecordServiceImpl implements DonorRecordService {

	@Resource
	DonorRecordDao donorRecordDao;

	@Resource
	AppealDao appealDao;
	@Override
	public DonorRecord getDonorRecordById(int id) {
		return donorRecordDao.getDonorRecordById(id);
	}

	@Override
	public Pager<DonorRecord> getAll(Pager<DonorRecord> pageBean) {
		//---------以上由控制层自动封装数据setPageCurrent--------------
		pageBean.setRecordCount(getTotal());//获得总记录数
		initPageBean(pageBean);
		//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
		if(pageBean.getRecordCount()==0){
			pageBean.setDatas(null);
		}else{
			pageBean.setDatas(donorRecordDao.getAll((pageBean.getPageCurrent() - 1)
					* pageBean.getPageSize(), pageBean.getPageSize()));
		}
		return pageBean;
	}
	//date降序查询最新记录
	@Override
	public Pager<DonorRecord> getDonorRecords(Pager<DonorRecord> pageBean) {
		//---------以上由控制层自动封装数据setPageCurrent--------------
		pageBean.setRecordCount(getTotal());//获得总记录数
		initPageBean(pageBean);
		//判断是否有记录,没有直接吧dates设为null,不在向数据库查询
		if(pageBean.getRecordCount()==0){
			pageBean.setDatas(null);
		}else{
			pageBean.setDatas(donorRecordDao.getDonorRecords((pageBean.getPageCurrent() - 1)
					* pageBean.getPageSize(), pageBean.getPageSize()));
		}
		return pageBean;
	}

	@Override
	public Pager<DonorRecord> getAllById(int userId,Pager<DonorRecord> pageBean) {
		//---------以上由控制层自动封装数据setPageCurrent---userId-----------
		pageBean.setRecordCount(getTotalById(userId));//获得总记录数
		initPageBean(pageBean);
		//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
		if(pageBean.getRecordCount()==0){
			pageBean.setDatas(null);
		}else{
			pageBean.setDatas(donorRecordDao.getAllById(userId,(pageBean.getPageCurrent() - 1)
					* pageBean.getPageSize(), pageBean.getPageSize()));
		}
		return pageBean;
	}
	@Override
	public Pager<DonorRecord> getAppealById(int appealId,Pager<DonorRecord> pageBean) {
		pageBean.setRecordCount(getTotalAppealById(appealId));//获得总记录数
		initPageBean(pageBean);
		//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
		if(pageBean.getRecordCount()==0){
			pageBean.setDatas(null);
		}else{
			pageBean.setDatas(donorRecordDao.getAppealById(appealId,(pageBean.getPageCurrent() - 1)
					* pageBean.getPageSize(), pageBean.getPageSize()));
		}
		return pageBean;
	
	}
	@Override
	public Pager<DonorRecord> search(int selected,String context,Pager<DonorRecord> pageBean) {
		//捐款对象查询
		if(selected==1){
			pageBean.setRecordCount(searchCount1(context));//获得总记录数
			initPageBean(pageBean);
			//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
			if(pageBean.getRecordCount()==0){
				pageBean.setDatas(null);
			}else{
				pageBean.setDatas(donorRecordDao.search1(context,(pageBean.getPageCurrent() - 1)
						* pageBean.getPageSize(), pageBean.getPageSize()));
			}
		//捐款项目
		}else if(selected==2){
			pageBean.setRecordCount(searchCount2(context));//获得总记录数
			initPageBean(pageBean);
			//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
			if(pageBean.getRecordCount()==0){
				pageBean.setDatas(null);
			}else{
				pageBean.setDatas(donorRecordDao.search2(context,(pageBean.getPageCurrent() - 1)
						* pageBean.getPageSize(), pageBean.getPageSize()));
			}
		}
		return pageBean;
	}
	@Override
	public Pager<DonorRecord> getBackdonateList(int selected,String context,
			String beforDate, String afterDate,Pager<DonorRecord> pageBean) {
		//捐款对象查询
		if(selected<=1){
			pageBean.setRecordCount(getBackdonateListCount1(context, beforDate, afterDate));//获得总记录数
			initPageBean(pageBean);
			//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
			if(pageBean.getRecordCount()==0){
				pageBean.setDatas(null);
			}else{
				pageBean.setDatas(donorRecordDao.getBackdonateList1(context,
						beforDate, afterDate,(pageBean.getPageCurrent() - 1)
						* pageBean.getPageSize(), pageBean.getPageSize()));
			}
		//捐款项目
		}else if(selected==2){
			pageBean.setRecordCount(getBackdonateListCount2(context, beforDate, afterDate));//获得总记录数
			initPageBean(pageBean);
			//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
			if(pageBean.getRecordCount()==0){
				pageBean.setDatas(null);
			}else{
				pageBean.setDatas(donorRecordDao.getBackdonateList2(context,
						beforDate, afterDate,(pageBean.getPageCurrent() - 1)
						* pageBean.getPageSize(), pageBean.getPageSize()));
			}
		}
		return pageBean;
	}

	@Override
	public Integer getBackdonateListCount1(String context, String beforDate,
			String afterDate) {
		return donorRecordDao.getBackdonateListCount1(context, beforDate, afterDate);
	}
	@Override
	public Integer getBackdonateListCount2(String context, String beforDate,
			String afterDate) {
		return donorRecordDao.getBackdonateListCount2(context, beforDate, afterDate);
	}
	private <T> void initPageBean(Pager<T> pageBean) {
		if(pageBean.getPageCurrent()>=pageBean.getTotalPage()){
			pageBean.setPageCurrent(pageBean.getTotalPage());
		}
		if(pageBean.getPageCurrent()<=1){
			pageBean.setPageCurrent(1);//设置当前页
		}
	}

	@Override
	public boolean insertDonorRecord(DonorRecord donorRecord) {
		appealDao.updateGoalMoneyById(donorRecord.getAppeal().getId(),
				donorRecord.getDonorMoney(),new Date());
		return donorRecordDao.insertDonorRecord(donorRecord);
	}

	@Override
	public double getTotalDonorMoney() {
		return donorRecordDao.getTotalDonorMoney();
	}

	@Override
	public double getDonorMoneyById(int userId) {
		return donorRecordDao.getDonorMoneyById(userId);
	}

	@Override
	public Integer getTotal() {
		return donorRecordDao.getTotal();
	}

	@Override
	public Integer getTotalById(int userId) {
		return donorRecordDao.getTotalById(userId);
	}

	@Override
	public Integer getTotalAppealById(int appealId) {
		return donorRecordDao.getTotalAppealById(appealId);
	}

	@Override
	public double getAppealMoneyById(int appealId) {
		return donorRecordDao.getAppealMoneyById(appealId);
	}
	@Override
	public Integer searchCount1(String context) {
		return donorRecordDao.searchCount1(context);
	}
	@Override
	public Integer searchCount2(String context) {
		return donorRecordDao.searchCount2(context);
	}

	@Override
	public Pager<DonateInfo> getAllDonateRanking(Pager<DonateInfo> pageBean) {
		pageBean.setRecordCount(getTotalUsers());//获得总记录数
		initPageBean(pageBean);
		//判断是否有记录,没有直接吧dates设为null,不在向数据库查询
		if(pageBean.getRecordCount()==0){
			pageBean.setDatas(null);
		}else{
			pageBean.setDatas(donorRecordDao.getAllDonateRanking((pageBean.getPageCurrent() - 1)
					* pageBean.getPageSize(), pageBean.getPageSize()));
		}
		return pageBean;
	}

	@Override
	public Integer getTotalUsers() {
		return donorRecordDao.getTotalUsers();
	}

	@Override
	public boolean updateDonorRecord(DonorRecord donorRecord) {
		return donorRecordDao.updateDonorRecord(donorRecord);
	}

}
