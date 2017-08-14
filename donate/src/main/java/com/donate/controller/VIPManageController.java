package com.donate.controller;

import com.donate.po.Pager;
import com.donate.po.User;
import com.donate.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * 会员管理
 * @author 闵志清
 *
 */
@Controller
@RequestMapping(value = "/goVipManage")
public class VIPManageController {
	
	@Resource
	private UserService userService;
	
	/**
	 * 显示所有会员信息
	 * @param pageCurrent 当前页
	 */
	@RequestMapping(value = "/list")
	public String goVipManager(Pager<User> pageBean,
							   @RequestParam(required=false)String queryUserName,
							   Model model){
		if(null == queryUserName || queryUserName.trim().length() == 0){
			queryUserName = "";
		}
		
		Pager<User> userList = userService.getUserByPage(pageBean,queryUserName);
		model.addAttribute("pageBean", userList);
		model.addAttribute("queryUserName", queryUserName);
		return "back_page/user-list";
	}
	
	/**
	 * 根据主键批量删除
	 */
	@RequestMapping(value = "/deleteById")
	public String deleteById(@RequestParam(required=false)Integer pageCurrent,
							   @RequestParam(required=false)String queryUserName,
							   @RequestParam(required=false)Integer[] ids,
							   ModelMap model){
		//保存查询条件
		model.addAttribute("pageCurrent", pageCurrent);
		model.addAttribute("queryUserName", queryUserName);
		
		userService.deleteByIds(ids);
		
		return "redirect:/goVipManage/list";
	}
	
	/**
	 * 根据主键拉黑
	 * @return
	 */
	@RequestMapping(value = "/defriend")
	public String defriend(@RequestParam(required=false)Integer pageCurrent,
							@RequestParam(required=false)String queryUserName,
							Integer id,
							ModelMap model){
		//保存查询条件
		model.addAttribute("pageCurrent", pageCurrent);
		model.addAttribute("queryUserName", queryUserName);
		
		userService.updateCountStateById(id);
		return "redirect:/goVipManage/list";
	}
	
	/**
	 * 去用户详情页面
	 */
	@RequestMapping(value = "/toUserDetail")
	public String toUserDetail(Integer id,Model model){
		
		User user = userService.findUserById(id);
		model.addAttribute("user", user);
		return "back_page/user-detail";
	}
}
