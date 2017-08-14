package com.donate.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donate.dao.AppealDao;
import com.donate.po.Appeal;
import com.donate.po.Pager;
import com.donate.service.AppealService;

import javax.annotation.Resource;

@Service
public class AppealServiceImpl implements AppealService {
	@Resource
	private AppealDao appealDao;

	
	@Override
	public Appeal getAppealById(int id) {
		return appealDao.getAppealById(id);
	}

	//根据求助类型获取求助信息(公益还是个人)
	@Override
	public Pager<Appeal> getAllAppeals(int appealType, Pager<Appeal> pageBean) {
		//---------以上由控制层自动封装数据setPageCurrent--------------
		//获取该类型所有数据
		Integer totalByAppealType = appealDao.getTotalByAppealType(appealType);
		pageBean.setRecordCount(totalByAppealType);
		
		initPageBean(pageBean);
		
		if(pageBean.getRecordCount()==0){
			pageBean.setDatas(null);
		}else{
			pageBean.setDatas(appealDao.getAllAppeals(appealType,(pageBean.getPageCurrent() - 1)
				* pageBean.getPageSize(), pageBean.getPageSize()));
		}
		return pageBean;
	}
	
	//根据求助类型获取求助信息(公益还是个人)
	@Override
	public Pager<Appeal> getAppealList(String title, Pager<Appeal> pageBean) {
		//---------以上由控制层自动封装数据setPageCurrent--------------
		//获取该类型所有数据
		Integer totalAppealList = appealDao.getTotalAppealList(title);
		pageBean.setRecordCount(totalAppealList);
		
		initPageBean(pageBean);
		
		if(pageBean.getRecordCount()==0){
			pageBean.setDatas(null);
		}else{
			pageBean.setDatas(appealDao.getAppealList(title,(pageBean.getPageCurrent() - 1)
				* pageBean.getPageSize(), pageBean.getPageSize()));
		}
		return pageBean;
	}



	//根据公告id获取某个公告的求助类型
	@Override
	public Integer getAppealType(int id) {
		return appealDao.getAppealType(id);
	}

	//根据用户id获取该用户所有求助信息
	@Override
	public Pager<Appeal> getAppealsByUserId(int userId, Pager<Appeal> pageBean) {
		//---------以上由控制层自动封装数据setPageCurrent--------------
		pageBean.setRecordCount(appealDao.getTotalByUserId(userId));//获得总记录数
		initPageBean(pageBean);
		if(pageBean.getRecordCount()==0){
			pageBean.setDatas(null);
		}else{
			pageBean.setDatas(appealDao.getAppealsByUserId(userId,(pageBean.getPageCurrent() - 1)
					* pageBean.getPageSize(), pageBean.getPageSize()));
		}
		return pageBean;
	}

	//根据求助类型获得该类型的求助总记录数
	@Override
	public Integer getTotalByAppealType(int appealType) {
		return appealDao.getTotalByAppealType(appealType);
	}

	//根据用户id获得该用户的求助总记录数
	@Override
	public Integer getTotalByUserId(int userId) {
		return appealDao.getTotalByUserId(userId);
	}

	private void initPageBean(Pager<Appeal> pageBean) {

		if(pageBean.getPageCurrent()>=pageBean.getTotalPage()){
			pageBean.setPageCurrent(pageBean.getTotalPage());
		}
		if(pageBean.getPageCurrent()<=1){
			pageBean.setPageCurrent(1);//设置当前页
		}
	}

	//根据sortNum排序值降序获取前公益信息四条数据
	@Override
	public List<Appeal> getGyAppealsBySortNum() {
		List<Appeal> appealsBySortNum = appealDao.getGyAppealsBySortNum();
		return appealsBySortNum;
	}
	
	//根据sortNum排序值降序获取前个人信息八条数据
	@Override
	public List<Appeal> getPerAppealsBySortNum() {
		List<Appeal> appealsBySortNum = appealDao.getPerAppealsBySortNum();
		return appealsBySortNum;
	}

	//根据sortNum排序值降序获取前两条数据作为头条
	@Override
	public List<Appeal> getAppealHeaderBySortNum() {
		List<Appeal> appealHeaderBySortNum = appealDao.getAppealHeaderBySortNum();
		return appealHeaderBySortNum;
	}

	@Override
	public Pager<Appeal> getBackAll(Pager<Appeal> pageBean) {
		//---------以上由控制层自动封装数据setPageCurrent--------------
		pageBean.setRecordCount(getBackTotal());//获得总记录数
		initPageBean(pageBean);
		//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
		if(pageBean.getRecordCount()==0){
			pageBean.setDatas(null);
		}else{
			pageBean.setDatas(appealDao.getBackAll((pageBean.getPageCurrent() - 1)
					* pageBean.getPageSize(), pageBean.getPageSize()));
		}
		return pageBean;
	}

	public Integer getBackTotal() {
		return appealDao.getBackTotal();
	}

