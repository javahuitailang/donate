package com.donate.controller;

import com.donate.po.*;
import com.donate.service.AppealService;
import com.donate.service.BulletinService;
import com.donate.service.DonorRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/index")
public class DonateIndexController {
	@Resource
	private BulletinService bulletinService;
	@Resource
	private AppealService appealService;
	@Resource
	private DonorRecordService donorRecordService;
	
	@RequestMapping("/getIndexMsg")
	public String getIndexMsg(Pager pageBean,Map<String,Object> map){
		
		List<Bulletin> bulletin = bulletinService.getBulletins();
		map.put("bulletin", bulletin);
		
		//获取最新十条捐款记录
		pageBean = new Pager<DonorRecord>();
		pageBean.setPageSize(10);
		pageBean = donorRecordService.getDonorRecords(pageBean);
		map.put("donorRecords", pageBean);
		
		//个人捐款最新排行
		pageBean = new Pager<DonateInfo>();
		pageBean.setPageSize(10);
		pageBean = donorRecordService.getAllDonateRanking(pageBean);
		map.put("donateRanking", pageBean);
		
		//获取sortNum排序最大的两条求助信息作为头条
		List<Appeal> appealHeaderBySortNum = appealService.getAppealHeaderBySortNum();
		map.put("appealHeader", appealHeaderBySortNum);
		
		//根据sortNum降序排列的公益前四条数据
		List<Appeal> GyAppealsBySortNum = appealService.getGyAppealsBySortNum();
		map.put("gyAppeals", GyAppealsBySortNum);
		
		//根据sortNum降序排列的个人前四条数据
		List<Appeal> PerAppealsBySortNum = appealService.getPerAppealsBySortNum();
		map.put("perAppeals", PerAppealsBySortNum);
		
/*		System.out.println("公告得得得"+map.get("pageBeanBulletin"));
		System.out.println("公益得得得"+map.get("gyAppeals"));
		System.out.println("个人得得得"+map.get("perAppeals"));*/
		return "index";
	}
}
