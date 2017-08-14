package com.donate.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.donate.po.Appeal;

public interface AppealDao {
	public Appeal getAppealById(int id);
	//根据求助类型获取求助信息(公益还是个人)
	List<Appeal> getAllAppeals(@Param("appealType") int appealType, @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	//根据sortNum排序值降序获取前公益求助信息四条数据
	List<Appeal> getGyAppealsBySortNum();
	
	List<Appeal> getAppealList(@Param("title") String title, @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	Integer getTotalAppealList(@Param("title") String title);
	
	//根据sortNum排序值降序获取前个人求助信息八条数据
	List<Appeal> getPerAppealsBySortNum();
	//根据sortNum排序值降序获取前两条数据作为头条
	List<Appeal> getAppealHeaderBySortNum();
	//根据求助类型获得该类型的求助总记录数
	Integer getTotalByAppealType(int appealType);
	//根据用户id查询该用户求助总记录数
	Integer getTotalByUserId(@Param("userId") int userId);
	//根据公告id获取某个公告的求助类型
	Integer getAppealType(int id);
	//根据用户id获取该用户所有求助信息
	List<Appeal> getAppealsByUserId(@Param("userId") int userId, @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	//根据申请单id 更改已获得捐款和更新时间
	void updateGoalMoneyById(@Param("appealId") Integer appealId, @Param("goalMoney") Double goalMoney, @Param("updateDate") Date updateDate);
	//-------------后台捐款统计--------------------
	//查询所有
	List<Appeal> getBackAll(@Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	Integer getBackTotal();
	public List<Appeal> getBackAppealList1(@Param("context") String context,
                                           @Param("beforDate") String beforDate, @Param("afterDate") String afterDate,
                                           @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	public List<Appeal> getBackAppealList2(@Param("context") String context,
                                           @Param("beforDate") String beforDate, @Param("afterDate") String afterDate,
                                           @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	public Integer getBackAppealListTotal1(@Param("context") String context,
                                           @Param("beforDate") String beforDate, @Param("afterDate") String afterDate);
	public Integer getBackAppealListTotal2(@Param("context") String context,
                                           @Param("beforDate") String beforDate, @Param("afterDate") String afterDate);
	

	//管理员根据起止时间查询个人求助信息
	public List<Appeal> getAppealsByTime(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("title") String title,
                                         @Param("appealType") Integer appealType, @Param("pageCurrent") Integer pageCurrent, @Param("pageSize") Integer pageSize);
	
	//管理员根据标题名称模糊查询个人求助信息
	public List<Appeal> getAppealsByName(@Param("appealType") Integer appealType, @Param("title") String title, @Param("pageCurrent") Integer pageCurrent, @Param("pageSize") Integer pageSize);

	//管理员根据id将个人求助信息下架
	public void invalidAppealById(@Param("id") Integer id);
	
	
	//管理员根据id删除个人求助信息
	public void deleteAppealById(@Param("id") Integer id);
	
	//管理员下架公益项目
	public void invalidProjectAppealById(@Param("id") Integer id);

	//查询所有公益项目条数
	public Integer getProgramCount(@Param("appealType") Integer appealType);

	//查询公益项目
	List<Appeal> getAllPrograms(@Param("appealType") int appealType, @Param("pageCurrent") int pageCurrent, @Param("pageSize") int pageSize);
	
	//添加appeal
	public void addAppeal(Appeal appeal);
	//判断求助状态是否符合捐款要求
	public Integer checkSupport(String appealId);	
	
	//管理员更新appeal
	public void updateProject(Appeal appeal);

	
}
