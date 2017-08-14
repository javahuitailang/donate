package com.donate.controller;

import com.donate.po.Appeal;
import com.donate.po.Pager;
import com.donate.po.User;
import com.donate.service.AppealService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("bAppeal")
public class BAppealController {

	@Resource
	private AppealService appealService;

	@RequestMapping("/getAllAppeals")
	public String getAllAppeals(Pager<Appeal> pageBean, Map<String, Object> map) {
		pageBean.setUrl("getAllPerAppeals");

		pageBean = appealService.getAllAppeals(0, pageBean);
		// 个人求助信息记录总数

		map.put("pageBean", pageBean);

		return "back_page/appeal-person-list";
	}

	/**
	 * 个人求助信息管理，按照时间搜索
	 */
	@RequestMapping("/getAppealsByTime")
	public String getAppealsByTime(Pager<Appeal> pageBean, Map<String, Object> map, String startTime, String endTime, String title) {
		pageBean.setUrl("getAppealsByTime");

		pageBean = appealService.getAppealsByTime(0, pageBean, startTime, endTime, title);

		map.put("pageBean", pageBean);
		return "back_page/appeal-person-list";
	}

	/**
	 * 管理员根据个人求助名称搜索个人求助信息(模糊查询)
	 */
	public String getAppealByName(Pager<Appeal> pageBean, Map<String, Object> map, String title, Integer pageCurrent) {

		pageBean.setUrl("getAppealByName");

		return "back_page/appeal-person-list";

	}

	/**
	 * 管理员根据id将个人求助信息下架(appealState 0 -> 1)
	 * author:xiaohaoran
	 */
	@RequestMapping("/invalidAppealById")
	public String invalidAppealById(Integer id) {

		appealService.invalidAppealById(id);

		return "redirect:/bAppeal/getAllAppeals.action";
	}

	/**
	 * 管理员根据id将个人求助信息删除
	 */
	@RequestMapping("/deleteAppealById")
	public String deleteAppealById(Integer id) {
		appealService.deleteAppealById(id);
		return "redirect:/bAppeal/getAllAppeals.action";
	}

	/**
	 * 管理员批量删除个人求助信息
	 */
	@RequestMapping("/batchDeleteAppeals")
	public String batchDeleteAppeals(String IDS) {
		String[] ids = IDS.split(",");
		// 这里循环调用根据id删除方法
		for (int i = 0; i < ids.length; i++) {
			appealService.deleteAppealById(Integer.parseInt(ids[i]));
		}
		System.out.println(IDS.toString());
		return "redirect:/bAppeal/getAllAppeals.action";
	}

	/**
	 * 跳转到个人求助信息编辑页面
	 */
	@RequestMapping("/toAppealEdit")
	public String toAppealEdit() {
		return "back_page/appeal-person-edit";
	}

	/**
	 * 管理员查询所有的公益项目
	 */
	@RequestMapping("/getAllProjectAppeals")
	public String getAllProjectAppeals(Pager<Appeal> pageBean, Map<String, Object> map) {
		pageBean.setUrl("getAllProjectAppeals");
		// 1代表公益项目
		Integer appealType = 1;
		pageBean = appealService.getAllProjectAppeals(appealType, pageBean);
		map.put("pageBean", pageBean);
		return "back_page/appeal-project-list";
	}

	/**
	 * 下架公益项目
	 */
	@RequestMapping("/invalidProjectAppealById")
	public String invalidProjectAppealById(Integer id, Integer pageCurrent) {
		appealService.invalidProjectAppealById(id);
		return "redirect:/bAppeal/getAllProjectAppeals.action?pageCurrent=" + pageCurrent;
	}

	/**
	 * 跳转到编辑公益项目页面
	 */
	@RequestMapping("/toEditProject")
	public String toEditProject(Map<String, Object> map, Integer id, Integer pageCurrent) {
		// 根据id将数据回显到编辑页面
		Appeal appeal = appealService.getAppealById(id);

		map.put("appeal", appeal);
		map.put("pageCurrent", pageCurrent);
		return "back_page/appeal-project-edit";
	}

	/**
	 * 删除公益项目 (根据id)
	 */
	@RequestMapping("/deleteProjectById")
	public String deleteProjectById(Integer id, Integer pageCurrent) {
		appealService.deleteProjectById(id);

		return "redirect:/bAppeal/getAllProjectAppeals.action?pageCurrent=" + pageCurrent;
	}

