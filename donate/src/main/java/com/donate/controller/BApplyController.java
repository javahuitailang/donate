package com.donate.controller;

import com.donate.po.Appeal;
import com.donate.po.Pager;
import com.donate.service.ApplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 说明：管理员管理求助申请
 * @author xiaohaoran
 *
 */
@Controller
@RequestMapping("bApply")
public class BApplyController {

	@Resource
	private ApplyService applyService;
	@RequestMapping("/getAllApplys")
	public String getAllApplys(Pager<Appeal> page, Map<String, Object> map){
		page.setUrl("getAllApplys");

		page = applyService.getAllApplys(page);
		
		map.put("page", page);
		return "back_page/apply-list";
	}
	
	
	
	
	/**
	 * 跳转到Apply编辑页面
	 */
	@RequestMapping("/toApplyDetail")
	public String toApplyDetail(Pager<Appeal> page, Map<String, Object> map, Integer id, Integer pageCurrent){
		//将数据回显到跳转编辑页面
		//通过id查询到对应的申请
		Appeal apply = applyService.getApplyById(id);
		//将apply放入map栈中用于数据回显
		map.put("apply", apply);
		map.put("pageCurrent", pageCurrent);
		return "back_page/apply-detail";
	}
	
	
	/**
	 * 管理员通过申请(根据id)
	 */
	@RequestMapping("/adoptApplyById")
	public String adoptApplyById(Integer id,Integer pageCurrent){
		applyService.adoptApplyById(id);
		return "redirect:/bApply/getAllApplys.action?pageCurrent="+pageCurrent;
	}
	/**
	 * 批量通过
	 */
	@RequestMapping("/batchAdoptApplysById")
	public String batchAdoptApplysById(String IDS,Integer pageCurrent){
		String [] ids = IDS.split(",");
		for(String id:ids){
			applyService.adoptApplyById(Integer.parseInt(id));
		}
		return "redirect:/bApply/getAllApplys.action?pageCurrent="+pageCurrent;
	}
	
	/**
	 * 管理员拒绝申请(根据id)
	 */
	@RequestMapping("/refuseApplyById")
	public String refuseApplyById(Integer id, Integer pageCurrent){
		applyService.refuseApplyById(id);
		return "redirect:/bApply/getAllApplys.action?pageCurrent="+pageCurrent;
	}
	
	/**
	 * 批量不通过
	 */
	@RequestMapping("/batchRefuseApplysById")
	public String batchRefuseApplysById(String IDS, Integer pageCurrent){
		String [] ids = IDS.split(",");
		for(String id:ids){
			applyService.refuseApplyById(Integer.parseInt(id));
		}
		return "redirect:/bApply/getAllApplys.action?pageCurrent="+pageCurrent;
	}
	
	/**
	 * 根据起止时间时间或者标题查询求助申请
	 */
	@RequestMapping("/getApplysByTimeOrTitle")
	public String getApplysByTimeOrTitle(Pager<Appeal> page, Map<String, Object> map, 
			String startTime, String endTime, String title){
		page.setUrl("getApplysByTimeOrTitle");
		
		page = applyService.getApplysByTimeOrTitle(page, startTime, endTime, title);
		map.put("page", page);
		return "back_page/apply-list";
	}
	
	
	/**
	 * 管理员通过编辑求助申请后通过根据id
	 * 管理员只可以修改预筹金额、标题、内容
	 */
	@RequestMapping("/editThenAdoptApply")
	public String editThenAdoptApply(Appeal appeal, Integer pageCurrent){
		Integer id = appeal.getId();
		Double goalMoney = appeal.getGoalMoney();
		String title = appeal.getTitle();
		String content = appeal.getContent();
		
		
		applyService.editThenAdoptApply(id, goalMoney, title, content);
		
		return "redirect:/bApply/getAllApplys.action?pageCurrent="+pageCurrent;
	}
	
	
}
