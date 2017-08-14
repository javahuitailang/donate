package com.donate.controller;

import com.donate.po.Appeal;
import com.donate.po.Pager;
import com.donate.service.AppealService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/appeal")
public class AppealController {
	/**
	 * 求助信息相关查询
	 */
	
	@Resource
	private AppealService appealService;
	//根据id获取求助信息
	@RequestMapping("/getAppealById")
	public String getAppealById(@RequestParam(required=false)Integer id,Map<String,Object> map){
		Appeal appeal = appealService.getAppealById(id);
		map.put("appeal", appeal);
		return null;
	}
	
	//获取所有公益求助信息
	@RequestMapping("/getAllGyAppeals")
	public String getAllGyAppeals(@RequestParam(required=false)Integer page,Map<String,Object> map){
		if(page==null){
			page = 1;
		}
		Pager<Appeal> pageBean = new Pager<Appeal>();
		pageBean.setUrl("getAllGyAppeals");
		pageBean.setPageCurrent(page);
		pageBean.setPageSize(8);
		/*System.out.println("前"+pageBean);*/
		
		pageBean = appealService.getAllAppeals(1, pageBean);
		//公益求助信息记录总数
		Integer gyAppealsTotal = appealService.getTotalByAppealType(1);
		pageBean.setRecordCount(gyAppealsTotal);
		/*System.out.println("后"+pageBean);*/	
		
		map.put("allAppealsByType", pageBean);
		return "front_page/query_result";
	}
	
	//获取所有个人求助信息
	@RequestMapping("/getAllPerAppeals")
	public String getAllPerAppeals(@RequestParam(required=false)Integer page,Map<String,Object> map){
		if(page==null){
			page = 1;
		}		
		Pager<Appeal> pageBean = new Pager<Appeal>();
		pageBean.setUrl("getAllPerAppeals");
		pageBean.setPageCurrent(page);
		pageBean.setPageSize(8);
		
		pageBean = appealService.getAllAppeals(0, pageBean);
		//个人求助信息记录总数
		Integer perAppealsTotal = appealService.getTotalByAppealType(0);
		pageBean.setRecordCount(perAppealsTotal);
		
		map.put("allAppealsByType", pageBean);
		return "front_page/query_result";
	}
	
	//某个人的所有求助信息
	@RequestMapping("/getAppealsByUserId")
	public String getAppealsByUserId(@RequestParam(required=false)Integer userId,Pager<Appeal> pageBean,Map<String,Object> map){
		pageBean.setUrl("getAppealsByUserId");
		pageBean = appealService.getAppealsByUserId(userId, pageBean);
		//某个人的求助信息记录总数
		Integer usersAppealsTotal = appealService.getTotalByUserId(userId);
		System.out.println(usersAppealsTotal);
		pageBean.setRecordCount(usersAppealsTotal);
		map.put("pageBean", pageBean);
		return null;
	}
	
	//获取所有公益求助信息
	@RequestMapping("/getAppealList")
	public String getAppealList(String title,
			@RequestParam(required=false)Integer page,
			Map<String,Object> map) throws UnsupportedEncodingException{
		if(title==null){
			title="";
		}
		/*if(title!=null){
			title = new String(title.getBytes("iso-8859-1"),"utf-8");
		}*/
		if(page==null){
			page = 1;
		}
		Pager<Appeal> pageBean = new Pager<Appeal>();
		pageBean.setUrl("getAppealList");
		pageBean.setPageCurrent(page);
		pageBean.setPageSize(8);
		/*System.out.println("前"+pageBean);*/
		
		pageBean = appealService.getAppealList(title,pageBean);
		//公益求助信息记录总数
		Integer totalAppealList = appealService.getTotalAppealList(title);
		pageBean.setRecordCount(totalAppealList);
		/*System.out.println("后"+pageBean);*/	
		map.put("title", title);
		map.put("allAppealsByType", pageBean);
		return "front_page/query_result";
	}

	//查询所有
	@RequestMapping("/getBackAll")
	public String getBackAll(Pager<Appeal> pageBean,Map<Object, Object> map){
		pageBean.setUrl("getBackAll");
		pageBean = appealService.getBackAll(pageBean);
		map.put("pageBean", pageBean);
		return "back_page/donate-statistic";
	}
	//后台 捐款统计 
	@RequestMapping("/donate-statistic")
	public String donateStatistic(Integer selected,Pager<Appeal> pageBean,
			String beforDate,String afterDate,
			HttpServletRequest request) throws Exception{
		String context = request.getParameter("context");
		if(context!=null&&!"null".equals(context)){
			context = new String((context).getBytes("iso-8859-1"),"UTF-8");
		}
		if(beforDate==null||"".equals(beforDate)){
			beforDate = "2016-08-01";
		}
		if(afterDate==null||"".equals(afterDate)){
			afterDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
		}
		if(selected==null){
			selected = 1;
		}
		pageBean.setUrl("donate-statistic");
		pageBean = appealService.getBackAppealList(selected,context, beforDate, afterDate, pageBean);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("selected", selected);
		request.setAttribute("beforDate", beforDate);
		request.setAttribute("afterDate", afterDate);
		request.setAttribute("context", context);
		return "back_page/donate-statistic";
	}

}