	/**
	 * 批量删除公益项目
	 */
	@RequestMapping("/batchDeleteProjects")
	public String batchDeleteProjects(String IDS, Integer pageCurrent) {
		String[] ids = IDS.split(",");
		// 循环调用分局id删除公益项目即可
		for (String id : ids) {
			appealService.deleteProjectById(Integer.parseInt(id));
		}
		// 将页面回传，删除后页面仍然在当前页面
		return "redirect:/bAppeal/getAllProjectAppeals.action?pageCurrent=" + pageCurrent;
	}

	/**
	 * 跳转到新增公益项目
	 */
	@RequestMapping("/toAddPorject")
	public String toAddPorject(Map<String, Object> map, Integer id) {

		return "back_page/appeal-project-add";
	}

	/**
	 * 管理员根据时间、标题搜索公益项目
	 */
	@RequestMapping("/getProjectsByTimeOrTitle")
	public String getProjectsByTimeOrTitle(Pager<Appeal> pageBean, Map<String, Object> map, String startTime, String endTime, String title) {
		pageBean.setUrl("getProjectsByTimeOrTitle");
		// 公益项目为1
		Integer appealType = 1;
		pageBean = appealService.getProjectsByTimeOrTitle(appealType, pageBean, startTime, endTime, title);
		map.put("pageBean", pageBean);
		return "back_page/appeal-project-list";
	}

	// 添加公益项目
	@RequestMapping("/addProject")
	public String addProject(Appeal appeal, HttpServletRequest request) {
		// 得到当前session中的user
		User user = (User) request.getSession().getAttribute("backUserSession");
		// 设置所属的捐助对象
		appeal.setRecipient(user);
		// 设置排序值(默认为10)
		if (appeal.getSortNum() == null) {
			appeal.setSortNum(10);
		}
		// 公益项目默认为1
		appeal.setAppealType(1);
		// 设置已筹集资金
		appeal.setHoldMoney(0.0);
		// 设置创建时间
		appeal.setCreateDate(new Date());
		// 设置最后更新时间
		appeal.setUpdateDate(new Date());
		// 设置状态
		appeal.setAppealState(1);
		// 设置最后更新管理员id
		// TODO
		appeal.setUpdateUser(user);
		appealService.addAppeal(appeal);
		return "redirect:/bAppeal/getAllProjectAppeals.action";
	}

	/**
	 * 修改公益项目
	 */
	@RequestMapping("/updateProject")
	public String updateProject(HttpServletRequest request, String title, Double goalMoney, Integer sortNum, String content, Integer id,
			Integer pageCurrent) {
		// 得到当前session中的user
		User user = (User) request.getSession().getAttribute("backUserSession");

		System.out.println(user.getUserName());
		Appeal appeal = appealService.getAppealById(id);
		appeal.setTitle(title);
		appeal.setGoalMoney(goalMoney);
		appeal.setSortNum(sortNum);
		appeal.setContent(content);

		// 设置最后更新时间
		appeal.setUpdateDate(new Date());
		// TODO
		appeal.setUpdateUser(user);
		appealService.updateProject(appeal);

		return "redirect:/bAppeal/getAllProjectAppeals.action";
	}

	// 编辑个人求助申请
	@RequestMapping("/toEditPersonAppeal")
	public String toEditPersonAppeal(Map<String, Object> map, Integer id, Integer pageCurrent) {
		Appeal appeal = appealService.getAppealById(id);

		map.put("appeal", appeal);
		map.put("pageCurrent", pageCurrent);
		return "back_page/appeal-person-edit";
	}

	// 编辑个人求助申请
	@RequestMapping("/updateAppeal")
	public String updateAppeal(HttpServletRequest request, Integer id, Integer pageCurrent, String title, Double goalMoney, Integer sortNum,
			String content) {

		// 得到当前session中的user
		User user = (User) request.getSession().getAttribute("backUserSession");

		System.out.println(user.getUserName());
		Appeal appeal = appealService.getAppealById(id);
		appeal.setTitle(title);
		appeal.setGoalMoney(goalMoney);
		appeal.setSortNum(sortNum);
		appeal.setContent(content);

		// 设置最后更新时间
		appeal.setUpdateDate(new Date());
		appeal.setUpdateUser(user);
		appealService.updateProject(appeal);

		return "redirect:/bAppeal/getAllAppeals.action?pageCurrent=" + pageCurrent;
	}
}
