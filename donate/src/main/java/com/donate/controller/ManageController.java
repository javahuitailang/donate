package com.donate.controller;

import com.donate.dao.UserPrivilegeDao;
import com.donate.po.Pager;
import com.donate.po.Privilege;
import com.donate.po.User;
import com.donate.service.PrivilegeService;
import com.donate.service.UserService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/manage")
public class ManageController {

	@Resource
	private UserService userService;
	@Resource
	private PrivilegeService privilegeService;
	@Resource
	private UserPrivilegeDao userPrivilegeDao;

	@InitBinder
	public void binder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	/**
	 * 显示所有管理员信息
	 * @param pageCurrent 当前页
	 */
	@RequestMapping(value = "/list")
	public String Manager(Pager<User> pageBean, @RequestParam(required = false) String queryUserName, Model model) {
		if (null == queryUserName || queryUserName.trim().length() == 0) {
			queryUserName = "";
		}
		Pager<User> userList = userService.getManageByPage(pageBean, queryUserName);
		model.addAttribute("pageBean", userList);
		model.addAttribute("queryUserName", queryUserName);
		return "back_page/manage-list";
	}

	// 根据ID删除信息
	@RequestMapping("/deleteCountTypeById")
	public String deleteById(@RequestParam(required = false) Integer pageCurrent, @RequestParam(required = false) String queryPrivilegeName,
			Integer id, ModelMap model) {
		// 保存查询条件
		model.addAttribute("pageCurrent", pageCurrent);
		model.addAttribute("queryPrivilegeName", queryPrivilegeName);
		userService.deleteById(id);
		return "redirect:/manage/list.action";
	}

	/**
	 * 根据主键批量删除
	 */
	@RequestMapping(value = "/deleteByIds")
	public String deleteByIds(@RequestParam(required = false) Integer pageCurrent, @RequestParam(required = false) String queryUserName,
			@RequestParam(required = false) Integer[] ids, ModelMap model) {
		// 保存查询条件

		model.addAttribute("pageCurrent", pageCurrent);
		model.addAttribute("queryUserName", queryUserName);

		userService.deleteByIds(ids);

		return "redirect:/manage/list";
	}

	@RequestMapping("/toEdit")
	public String toEdit(Integer id, Model model) {
		model.addAttribute("user_id", id);
		List<Privilege> hasPrivileges = privilegeService.getUserAllPrivilegeByUserId(id);
		List<Privilege> noPrivileges = privilegeService.getUserNoPrivilegeByUserId(id);
		model.addAttribute("hasPrivileges", hasPrivileges);
		model.addAttribute("noPrivileges", noPrivileges);
		return "back_page/user-privilege-edit";
	}

	@RequestMapping("/saveUserPrivilege")
	public String saveUserPrivilege(Integer user_id, Integer[] selectedPrivileges, Model model) {
		List<Privilege> hasPrivileges = privilegeService.getUserAllPrivilegeByUserId(user_id);
		for (Privilege privilege : hasPrivileges) {
			boolean flag = false;
			for (int i = 0; i < selectedPrivileges.length; i++) {
				if (privilege.getId() != selectedPrivileges[i]) {
					flag = true;
					break;
				}
			}
			if (flag)
				userPrivilegeDao.delete(user_id, privilege.getId());
		}
		for (int i = 0; i < selectedPrivileges.length; i++) {
			userPrivilegeDao.save(user_id, selectedPrivileges[i]);
		}
		return "redirect:/manage/list.action";
	}

	// 先到添加页面
	@RequestMapping("/add")
	public String add() {
		return "back_page/manage-add";
	}

	// 再做添加操作
	@RequestMapping("/addManage")
	public String addManage(User user, Model model) {
		userService.addUser(user);
		model.addAttribute("user", user);
		return "redirect:/manage/list";
	}

	@RequestMapping("/test")
	public String test() {
		return "back_page/manage-list";
	}

}
