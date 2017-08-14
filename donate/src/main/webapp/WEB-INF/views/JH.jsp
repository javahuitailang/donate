<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <jsp:include page="/public/head.jsp"></jsp:include>
	<!-- Le styles -->
	<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/style/index.css" />


	<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/comment.css" />
    
    <title>激活页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
  	<h4 style="color: red;margin-top: 1%">${erro}</h4>
  <form action="<%=path %>/user/registerJH">
  <div style="margin-top: 3%">
    	请输入激活用户的姓名:<input type="text" name="userName" style="width: 10% ;height: 6%"  /><input type="submit" value="激活"/>
    	</div>
    </form>
    </center>
  </body>
</html>