	@Override
	public Pager<Appeal> getBackAppealList(Integer selected,
			String context, String beforDate, String afterDate,
			Pager<Appeal> pageBean) {
		//捐款对象查询
		if(selected<=1){
			pageBean.setRecordCount(getBackAppealListTotal1(context, beforDate, afterDate));//获得总记录数
			initPageBean(pageBean);
			//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
			if(pageBean.getRecordCount()==0){
				pageBean.setDatas(null);
			}else{
				pageBean.setDatas(appealDao.getBackAppealList1(context,
						beforDate, afterDate,(pageBean.getPageCurrent() - 1)
						* pageBean.getPageSize(), pageBean.getPageSize()));
			}
		//捐款项目
		}else if(selected==2){
			pageBean.setRecordCount(getBackAppealListTotal2(context, beforDate, afterDate));//获得总记录数
			initPageBean(pageBean);
			//判断是否有记录,没有直接吧dates设为null,不在像数据库查询
			if(pageBean.getRecordCount()==0){
				pageBean.setDatas(null);
			}else{
				pageBean.setDatas(appealDao.getBackAppealList2(context,
						beforDate, afterDate,(pageBean.getPageCurrent() - 1)
						* pageBean.getPageSize(), pageBean.getPageSize()));
			}
		}
		return pageBean;
	}

	@Override
	public Integer getBackAppealListTotal1(String context,String beforDate, String afterDate) {
		return appealDao.getBackAppealListTotal1(context,beforDate,afterDate);
	}
	@Override
	public Integer getBackAppealListTotal2(String context,String beforDate, String afterDate) {
		return appealDao.getBackAppealListTotal2(context,beforDate,afterDate);
	}
	
	/**
	 * 说明：管理员根据起止时间查询个人求助信息
	 * author: xiaohaoran
	 */
	@Override
	public Pager<Appeal> getAppealsByTime(Integer appealType,
			Pager<Appeal> pageBean, String startTime, String endTime, String title) {
		// TODO Auto-generated method stub
		//查询总页数
//		System.out.println(appealType);
		pageBean.setRecordCount(appealDao.getTotalByAppealType(0));
		initPageBean(pageBean);
		int pageCurrent = (pageBean.getPageCurrent() - 1) * pageBean.getPageSize();
		int pageSize = pageBean.getPageSize();
		pageBean.setDatas(appealDao.getAppealsByTime(startTime, endTime, title, appealType, pageCurrent, pageSize));
		return pageBean;
	}

	/**
	 * 说明：管理员根据标题模糊查询个人求助信息
	 * author:xiaohaoran
	 */
	@Override
	public Pager<Appeal> getAppealsByName(Integer appealType, String title, Pager<Appeal> pageBean) {
		// TODO Auto-generated method stub
		pageBean.setRecordCount(appealDao.getTotalByAppealType(0));

		initPageBean(pageBean);
		pageBean.setDatas(appealDao.getAppealsByName(appealType,title,
				(pageBean.getPageCurrent() - 1)*pageBean.getPageSize(),pageBean.getPageSize()));
		return pageBean;
	}

	/**
	 * 说明：管理员根据id将个人求助信息下架
	 * author:xiaohaoran
	 */
	@Override
	public void invalidAppealById(Integer id) {
		// TODO Auto-generated method stub
		appealDao.invalidAppealById(id);
	}

	@Override
	public void deleteAppealById(Integer id) {
		// TODO Auto-generated method stub
		appealDao.deleteAppealById(id);
	}

	
	/**
	 * 管理员查询多有公益项目
	 */

	@Override
	public Pager<Appeal> getAllProjectAppeals(Integer appealType,
			Pager<Appeal> pageBean) {
		// TODO Auto-generated method stub
		pageBean.setRecordCount(appealDao.getProgramCount(appealType));
		initPageBean(pageBean);
		int pageCurrent = (pageBean.getPageCurrent() - 1) * pageBean.getPageSize();
		int pageSize = pageBean.getPageSize();
		pageBean.setDatas(appealDao.getAllPrograms(appealType, pageCurrent, pageSize));
		
		
		return pageBean;
	}
	/**
	 * 管理员下架公益项目
	 */
	@Override
	public void invalidProjectAppealById(Integer id) {
		// TODO Auto-generated method stub
		//调用根据id下架个人求助信息
		appealDao.invalidAppealById(id);
	}
	/**
	 * 管理员删除公益项目
	 */
	@Override
	public void deleteProjectById(Integer id) {
		// TODO Auto-generated method stub
		//直接调用删除根据id下架个人求助信息即可
		appealDao.deleteAppealById(id);
	}
	
	/**
	 * 根据起止时间或者标题查询公益项目
	 */
	public Pager<Appeal> getProjectsByTimeOrTitle(Integer appealType, Pager<Appeal> pageBean,
			String startTime, String endTime, String title){
		//初始化Pager
		initPageBean(pageBean);
		int pageCurrent = (pageBean.getPageCurrent() - 1) * pageBean.getPageSize();
		int pageSize = pageBean.getPageSize();
		pageBean.setDatas(appealDao.getAppealsByTime(startTime, endTime, title, appealType, pageCurrent, pageSize));
		return pageBean;
	}


	@Override
	public void addAppeal(Appeal appeal) {
		// TODO Auto-generated method stub
		appealDao.addAppeal(appeal);
	}


	/**
	 * 管理员更新公益项目
	 */
	@Override
	public void updateProject(Appeal appeal) {
		// TODO Auto-generated method stub
		appealDao.updateProject(appeal);
	}


	@Override
	public boolean checkSupport(String appealId) {
		return appealDao.checkSupport(appealId)==1?true:false;
	}

	@Override
	public Integer getTotalAppealList(String title) {
		return appealDao.getTotalAppealList(title);
	}




}
