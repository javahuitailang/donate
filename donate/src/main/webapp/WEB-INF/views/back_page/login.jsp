<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="<%=path%>/back/lib/html5.js"></script>
<script type="text/javascript" src="<%=path%>/back/lib/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/back/lib/PIE_IE678.js"></script>
<![endif]-->
<link href="<%=path%>/back/static/h-ui/css/H-ui.min.css"
	rel="stylesheet" type="text/css" />
<link href="<%=path%>/back/static/h-ui.admin/css/H-ui.login.css"
	rel="stylesheet" type="text/css" />
<link href="<%=path%>/back/static/h-ui.admin/css/style.css"
	rel="stylesheet" type="text/css" />
<link href="<%=path%>/back/lib/Hui-iconfont/1.0.7/iconfont.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录 - 在线捐款系统</title>

<meta name="keywords" content=" ">
<meta name="description" content=" ">
<style>
.start1 {
	color: #aaa;
}

.start2 {
	color: #000;
}

.start3 {
	color: red;
}

.start4 {
	color: green;
}
</style>
<script type="text/javascript" src="<%=path%>/js/check.js"></script>
<script type="text/javascript">
	//重新获取验证字符
	function changeImage() {
		//单击触发图片重载事件，完成图片验证码的更换
		document.getElementById("imgRandom").src = document
				.getElementById("imgRandom").src
				+ '?';
	}
</script>
</head>

<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />

	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<h4 style="margin-left: 28%">
				<font color="red">${erro}</font>
			</h4>
			<form class="form form-horizontal" action="<%=path %>/user/backLoginCl" method="post" onsubmit="return login('click')">
				<div class="row cl" style="margin-left:-7%;">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i>
					</label>
					<div class="formControls col-xs-8">
						<input id="userName" name="userName" value="${userName}" type="text" 
							class="input-text size-L" size="6px"> <span
							class="start1"><img height="15px" width="15px"
							src="<%=path%>/images/login-register/3.png" />请输入账户名称</span>
					</div>



				</div>

				<div class="row cl" style="margin-left:-7%">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i>
					</label>
					<div class="formControls col-xs-8">
						<input id="password" name="password" type="password"
							 class="input-text size-L"> <span
							class="start1"><img height="15px" width="15px"
							src="<%=path%>/images/login-register/3.png" />请输入賬戶密码</span>

					</div>


				</div>
				<%-- <div class="row cl" style="margin-left:-6%">
				<span class="start1" style="margin-left:27%"><img height="15px" width="15px" src="<%=path%>/images/login-register/3.png" />请输入密码</span>
				</div> --%>
				<div class="row cl" style="margin-left:-7%">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input class="input-text size-L" type="text" style="width:150px;" name="code">
						<a href="#" onclick="changeImage();return false;"
							style="font-size: 13px;margin-top:10%"> <img
							style=" margin-left: 2%" id="imgRandom"
							src="<%=path%>/user/getCode.do" onclick="changeImage()" />看不清,再点击一次</a>
					</div>
				</div>
				<div class="row cl" style="margin-left:-7%">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<label for="online"> <input type="checkbox" name="online"
							id="online"> 使我保持登录状态</label>
					</div>
				</div>
				<div class="row cl" style="margin-left:-7%">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input name="" type="submit" class="btn btn-success radius size-L"
							value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> <input
							name="" type="reset" class="btn btn-default radius size-L"
							value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">Copyright 在线捐款系统</div>
	<script type="text/javascript"
		src="<%=path%>/back/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/back/static/h-ui/js/H-ui.js"></script>

</body>
</html>