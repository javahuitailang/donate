package com.donate.controller;

import com.donate.po.Appeal;
import com.donate.po.User;
import com.donate.service.AppealService;
import com.donate.service.UserService;
import com.donate.util.Constants;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.UniformInterfaceException;
import com.sun.jersey.api.client.WebResource;
import net.fckeditor.response.UploadResponse;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map.Entry;


/**
 * 申请求助信息控制层
 * @author mzq
 *
 */
@Controller
@RequestMapping(value="/apply")
public class ApplyController {
	
	@Resource
	private AppealService appealService;
	
	@Resource
	private UserService userService;
	/**
	 * 去申请求助页面
	 * @return
	 */
	@RequestMapping(value="/toApply")
	public String toApply(HttpServletRequest request,ModelMap model){
		
		HttpSession session = request.getSession();
		//获取session中的用户
		User user = (User) session.getAttribute("userSession");
		
		
		//如果为空打回到登录页面
		if(null == user){
			model.addAttribute("toLogin", "请重新登录");
			return "login";
		}
		
		User dbUser = userService.getUserByName(user.getUserName());
		
		if(null==dbUser.getCountState() || dbUser.getCountState() == 0){
			// 账户不可用
			model.addAttribute("msg", "很抱歉，你的账户目前还未被审核");
			return "message";
		}
		
		session.setAttribute("userSession", dbUser);
		//校验是否存在空信息
		if(dbUser.getPhoto() == null || dbUser.getRealName()==null || dbUser.getIdCard() == null
				||dbUser.getTel() == null || dbUser.getAddress() == null){
			//  去会员补全信息页面
			model.addAttribute("toHomePage", "请先完善你的个人资料");
			return "message";
		}
		
		//成功跳转
		return "front_page/apply";
	}
	
	/**
	 * 处理 fck上传图片
	 * @param request
	 */
	@RequestMapping(value="/fckUpload")
	public void toApply(HttpServletRequest request,HttpServletResponse response){
		//强转
		MultipartHttpServletRequest mHttpServletRequest = (MultipartHttpServletRequest) request;
		
		//获取请求中的所有文件
		Map<String, MultipartFile> files = mHttpServletRequest.getFileMap();
		
		//遍历map
		Set<Entry<String, MultipartFile>> entrySet = files.entrySet();
		
		//获取迭代器对象
		Iterator<Entry<String, MultipartFile>> iterator = entrySet.iterator();
		
		while(iterator.hasNext()){
			//得到文件对象
			MultipartFile multipartFile = iterator.next().getValue();
			
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
			
			//保存图片的路径
			String url = Constants.PICTURE_DIRECTORY + pictureName;
			//jersey对象
			Client client = new Client();
			//与保存路径建立连接
			WebResource resource = client.resource(url);
			
			try {
				//发送
				resource.put(String.class, multipartFile.getBytes());
			} catch (UniformInterfaceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//得到成功响应
			UploadResponse ok = UploadResponse.getOK(url);
			
			PrintWriter pw = null;
			try {
				pw = response.getWriter();
				//响应图片给客户端
				pw.print(ok);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				pw.close();
			}
		}
	}
	
	/**
	 * 处理提交
	 */
	@RequestMapping(value = "/applyHelp")
	public String applyHelp(Appeal appeal,HttpServletRequest request,ModelMap model){
		//得到当前session中的user
		User user = (User) request.getSession().getAttribute("userSession");
		
		//设置所属的捐助对象
		appeal.setRecipient(user);
	
		//设置排序值(默认为0)
		appeal.setSortNum(10);
		
		//设置已筹集资金
		appeal.setHoldMoney(0.0);
		
		//设置创建时间
		appeal.setCreateDate(new Date());
		
		//设置最后更新时间
		appeal.setUpdateDate(new Date());
		appeal.setAppealType(0);
		//设置状态
		appeal.setAppealState(0);
		
		//设置最后更新管理员id
		// TODO
		appeal.setUpdateUser(user);
		
		appealService.addAppeal(appeal);
		
		model.addAttribute("msg", "申请求助信息成功!");
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
