package com.donate.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

/**
 * 上传文件类型的工具类
 * @author mzq
 *
 */
public class ResponseUtil {
		//发送内容  
		public static void render(HttpServletResponse response,String contentType,String text){
			response.setContentType(contentType);
			try {
				response.getWriter().write(text);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//发送的是JSON
		public static void renderJson(HttpServletResponse response,String text){
			render(response, "application/json;charset=UTF-8", text);
		}
		//发送xml
		public static void renderXml(HttpServletResponse response,String text){
			render(response, "text/xml;charset=UTF-8", text);
		}
		//发送text
		public static void renderText(HttpServletResponse response,String text){
			render(response, "text/plain;charset=UTF-8", text);
		}
}
