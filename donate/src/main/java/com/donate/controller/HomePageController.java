package com.donate.controller;

import com.alibaba.fastjson.JSONObject;
import com.donate.po.User;
import com.donate.service.UserService;
import com.donate.util.Constants;
import com.donate.util.ResponseUtil;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 完成个人资料维护
 * @author 李岭峰
 *
 */
@Controller
@RequestMapping(value = "/homepage")
public class HomePageController {
	
	@Resource
	private UserService userService;
	/**
	 * 头像的上传
	 */
	@RequestMapping(value = "/upload")
	public void upload(MultipartFile multipartFile,HttpServletResponse response){
		
		//获取文件扩展名
		String extension = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
		
		//随机生成图片名
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String format = sdf.format(date);
		
		//随机数
		Random random = new Random();
		Integer randInt = random.nextInt(100);
		
		//得到图片名
		String pictureName = format + randInt.toString() + "." + extension;
		
		
		//得到保存图片的目录
		String pictureDir = this.getClass().getClassLoader()
				.getResource("/").getPath()
				.replace("WEB-INF/classes/", "picture/");
		
		File file = new File(pictureDir);
		//目录不存在
		if(!file.exists()){
			file.mkdir();
		}
		
		//实例化一个jersey对象
		Client client = new Client();
		
		//图片路径
		String url = Constants.PICTURE_DIRECTORY + pictureName;
		
		//与目标位置建立连接
		WebResource resource = client.resource(url);
			try {
				//将图片转为二进制传送
				resource.put(String.class, multipartFile.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		JSONObject json = new JSONObject();
		json.put("path", pictureName);
		json.put("url", url);
		
		//向客户端响应一个json类型数据
		ResponseUtil.renderJson(response, json.toString());
	}
	
	/**
	 * 个人信息的补全
	 * @return
	 */
	@RequestMapping(value = "/complementInf")
	public String complementInf(User user,ModelMap model,HttpServletRequest request){
		// 获取session中的用户
		User sessionUser = (User) request.getSession().getAttribute("userSession");
		//赋值当前用户信息
		user.setUserName(sessionUser.getUserName());
		
		userService.updateUserByName(user);
		
		request.getSession().setAttribute("userSession", user);
		
		model.addAttribute("toApply", "补全信息成功");
		return "message";
	}
	
	/**
	 * 跳转到个人资料维护页面
	 */
	@RequestMapping(value = "/toHomePage")
	public String toHomePage(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("userSession");
		
		User dbUser = userService.getUserByName(user.getUserName());
		request.setAttribute("user", dbUser);
		return "front_page/homepage";
	}
}
