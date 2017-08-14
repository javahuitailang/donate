<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>激活成功</title>
<jsp:include page="/public/head.jsp"></jsp:include>
<!-- Le styles -->
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/index.css" />


<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/comment.css" />

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="refresh" content ="5;url=<%=path%>/index/getIndexMsg">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body onload="showNum()">
	<center>
		<h4 style="color: red;margin-top: 3%">恭喜您激活成功</h4>


		
		<div style="margin-top: 2%">
		<script type="text/javascript">
			var i = 6;
			function showNum() {
				i = i - 1;
				document.getElementById("time").innerHTML = i + "秒后自动跳转到首页";
				setTimeout('showNum()', 1000);
			}
		</script>
		<a href="<%=path%>/index/getIndexMsg" id="time">点击直接跳转到主界面</a>
		</div>
	</center>
</body>
</html>
