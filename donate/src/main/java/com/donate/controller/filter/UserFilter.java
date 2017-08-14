package com.donate.controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
/**
 * 前台页面过滤
 * @author Administrator
 *
 */
public class UserFilter implements Filter {
	
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("开始过滤");

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		chain.doFilter(request, response);

	}

	public void destroy() {
		System.out.println("结束过滤");

	}

}
