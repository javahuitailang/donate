package com.donate.controller;

import com.donate.po.Pager;
import com.donate.po.Privilege;
import com.donate.service.PrivilegeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping("/priviege")
public class PrivilegeController {

	@Resource
	private PrivilegeService privilegeService;
	
	@InitBinder("privilege")
	public void binder(WebDataBinder binder){
		binder.setFieldDefaultPrefix("privilege.");//加前缀说明
	}
	
	//获取全部信息
	@RequestMapping("/getAllPrivileges")
	public String getAllPrivileges(ModelMap model,@RequestParam(required=false)String queryPrivilegeName,Map<String, Object> map, Pager<Privilege> pageBean){
		
		pageBean = privilegeService.getAllPrivileges(pageBean,queryPrivilegeName==null?"":queryPrivilegeName);
		
		map.put("pageBean", pageBean);
		model.addAttribute("queryPrivilegeName", queryPrivilegeName);
		return "back_page/privilege-list";
	}
	
	
	//根据ID删除信息
	@RequestMapping("/deleteCountTypeById")
	public String defriend(@RequestParam(required=false)Integer pageCurrent,
							@RequestParam(required=false)String queryPrivilegeName,
							Integer id,
							ModelMap model){
		//保存查询条件
		model.addAttribute("pageCurrent", pageCurrent);
		model.addAttribute("queryPrivilegeName", queryPrivilegeName);
		
		privilegeService.deleteById(id);
		return "redirect:/privilege/getAllPrivileges.action";
	}
	
	/**
	 * 管理员批量删除信息
	 */
	@RequestMapping("/deleteById")
	public String deleteById(@RequestParam(required=false)Integer pageCurrent,
							   @RequestParam(required=false)String queryPrivilegeName,
							   @RequestParam(required=false)Integer[] ids,
							   ModelMap model){
		//保存查询条件
		model.addAttribute("pageCurrent", pageCurrent);
		model.addAttribute("queryPrivilegeName", queryPrivilegeName);
		
		privilegeService.deleteByIds(ids);
		
		return "redirect:/privilege/getAllPrivileges";
	}

	
	//先到添加页面
	@RequestMapping("/add")
	public String add( ){
		return "back_page/privilege-add";
	}
	
	//再做添加操作
	@RequestMapping("/addPrivilege")
	public String addPrivilege(@ModelAttribute("privilege")Privilege privilege,Model model){
		privilegeService.addPrivilege(privilege);
		
		model.addAttribute("privilege",privilege);
		return "redirect:/privilege/getAllPrivileges";
	}
		
	
	
	//先根据id获取到信息，显示出来
	@RequestMapping(value="/edit")
	public String edit(Integer id,Model model){
		Privilege privilege = privilegeService.getPrivilegeById(id);
		model.addAttribute("privilege", privilege);
		return "back_page/privilege-edit";
	}

	//再根据ID确认修改
	@RequestMapping("/updatePrivilege")
	public String updateByName(@ModelAttribute("privilege")Privilege privilege,Model model){
		privilegeService.updateById(privilege);
		
		Privilege pprivilege = privilegeService.getPrivilegeById(privilege.getId());
		model.addAttribute("privilege",pprivilege);
		return "redirect:/privilege/getAllPrivileges";
	}
	

	@RequestMapping("/test")
	public String test(){
		return "back_page/privilege-list" ;
	}

	
}
