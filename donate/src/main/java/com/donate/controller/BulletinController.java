package com.donate.controller;

import com.donate.po.Bulletin;
import com.donate.po.Pager;
import com.donate.po.User;
import com.donate.service.BulletinService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping(value = "/bulletin")
public class BulletinController {
    @Resource
	private BulletinService bulletinService;

	// 获取所有公告信息，并跳转到公告管理页面
	@RequestMapping("/list")
	public String getAllBulletins(Pager<Bulletin> pageBean, Model model) {
		Pager<Bulletin> bulletinList = bulletinService
				.getAllBulletins(pageBean);
		model.addAttribute("pageBean", bulletinList);
		return "back_page/bulletin-list";
	}

	// 判断搜索公告时输入的是否为数字
	public boolean isNumeric(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	}

	// 搜索公告
	@RequestMapping(value = "/search")
	public String searchBulletin(HttpServletRequest request, Model model,
			Pager<Bulletin> pageBean) {
		String keywords = request.getParameter("keywords");
		boolean tag = false;
		tag = isNumeric(keywords);
		Pager<Bulletin> bulletinList = null;
		if (tag) {
			int id = Integer.parseInt(keywords);
			bulletinList = bulletinService.getBulletinById(pageBean, id);
			model.addAttribute("pageBean", bulletinList);
		} else {
			bulletinList = bulletinService.getBulletinByTitle(pageBean,
					keywords);
			model.addAttribute("pageBean", bulletinList);
		}
		return "back_page/bulletin-search-result";
	}

	@RequestMapping("/getBulletins")
	public String getBulletins(@RequestParam(required = false) Integer page,
			Map<String, Object> map) {
		if (page == null) {
			page = 1;
		}
		Pager<Bulletin> pageBean = new Pager<Bulletin>();
		pageBean.setPageCurrent(page);
		pageBean.setPageSize(4);
		pageBean.setUrl("getBulletins");
		pageBean = bulletinService.getAllBulletins(pageBean);
		pageBean.setRecordCount(bulletinService.getTotal());
		map.put("bulletins", pageBean);
		return "/front_page/allbulletin_result";
	}

	// 跳转到添加公告页
	@RequestMapping(value = "/goadd")
	public String goaddBulletin() {
		return "back_page/bulletin-add";
	}

	// 添加公告
	@RequestMapping(value = "/add")
	public String addBulletin(HttpServletRequest req,HttpSession session) {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String state1 = req.getParameter("state");
		Integer state = Integer.parseInt(state1);
		User createUser = new User();
		session = req.getSession();
		createUser = (User)session.getAttribute("backUserSession");
		Date createDate = new Date();
		Bulletin bulletin = new Bulletin();
		bulletin.setTitle(title);
		bulletin.setContent(content);
		bulletin.setState(state);
		bulletin.setCreateUser(createUser);
		bulletin.setCreateDate(createDate);
		bulletinService.addBulletin(bulletin);
		return "redirect:/bulletin/list";
	}

	// 跳转到修改公告页
	@RequestMapping(value = "/toedit")
	public String toupdateBulletinById(Integer id, Model model) {
		Bulletin bulletin = new Bulletin();
		bulletin = bulletinService.getBulletinById(id);
		model.addAttribute("bulletin", bulletin);
		return "back_page/bulletin-edit";
	}

	// 根据id修改公告
	@RequestMapping(value = "/edit")
	public String updateBulletinById(HttpServletRequest req,HttpSession session) {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String state1 = req.getParameter("state");
		int id = Integer.parseInt(req.getParameter("id"));
		Integer state = Integer.parseInt(state1);
		User createUser = new User();
		session = req.getSession();
		createUser = (User)session.getAttribute("backUserSession");
		Date createDate = new Date();
		Bulletin bulletin = new Bulletin();
		bulletin.setId(id);
		bulletin.setTitle(title);
		bulletin.setContent(content);
		bulletin.setState(state);
		bulletin.setCreateUser(createUser);
		bulletin.setCreateDate(createDate);
		bulletinService.updateBulletinById(bulletin);
		return "back_page/bulletin-edit-success";
	}

