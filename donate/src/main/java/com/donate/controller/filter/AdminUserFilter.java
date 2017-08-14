package com.donate.controller.filter;

import java.io.IOException;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.donate.po.User;
/**
 * 过滤器
 * @author Administrator
 *
 */
public class AdminUserFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("filter创建了");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest r = (HttpServletRequest) request;
		HttpServletResponse rs = (HttpServletResponse)response;
		HttpSession session = r.getSession();
		User attribute = (User) session.getAttribute("backUserSession");
		if (null != attribute) {
			filterChain.doFilter(request, response);
		} else {
			rs.sendRedirect("/donate/user/backLoginErro");
		}

	}

	public void destroy() {
		System.out.println("filter结束了");
	}

}
