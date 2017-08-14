package com.donate.service;

import com.donate.po.DonateInfo;
import com.donate.po.DonorRecord;
import com.donate.po.Pager;

public interface DonorRecordService {
	//-------------------捐款记录查询----------------
	//根据捐款记录查询
	DonorRecord getDonorRecordById(int id);
	//查询所有//资金去向
	Pager<DonorRecord> getAll(Pager<DonorRecord> pageBean);
	//查询所有//资金去向(降序)
	Pager<DonorRecord> getDonorRecords(Pager<DonorRecord> pageBean);
	
	//个人捐款最新排行
	Pager<DonateInfo> getAllDonateRanking(Pager<DonateInfo> pageBean);
	//捐款人数
	Integer getTotalUsers();
	
	//会员的捐款记录查询
	Pager<DonorRecord> getAllById(int userId, Pager<DonorRecord> pageBean);
	//项目的收款记录查询
	Pager<DonorRecord> getAppealById(int appealId, Pager<DonorRecord> pageBean);
	//获得全站的捐款总记录数
	Integer getTotal();
	//会员的捐款的总记录数
	Integer getTotalById(int userId);
	//会员的收款的总记录数
	Integer getTotalAppealById(int appealId);
	//收到的捐款总数
	double getAppealMoneyById(int appealId);
	//插入捐款信息
	boolean insertDonorRecord(DonorRecord donorRecord);
	//-------------------模糊查询-------------------
	//模糊查询
	Pager<DonorRecord> search(int selected, String context, Pager<DonorRecord> pageBean);
	//捐款对象查询总数
	Integer searchCount1(String context);
	//捐款项目总数
	Integer searchCount2(String context);
	//-------------------捐款统计-------------------
	//获得全站的捐款数额
	double getTotalDonorMoney();
	//会员的捐款总数
	double getDonorMoneyById(int userId);
	//--------------------后台统计------------------
	//根据时间和关键字查询
	Pager<DonorRecord> getBackdonateList(int selected, String context, String beforDate, String afterDate, Pager<DonorRecord> pageBean);
	//根据时间和关键字查询总数
	Integer getBackdonateListCount1(String context, String beforDate, String afterDate);
	//根据时间和关键字查询总数
	Integer getBackdonateListCount2(String context, String beforDate, String afterDate);
	//更新付款状态
	boolean updateDonorRecord(DonorRecord donorRecord);

}
