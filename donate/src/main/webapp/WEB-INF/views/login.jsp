<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN" />
<script type="text/javascript" src="<%=path%>/js/jquery1.4.js"></script>
<title>在线捐款平台-登录</title>
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<!-- Le styles -->

<link href="<%=path%>/back/static/h-ui.admin/css/H-ui.login.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/login.css" />
<script type="text/javascript" src="<%=path%>/js/bioV4.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery.lazyload.mini.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/comment.css" />
<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js?v=20130220"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]-->
<link type="text/css" rel="stylesheet"
	href="<%=path%>/style/biobox2.css" />
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
<script type="text/javascript" src="<%=path%>/js/biobox.js"></script>
</head>
<body>
	<script type="text/javascript" language="javascript">
		//重新获取验证字符
		function changeImage() {
			//单击触发图片重载事件，完成图片验证码的更换
			document.getElementById("imgRandom").src = document
					.getElementById("imgRandom").src
					+ '?';
		}
	</script>

	<script type="text/javascript" src="<%=path%>/js/borsertocss.js">
		
	</script>
	<script type="text/javascript" src="<%=path%>/js/check.js"></script>
	<!-- 判断在IE9以下浏览器中根据像素的不同而设置的样式 -->


	<!--头部代码开始-->
	<jsp:include page="/public/head.jsp"></jsp:include>

	<!--头部代码结束-->


	<div class="hr tp-div-nexthr"
		style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
	<div class="container pb-15">
		<!-- Example row of columns -->
		<div class="row">
			<div class="span16">

				<div class="label-div t-15 border-all" style="padding: 0;">
					<div class="label-main">
						<div class="clearfix label-public">
							<div class="pull-left third-party l-30 pt-25">
								<p class="fc999" style="max-width: 470px;">欢迎使用传习在线捐款平台。</p>
							</div>
							<center>
								<h5>
									<font color="red">${erro}</font>
								</h5>
							</center>
							<form id="login_form1" action="<%=path%>/user/logout"
								method="post" onsubmit="return login('click')">
								<div class="pull-left border-l public-login span7"
									style="min-height: 335px;">
									<div class="clearfix pt-25">
										<div class="title pull-left fc999" style="width: 60px;">用户名</div>

										<input style="margin-left:3.6%" type="text" id="username"
											name="userName" class="span4" value="${userName}" /> <span
											style="margin-left:4%" class="start1"><img
											height="15px" width="15px"
											src="<%=path%>/images/login-register/3.png" />请输入用户名</span>
										<!-- <span class="pull-left l-20 fcCF261F info username_msg"></span> -->
									</div>
									<div class="clearfix pt-25">
										<div class="title pull-left fc999"
											style="width: 60px;margin-left:-0.3%">密&nbsp;&nbsp;&nbsp;码</div>
										<input style="margin-left:3.9%" type="password" id="password"
											name="password" class="span4" /> <span class="start1"
											style="margin-left:4%"><img height="15px" width="15px"
											src="<%=path%>/images/login-register/3.png" />请输入密码</span>
										<!-- <span class="pull-left l-20 fcCF261F info password_msg"></span> -->
									</div>
									<div class="clearfix pt-25">
										<div class="title pull-left fc999" style="width: 60px;">验证码</div>
										<div class="pull-left l-20">
											<input type="text" id="code" name="code" class="span2" />
										</div>
										<a href="#" onclick="changeImage();return false;"
											style="font-size: 13px;margin-top:10%"> <img
											style=" margin-left: 5%" id="imgRandom"
											src="<%=path%>/user/getCode.do" onclick="changeImage()" />看不清验证码，再点击一次</a>
										<!-- <span class="pull-left l-20 fcCF261F info password_msg"></span> -->
									</div>

									<div class="clearfix pt-25">
										<div class="title pull-left"
											style="margin-left: 6px;_margin-left: 3px;">&nbsp;</div>
										<!--< a href="javascript:void(0);" title="登录"
											onclick="submit_form(this)"
											class="pull-left login-register-btn">登&nbsp;录</a> -->
										<div class="formControls col-xs-8 col-xs-offset-3">
											<input name="" type="submit"
												class="btn btn-success radius size-L"
												value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"/> <input
												name="" type="reset" class="btn btn-default radius size-L"
												value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;"/>
												<a href="<%=path %>/user/find_password" ><span style="font-size: 85%;color: blue;">忘记密码?</span></a>
												<a href="<%=path %>/user/backLogin" style="margin-left: 2%;font-size: 85%"><font color="blue">>>后台登录</font></a>
										</div>
										
										<div class="pull-left l-20 t-8"
											style="_width: auto;_margin-left: 15px;">
											<input type="checkbox" checked="checked"
												style="_width: 20px;_margin: 0;" />
										</div>
										<span class="pull-left l-5 info fc999"
											style="_width: auto;_margin: 0;">下次自动登录<!-- <span class="l-10 fcccc">|</span><a class="fc999 l-10" href="" title="忘记密码">忘记密码</a> -->
										</span>
									</div>
					
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- /container -->
	<div class="container">
		<div class="hr"></div>
	</div>
	<!-- /container -->
	
	<jsp:include page="/public/footer.jsp"></jsp:include>

</body>
</html>