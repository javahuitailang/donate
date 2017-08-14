package com.donate.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.donate.po.Appeal;
import com.donate.po.Pager;

@Service
public interface AppealService {
	public Appeal getAppealById(int id);
	//根据求助类型获取求助信息(公益还是个人)
	Pager<Appeal> getAllAppeals(int appealType, Pager<Appeal> pageBean);
	
	public Pager<Appeal> getAppealList(String title, Pager<Appeal> pageBean);
	Integer getTotalAppealList(String title);
	
	//根据sortNum排序值降序获取前公益求助信息四条数据
	List<Appeal> getGyAppealsBySortNum();
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
	Pager<Appeal> getAppealsByUserId(int userId, Pager<Appeal> pageBean);
	
	//添加求助信息
	public void addAppeal(Appeal appeal);
	
	
	//管理员根据起止时间查询个人求助信息
	public Pager<Appeal> getAppealsByTime(Integer appealType, Pager<Appeal> pageBean, String startTime, String endTime, String title);
	
	//管理员根据标题名称模糊查询个人求助信息
	public Pager<Appeal> getAppealsByName(Integer appealType, String title, Pager<Appeal> pageBean);
	
	//管理员根据id将个人求助信息下架
	public void invalidAppealById(Integer id);
	
	//管理员根据id删除个人求助信息
	public void deleteAppealById(Integer id);
	
	//管理员查询所有公益项目
	public Pager<Appeal> getAllProjectAppeals(Integer appealType, Pager<Appeal> pageBean);
	
	//管理员下架公益项目（根据id）
	public void invalidProjectAppealById(Integer id);
	
	//管理员删除公益项目(根据id)
	public void deleteProjectById(Integer id);
	
	public Pager<Appeal> getProjectsByTimeOrTitle(Integer appealType, Pager<Appeal> pageBean, String startTime, String endTime, String title);
	
	//管理更新公益项目
	public void updateProject(Appeal appeal);

	//--------------获得后台数据------------------
	//获得所有数据
	Pager<Appeal> getBackAll(Pager<Appeal> pageBean);
	//获得所有数据数量
	Integer getBackTotal();
	//根据时间和关键字获得所有数据
	Pager<Appeal> getBackAppealList(Integer selected, String context, String beforDate, String afterDate, Pager<Appeal> pageBean);
	//根据时间和关键字获得所有数据数量
	Integer getBackAppealListTotal1(String context, String beforDate, String afterDate);
	Integer getBackAppealListTotal2(String context, String beforDate, String afterDate);
	//判断求助状态是否符合捐款要求
	boolean checkSupport(String appealId);

}
