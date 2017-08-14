package com.donate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping("/goback")
	public String goback(){
		return "back_page/index";
	}
	@RequestMapping("/welcome")
	public String welcome() {
		return "back_page/welcome";
	}
	
	@RequestMapping("haha")
	public String haha(){
		return "back_page/privilege-list" ;
	}
}
