package com.donate.controller;

import com.alibaba.fastjson.JSONObject;
import com.donate.controller.util.EmailUtils;
import com.donate.po.User;
import com.donate.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.Random;


@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	UserService userService;

	/**
	 * 跳转到登录界面
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String login() {

		return "login";
	}

	/**
	 * 登录处理
	 * 
	 * @param userName
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(String userName, String password, HttpServletRequest request) {
		User user = new User();
		request.setAttribute("userName", userName);
		String erro;// 错误信息
		HttpSession session = request.getSession();
		String code = session.getAttribute("loginCode").toString();// 从session中获取验证码

		String formCode = request.getParameter("code");// 获取输入的验证码

		// 输入的验证码并无大小写区分，判断验证码输入是否正确
		if (!code.equalsIgnoreCase(formCode)) {
			erro = "验证码不正确,请重新输入验证码";
			request.setAttribute("erro", erro);// 如果验证码不正确，保存错误信息，并返回到登录界面
			return "login";
		}
		String SQLPassWord;
		// 判断表单传进来的用户名是否为空
		if (userName.trim().length() != 0 && userName != null) {
			// 判断输入的密码是否为空
			if (password != null && password.trim().length() != 0) {
				// SQLPassWord =
				// userService.getUserByName(userName).getPassword();
				// 判断数据库中是否存在传进来的登录名
				if (userService.getUserByName(userName) != null) {
					SQLPassWord = userService.getUserByName(userName).getPassword();
					// 判断用户名是否正确
					if (SQLPassWord.equals(password)) {
						user = userService.getUserByName(userName);
						if (user.getCountState() == 1) {

							session.setAttribute("userSession", user);

						} else if (user.getCountState() == 0) {
							erro = "用户尚未激活,请激活后再登录";
							request.setAttribute("erro", erro);// 如果不正确，保存错误信息，返回到登录界面
							return "login";
						} else {
							erro = "用户处于不可用状态,请联系管理员";
							request.setAttribute("erro", erro);// 如果不正确，保存错误信息，返回到登录界面
							return "login";
						}
						session.setAttribute("userSession", user);
					} else {
						erro = "密码不正确,请重新输入密码";
						request.setAttribute("erro", erro);// 如果不正确，保存错误信息，返回到登录界面
						return "login";
					}
				} else {
					erro = "用户名不正确或者不存在，请重新输入";
					request.setAttribute("erro", erro);// 保存错误信息，返回到登录界面
					return "login";
				}
			} else {
				erro = "密码不能为空";
				request.setAttribute("erro", erro);// 保存错误信息，返回到登录界面
				return "login";
			}
		} else {
			erro = "用户名不能为空";
			request.setAttribute("erro", erro);// 保存错误信息，返回到登录界面
			return "login";
		}
		return "redirect:/index/getIndexMsg";
	}

	@RequestMapping("/success")
	public String success() {
		return "success";
	}

	/**
	 * 随机生成验证码
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/getCode.do")
	public void getCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");// 输出的文本格式为jpg
		BufferedImage image = new BufferedImage(100, 30, BufferedImage.TYPE_INT_RGB);// BufferedImage他是一个类
		Graphics g = image.getGraphics();// 绘图工具
		g.setColor(Color.cyan);
		g.fillRect(0, 0, 100, 30);
		// 用来随机抽取验证码
		String[] keys = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
				"O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
				"o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" };
		// 验证码字体
		String[] fonts = { "新宋体", "微软雅黑" };
		// 大小
		int[] sizes = { 18, 19, 20, 21, 22, 23, 24 };
		// 字体形状
		int[] sys = { 0, Font.BOLD, Font.ITALIC, Font.BOLD + Font.ITALIC };
		String code = "";// 验证码
		// 随机获取4位验证码
		for (int i = 0; i < 4; i++) {
			String c = keys[(int) (Math.random() * keys.length)];// 从keys数组中随机抽取一位验证码
			String font = fonts[(int) (Math.random() * fonts.length)];// 随机获取字体
			int size = sizes[(int) (Math.random() * sizes.length)]; // 设置大小
			int sty = sys[(int) (Math.random() * sys.length)];
			int r1 = (int) Math.random() * 190;
			int g1 = (int) Math.random() * 190;
			int b1 = (int) Math.random() * 190;
			Color color = new Color(r1, g1, b1); // 背景颜色
			g.setFont(new Font(font, sty, size)); // 设置完整的字体
			g.setColor(color);
			g.drawString(c, 5 + (i * 24), 26); // 图片中的字体大小
			code += c; // 验证码叠加

		}
		;
		HttpSession session = request.getSession();
		session.setAttribute("loginCode", code); // 保存验证码到session域中
		ImageIO.write(image, "jpeg", response.getOutputStream());

	}

	@RequestMapping("/getName")
	public void getName(@RequestParam(value = "userName", required = false) String userName, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		JSONObject json = new JSONObject();
		System.out.println(userName);
		if (userName != null && !"".equals(userName) && userName.trim().length() >=2 && userName.trim().length() < 20) {
			User user = userService.getUserByName(userName);
			if (null != user && !"".equals(user)) {
				json.put("msg", "用户可以使用");
				response.getWriter().write(json.toString());
			} else {
				json.put("msg", "用户不存在，请重新输入");
				response.getWriter().write(json.toString());
			}
		} else {
			json.put("msg", "用户名长度必须在2到20之间");
			response.getWriter().write(json.toString());
		}
	}

	/**
	 * 跳转到注册界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register")
	public String register() {
		return "register";
	}
	/**
	 * 发送邮件
	 * 
	 * @param response
	 * @param name
	 * @throws IOException
	 */
	@RequestMapping("/sendCodeToFindPassword")
	public void getCode(@RequestParam(value="name",required = false)String name,HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		
		int[] code = new int[6];
		String sendCode = "";
		Random r = new Random();
		// 随机产生6位数字的验证码
		for (int i = 0; i < code.length; i++) {
			int j = r.nextInt(10); // 随机产生验证码
			sendCode += j;
		}
		HttpSession session = request.getSession();
		session.setAttribute(name, sendCode);
		User user = userService.getUserByName(name);
		// 使用邮件工具，提供姓名，邮箱和验证码
		EmailUtils emailUtils = new EmailUtils(name, user.getEmail(), sendCode);
		// 设置邮箱发送的内容
		emailUtils.setContent(1);
		// 发送邮件
		emailUtils.send();
		response.setCharacterEncoding("utf-8");
		JSONObject json = new JSONObject(); 
		json.put("info", "发送成功,已发送到您的邮箱"+user.getEmail()+",请接收");
		response.getWriter().write(json.toString());
	}
	
	/**
	 * 发送邮件
	 * 
	 * @param response
	 * @param email
	 * @param name
	 * @throws IOException
	 */
	@RequestMapping("/sendCode")
	public void getCode(String email, String name) throws IOException {
		int[] code = new int[6];
		String sendCode = "";
		Random r = new Random();
		// 随机产生6位数字的验证码
		for (int i = 0; i < code.length; i++) {
			int j = r.nextInt(10); // 随机产生验证码
			sendCode += j;
		}
		// 使用邮件工具，提供姓名，邮箱和验证码
		EmailUtils emailUtils = new EmailUtils(name, email, sendCode);
		// 设置邮箱发送的内容
		emailUtils.setContent(0);
		// 发送邮件
		emailUtils.send();
		/*
		 * JSONObject json = new JSONObject(); json.put("msg", "发送成功");
		 */
		// response.getWriter().write(json.toString());
	}

	/**
	 * 注册处理过程
	 * 
	 * @param user
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/registerOut")
	public String registerOut(User user, HttpServletRequest request, HttpServletResponse response) {
		String erro;
		// 判断用户名是否已经被注册
		if (userService.getUserByName(user.getUserName()) == null) {
			Date date = new Date();
			// 注册日期
			user.setCreateDate(date);
			user.setCountState(0);
			user.setCountType(0);
			// 保存邮箱信息到request域
			// System.out.println(user.getEmail());
			request.setAttribute("email", user.getEmail());
			// 保存User到session
			/*
			 * HttpSession session = request.getSession();
			 * 
			 * session.setAttribute("registerSession",user);
			 */
			try {
				userService.addUser(user); // 把user保存到数据库
				// 注册激活邮件
				getCode(user.getEmail(), user.getUserName());
			} catch (IOException e) {
				e.printStackTrace();
			}
			response.setCharacterEncoding("utf-8");
			return "toRegisterJH";
		} else {
			erro = "用户名已经被注册，请重新输入";
			request.setAttribute("erro", erro);// 保存错误信息，返回到登录界面
			return "register";
		}
	}

	/**
	 * 跳转到后台登录界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backLogin")
	public String backLogin() {
		return "/back_page/login";
	}

	/**
	 * 用户退出登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/backLoginOut")
	public String backLoginOut(HttpServletRequest request) {
		request.getSession().setAttribute("backUserSession", null);
		return "/back_page/login";
	}
	
	/**
	 * 后台登录处理过程
	 * 
	 * @param request
	 * @param userName
	 * @param password
	 * @param online
	 * @return
	 */
	@RequestMapping(value = "/backLoginCl")
	public String backLoginCl(HttpServletRequest request, String userName, String password, String online) {
		User user = new User();
		request.setAttribute("userName", userName);
		String erro;// 错误信息
		HttpSession session = request.getSession();
		String code = session.getAttribute("loginCode").toString();// 从session中获取验证码

		String formCode = request.getParameter("code");// 获取输入的验证码

		// 输入的验证码并无大小写区分，判断验证码输入是否正确
		if (!code.equalsIgnoreCase(formCode)) {
			erro = "验证码不正确,请重新输入验证码";
			request.setAttribute("erro", erro);// 如果验证码不正确，保存错误信息，并返回到登录界面
			return "/back_page/login";
		}
		String SQLPassWord;
		// 判断表单传进来的用户名是否为空
		if (userName.trim().length() != 0 && userName != null) {
			// 判断输入的密码是否为空
			if (password != null && password.trim().length() != 0) {
				// SQLPassWord =
				// userService.getUserByName(userName).getPassword();
				// 判断数据库中是否存在传进来的登录名
				if (userService.getUserByName(userName) != null) {
					SQLPassWord = userService.getUserByName(userName).getPassword();
					// 判断用户名是否正确
					if (SQLPassWord.equals(password)) {
						user = userService.getUserByName(userName);
						if (user.getCountState() == 1) {
							session.setAttribute("backUserSession", user);
						} else if (user.getCountState() == 0) {
							erro = "用户尚未激活,请激活后再登录";
							request.setAttribute("erro", erro);// 如果不正确，保存错误信息，返回到登录界面
							return "/back_page/login";
						} else {
							erro = "用户处于不可用状态,请联系管理员";
							request.setAttribute("erro", erro);// 如果不正确，保存错误信息，返回到登录界面
							return "/back_page/login";
						}
						/*
						 * null on
						 */
						if (null == online) {
							// 如果online为null则当退出登录是，登录状态只保存30分钟
							session.setMaxInactiveInterval(1 * 60 * 30);
						} else {
							// 如果online不为null则当退出登录是，登录状态只保存3天
							session.setMaxInactiveInterval(1 * 60 * 60 * 24 * 3);
						}
					} else {
						erro = "密码不正确,请重新输入密码";
						request.setAttribute("erro", erro);// 如果不正确，保存错误信息，返回到登录界面
						return "/back_page/login";
					}
				} else {
					erro = "用户名不正确或者不存在，请重新输入";
					request.setAttribute("erro", erro);// 保存错误信息，返回到登录界面
					return "/back_page/login";
				}
			} else {
				erro = "密码不能为空";
				request.setAttribute("erro", erro);// 保存错误信息，返回到登录界面
				return "/back_page/login";
			}
		} else {
			erro = "用户名不能为空";
			request.setAttribute("erro", erro);// 保存错误信息，返回到登录界面
			return "/back_page/login";
		}
		// 账户类型
		int countType = userService.getUserByName(userName).getCountType();
		// 判断有没有权限登陆后台界面
		if (countType == 0) {
			erro = "您只是普通会员，无法登陆";
			request.setAttribute("erro", erro);// 保存错误信息，返回到登录界面
			return "/back_page/login";
		} else {
			erro = "用户名不能为空";
			request.setAttribute("erro", erro);// 保存错误信息，返回到登录界面
			return "redirect:/admin/goback";
		}
	}

	/**
	 * 跳转到注册成功页面
	 * 
	 * @return
	 */
	@RequestMapping("/toRegisterJH")
	public String toRegisterJH() {
		return "toRegisterJH";
	}

	/**
	 * 激活页面
	 * 
	 * @return
	 */
	@RequestMapping("/JH")
	public String JH() {

		return "JH";
	}

	/**
	 * 注册激活流程
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/registerJH")
	public String registerJH(HttpServletRequest request, String userName) {
		/*
		 * HttpSession session = request.getSession(); //得到注册的User信息 User user =
		 * (User)session.getAttribute("registerSession");
		 */
		User user = userService.getUserByName(userName);
		if (null == user || "".equals(user)) {
			String erro = "激活失败,用户名不存在";
			request.setAttribute("erro", erro);
			return "JH";
		}
		if (user.getCountState() == 1) {
			String erro = "激活失败,用户名已经激活,无须再激活,请输入其它激活用户";
			request.setAttribute("erro", erro);
			return "JH";
		}
		if (user.getCountState() == 2) {
			String erro = "激活失败,用户名处于不可用状态";
			request.setAttribute("erro", erro);
			return "JH";
		}
		Date date = new Date(); // 激活时间
		long temp = date.getTime() - user.getCreateDate().getTime();// 激活时间与注册时间的差值
		// 如果激活时间与注册时间的差值不超过3天，可以成功激活
		if (temp / 1000 < 3 * 24 * 3600) {
			HttpSession session = request.getSession();
			session.setAttribute("userSession", user);
			user.setEffectDate(date); // 设置激活时间
			userService.updateEffectDateAndCountStateByUser(user);
			return "redirect:/user/successJH";
		} else {
			String erro;
			erro = "激活码时间已经到期，请重新注册";
			request.setAttribute("erro", erro);// 保存错误信息，返回到注册界面
			return "register";
		}
	}

	/**
	 * 激活成功
	 * 
	 * @return
	 */
	@RequestMapping("successJH")
	public String successJH() {
		return "successJH";
	}

	/**
	 * 登录错误
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backLoginErro")
	public String backLoginErro() {
		return "back_page/erro";
	}

	/**
	 * 用户退出登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/exit")
	public String exit(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/index/getIndexMsg";
	}
	/**
	 * 用户找回密码
	 * @return
	 */
	@RequestMapping(value="/find_password")
	public String find_password(){
		return "find_password";
	}
	@RequestMapping(value="/find_passwordCl")
	public String find_passwordCl(String userName,String code,HttpServletRequest request){
		//System.out.println(userName +""+code+""+request.getSession().getAttribute(userName));
		if("".equals(null)||code==null||code.trim().length()==0){
			String erro = "验证码不能为空";
			request.setAttribute("erro", erro);
			return "find_password";
		}else if(!code.equals(request.getSession().getAttribute(userName))){
			String erro = "验证码不正确";
			request.setAttribute("erro", erro);
			return "find_password";
		}else if("".equals(userName)||userName==null||userName.trim().length()==0){
			String erro = "用户名不能为空";
			request.setAttribute("erro", erro);
			return "find_password";
		}
		 User user = userService.getUserByName(userName);
		if("".equals(user)||user==null){
			String erro = "用户名不存在";
			request.setAttribute("erro", erro);
			return "find_password";
		}
		request.setAttribute("userName", userName);
		return "rewrite_password";
	//	return "forward:/user/rewrite_password";
	}
	@RequestMapping(value="/updatePassWord")
	public String updatePassWord(String userName,String password,String checkPassword,
			HttpServletRequest request,ModelMap model){
		if(null==request.getSession().getAttribute(userName)){
			model.addAttribute("missCode", "请经邮箱验证后再修改密码");
			return "message";
		}
		if(password.trim().length()==0||null == password||"".equals(password)){
			String erro = "密码不能为空";
			request.setAttribute("erro", erro);
			return "rewrite_password";
		}else if(checkPassword.trim().length()==0||null == checkPassword||"".equals(checkPassword)){
			String erro = "第二次密码不能为空";
			request.setAttribute("erro", erro);
			return "rewrite_password";
		}else if(!password.equals(checkPassword)){
			String erro = "两次密码不同";
			request.setAttribute("erro", erro);
			return "rewrite_password";
		}
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		userService.updateUserByName(user);
		String info = "修改密码成功";
		request.setAttribute("info", info);
		return "message";
	}

}