	// 根据id删除公告
	@RequestMapping(value = "/delete")
	public String deleteBulletinById(Integer id, Pager<Bulletin> pageBean,
			Model model) {
		bulletinService.deleteBulletinById(id);
		Pager<Bulletin> bulletinList = bulletinService
				.getAllBulletins(pageBean);
		model.addAttribute("pageBean", bulletinList);
		return "back_page/bulletin-list";
	}

	// 批量删除
	@RequestMapping(value = "/deleteall")
	public void deleteAll(HttpServletRequest request) {
		String[] arr = request.getParameterValues("names[]");
		List<Integer> list = new ArrayList<Integer>();
		int id = 0;
		for (int i = 0; i < arr.length; i++) {
			if (!arr[i].equals("")) {
				id = Integer.valueOf(arr[i]).intValue();
				list.add(id);
			}
		}
		bulletinService.deleteBatchById(list);
	}

	// 跳转到数据备份页
	@RequestMapping(value = "/data-copy")
	public String todatacopy() {
		return "back_page/data-copy";
	}

	public static boolean exportDatabaseTool(String hostIP, String userName,
			String password, String savePath, String fileName,
			String databaseName) throws InterruptedException {
		File saveFile = new File(savePath);
		if (!saveFile.exists()) {// 如果目录不存在
			saveFile.mkdirs();// 创建文件夹
		}
		if (!savePath.endsWith(File.separator)) {
			savePath = savePath + File.separator;
		}

		PrintWriter printWriter = null;
		BufferedReader bufferedReader = null;
		try {
			printWriter = new PrintWriter(new OutputStreamWriter(
					new FileOutputStream(savePath + fileName), "utf8"));
			Process process = Runtime.getRuntime().exec(
					" mysqldump -h" + hostIP + " -u" + userName + " -p"
							+ password + " --set-charset=UTF8 " + databaseName);
			InputStreamReader inputStreamReader = new InputStreamReader(
					process.getInputStream(), "utf8");
			bufferedReader = new BufferedReader(inputStreamReader);
			String line;
			while ((line = bufferedReader.readLine()) != null) {
				printWriter.println(line);
			}
			printWriter.flush();
			if (process.waitFor() == 0) {// 0 表示线程正常终止。
				return true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bufferedReader != null) {
					bufferedReader.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	// 数据备份
	@RequestMapping(value = "/copy")
	public String datacopy(HttpServletRequest req, HttpServletResponse resp,
			Model model) throws Exception {
		String url = "D:/backupDatabase";
		String forward = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String fileName = sdf.format(date);
		try {
			if (exportDatabaseTool("localhost", "root", "root", url, fileName
					+ ".sql", "donate")) {
				System.out.println("数据库成功备份！！！");
				forward = "back_page/data-copy-success";
				model.addAttribute("url", url);
			} else {
				System.out.println("数据库备份失败！！！");
				forward = "back_page/data-copy-failed";
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return forward;
	}

	// 跳转到数据恢复页
	@RequestMapping(value = "/data-recover")
	public String todatarecover() {
		return "back_page/data-recover";
	}

	// 数据恢复模块
	public boolean load(String fileName) {
		String filepath1 = "d:\\backupDatabase\\"; // 备份的路径地址
		String filepath = filepath1 + fileName;
		String stmt1 = "mysqladmin -u root -proot create donate";
		String stmt2 = "mysql -u root -proot donate < " + filepath;
		String[] cmd = { "cmd", "/c", stmt2 };
		try {
			Runtime.getRuntime().exec(stmt1);
			Runtime.getRuntime().exec(cmd);
			System.out.println("数据已从 " + filepath + " 导入到数据库中");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}

	// 数据恢复
	@RequestMapping(value = "/recover")
	public String datarecover(HttpServletRequest req) {
		String fileName = req.getParameter("file-2");
		String forward = null;
		if (load(fileName)) {
			forward = "back_page/data-recover-success";
			System.out.println("数据恢复成功！");
		} else {
			forward = "back_page/data-recover-failed";
			System.out.println("数据恢复失败！");
		}
		return forward;
	}
}
