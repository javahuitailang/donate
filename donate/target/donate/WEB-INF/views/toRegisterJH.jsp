<%@page language="java" pageEncoding="utf-8"%>
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
<jsp:include page="/public/head.jsp"></jsp:include>
<!-- Le styles -->
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/index.css" />


<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/comment.css" />

<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]-->
<link type="text/css" rel="stylesheet"
	href="<%=path%>/style/biobox2.css" />


<title>注册激活</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function toEmail(email){
		//alert("0000");
		var hash = {
			'qq.com' : 'http://mail.qq.com',
			'gmail.com' : 'http://mail.google.com',
			'sina.com' : 'http://mail.sina.com.cn',
			'163.com' : 'http://mail.163.com',
			'126.com' : 'http://mail.126.com',
			'yeah.net' : 'http://www.yeah.net/',
			'sohu.com' : 'http://mail.sohu.com/',
			'tom.com' : 'http://mail.tom.com/',
			'sogou.com' : 'http://mail.sogou.com/',
			'139.com' : 'http://mail.10086.cn/',
			'hotmail.com' : 'http://www.hotmail.com',
			'live.com' : 'http://login.live.com/',
			'live.cn' : 'http://login.live.cn/',
			'live.com.cn' : 'http://login.live.com.cn',
			'189.com' : 'http://webmail16.189.cn/webmail/',
			'yahoo.com.cn' : 'http://mail.cn.yahoo.com/',
			'yahoo.cn' : 'http://mail.cn.yahoo.com/',
			'eyou.com' : 'http://www.eyou.com/',
			'21cn.com' : 'http://mail.21cn.com/',
			'188.com' : 'http://www.188.com/',
			'foxmail.com' : 'http://www.foxmail.com',
			'outlook.com' : 'http://www.outlook.com'
		}
		var _mail =  email.split('@')[1];
		//$("#email").val().split('@')[1]; //获取邮箱域
		var newEmail="";
		for ( var j in hash) {
			if (j == _mail) {
				//alert(hash[_mail]);
				newEmail=hash[_mail]
				//$("#email").show().attr("href", hash[_mail]); //替换登陆链接
			}
		}
		window.location.href=""+newEmail;
	}
</script>
</head>

<body>
	<center>

		<h4 style="margin-top: 4%;color: red;">恭喜注册成功!!!请到邮箱激活</h4>
		<div style="margin-top: 2%">
			<a id="email" href="javascript:void(0);" onclick="toEmail('${email}')">${email}</a>
		</div>
	</center>
</body>
</html>
