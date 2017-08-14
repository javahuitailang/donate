package com.donate.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donate.dao.BulletinDao;
import com.donate.po.Bulletin;
import com.donate.po.Pager;
import com.donate.service.BulletinService;

import javax.annotation.Resource;

@Service
public class BulletinServiceImpl implements BulletinService {

    @Resource
	private BulletinDao bulletinDao;

	// 根据id获取公告
	@Override
	public Pager<Bulletin> getBulletinById(Pager<Bulletin> pageBean, int id) {
		// ---------以上由控制层自动封装数据setPageCurrent--------------
		pageBean.setRecordCount(1);// 根据id时行的是精确查询，只有一条记录
		initPageBean(pageBean);
		if (pageBean.getRecordCount() == 0) {
			pageBean.setDatas(null);
		} else {
			pageBean.setDatas(bulletinDao.getBulletinById((pageBean.getPageCurrent() - 1) * pageBean.getPageSize(),pageBean.getPageSize(),id));
		}
		return pageBean;
	}


	// 获取公告总记录
	@Override
	public Integer getTotal() {
		return bulletinDao.getTotal();
	}
	
	//当用标题进行模糊查询时获取符合条件的公告条数
	public Integer getSearchTotal(String title) {
		return bulletinDao.getSearchTotal(title);
	}

	// 分页获取所有公告
	@Override
	public Pager<Bulletin> getAllBulletins(Pager<Bulletin> pageBean) {
		// ---------以上由控制层自动封装数据setPageCurrent--------------
		pageBean.setRecordCount(getTotal());// 获得总记录数
		initPageBean(pageBean);
		if (pageBean.getRecordCount() == 0) {
			pageBean.setDatas(null);
		} else {
			pageBean.setDatas(bulletinDao.getAllBulletins(
					(pageBean.getPageCurrent() - 1) * pageBean.getPageSize(),
					pageBean.getPageSize()));
		}
		return pageBean;
	}

	private void initPageBean(Pager<Bulletin> pageBean) {
		if (pageBean.getPageCurrent() >= pageBean.getTotalPage()) {
			pageBean.setPageCurrent(pageBean.getTotalPage());
		}
		if (pageBean.getPageCurrent() <= 1) {
			pageBean.setPageCurrent(1);// 设置当前页
		}
	}

	// 添加公告
	public void addBulletin(Bulletin bulletin) {
		bulletinDao.addBulletin(bulletin);
	}

	// 根据id删除公告
	public void deleteBulletinById(@Param("id") Integer id) {
		bulletinDao.deleteBulletinById(id);
	}

	// 根据id修改公告
	public void updateBulletinById(Bulletin bulletin) {
		bulletinDao.updateBulletinById(bulletin);
	}

	// 根据id批量删除公告
	public int deleteBatchById(List<Integer> list) {
		return bulletinDao.deleteBatchById(list);
	}

	// 根据标题检索公告
	public Pager<Bulletin> getBulletinByTitle(Pager<Bulletin> pageBean, String title) {
		// ---------以上由控制层自动封装数据setPageCurrent--------------
		pageBean.setRecordCount(getSearchTotal(title));// 获得总记录数
		initPageBean(pageBean);
		if (pageBean.getRecordCount() == 0) {
			pageBean.setDatas(null);
		} else {
			pageBean.setDatas(bulletinDao.getBulletinByTitle((pageBean.getPageCurrent() - 1) * pageBean.getPageSize(),pageBean.getPageSize(),title));
		}
		return pageBean;
	}


	@Override
	public Bulletin getBulletinById(int id) {
		return bulletinDao.getABulletinById(id);
	}


	@Override
	public List<Bulletin> getBulletins() {
		return bulletinDao.getBulletins();
	}

}
