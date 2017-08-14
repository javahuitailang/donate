package com.donate.controller;


import com.donate.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class HelloWorld {

	@Resource
	UserService userService;
	
	public HelloWorld() {
		System.out.println("HelloWorld Constructor...");
	}
	
	@RequestMapping("/helloworld")
	public String hello(){
		System.out.println("success");
		System.out.println(userService);
		return "success";
	}
	
}
