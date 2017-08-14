package com.donate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.donate.po.DonateInfo;
import com.donate.po.DonorRecord;

/**
 * ⑥捐款管理（在线捐款（使用支付宝接口）、捐款记录查询、捐款统计）--------肖亦鸣
 * @author xiaoyiming
 */
public interface DonorRecordDao {
	//-------------------捐款记录查询----------------
	//根据捐款记录查询
	DonorRecord getDonorRecordById(int id);
	//查询所有//资金去向(升序)
	List<DonorRecord> getAll(@Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	//按日期最新查询部分(降序)
	List<DonorRecord> getDonorRecords(@Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	
	//个人捐款最新排行
	List<DonateInfo> getAllDonateRanking(@Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	//捐款人数
	Integer getTotalUsers();
	
	//会员的捐款记录查询
	List<DonorRecord> getAllById(@Param("userId") int userId,
                                 @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	//项目的收款记录查询
	List<DonorRecord> getAppealById(@Param("appealId") int appealId,
                                    @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
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
	//捐款对象查询
	List<DonorRecord> search1(@Param("context") String context,
                              @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	//捐款对象查询总数
	Integer searchCount1(String context);
	//捐款项目
	List<DonorRecord> search2(@Param("context") String context,
                              @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	//捐款项目总数
	Integer searchCount2(String context);
	
	//-------------------捐款统计-------------------
	//获得全站的捐款数额
	double getTotalDonorMoney();
	//会员的捐款总数
	double getDonorMoneyById(int userId);
	
	//--------------------后台统计------------------
	//根据时间和关键字查询
	List<DonorRecord> getBackdonateList1(@Param("context") String context,
                                         @Param("beforDate") String beforDate, @Param("afterDate") String afterDate,
                                         @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	//根据时间和关键字查询总数
	Integer getBackdonateListCount1(@Param("context") String context,
                                    @Param("beforDate") String beforDate, @Param("afterDate") String afterDate);
	//根据时间和关键字查询
	List<DonorRecord> getBackdonateList2(@Param("context") String context,
                                         @Param("beforDate") String beforDate, @Param("afterDate") String afterDate,
                                         @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	//根据时间和关键字查询总数
	Integer getBackdonateListCount2(@Param("context") String context,
                                    @Param("beforDate") String beforDate, @Param("afterDate") String afterDate);
	//更新会员的捐款记录 设置成已付款
	boolean updateDonorRecord(DonorRecord donorRecord);
}
