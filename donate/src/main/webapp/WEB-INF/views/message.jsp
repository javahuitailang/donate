<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>信息提示-在线捐款系统</title>
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<!-- Le styles -->
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
<script type="text/javascript" src="<%=path%>/js/biobox.js"></script>
</head>
<body>

	<script type="text/javascript" src="<%=path%>/js/borsertocss.js">
		
	</script>
	<!-- 判断在IE9以下浏览器中根据像素的不同而设置的样式 -->


	<!--头部代码开始-->
	<jsp:include page="/public/head.jsp" />

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
								<div class="fc333">信息提示：</div>
								<p class="fc999" style="max-width: 470px;">
									<font color="red" size="5">${msg }</font>
									<font color="red" size="5">${info }</font>
									<font color="red" size="5">${missCode }</font>
								</p>
								<c:if test="${missCode !=null}">
										<p class="fc999" style="max-width: 470px;">
										<font color="red" size="5"><a href="javascript:void(0)" onclick="window.location.href='<%=path%>/user/find_password'">返回找回密码界面</a></font>
									</p>
								</c:if>
								<c:if test="${info !=null}">
										<p class="fc999" style="max-width: 470px;">
										<font color="red" size="5"><a href="javascript:void(0)" onclick="window.location.href='<%=path%>/user/login'">返回登录界面</a></font>
									</p>
								</c:if>
								<c:if test="${toLogin !=null }">
									<p class="fc999" style="max-width: 470px;">
										<font color="red" size="5"><a href="javascript:void(0)" onclick="window.location.href='<%=path%>/user/login'">${toLogin}</a></font>
									</p>
								</c:if>
								<c:if test="${toHomePage !=null }">
									<p class="fc999" style="max-width: 470px;">
										
										<a href="javascript:void(0)" onclick="window.location.href='<%=path%>/apply/toHomePage'"><font color="red" size="5">${toHomePage}</font>,点击此处去完善资料</a>
									</p>
									
								</c:if>
								<c:if test="${toApply !=null }">
									<p class="fc999" style="max-width: 470px;">
									<a href="javascript:void(0)" onclick="window.location.href='<%=path%>/apply/toApply'"><font color="red" size="5">${toApply}</font>,点击此处去申请求助</a>
									</p>
									
								</c:if>
							</div>

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





</body>
</html>