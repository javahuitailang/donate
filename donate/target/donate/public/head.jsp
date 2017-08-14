<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!--头部代码开始-->
<div class="navbar navbar-fixed-top"
	style="_position: relative;_z-index: 10000;">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> </a>
			<div class="nav-collapse">
				<ul class="nav" id="navID">
					<li class="active"><a href="<%=path%>/index/getIndexMsg"><b>首页</b>
					</a></li>
					<li class=""><a href="<%=path %>/appeal/getAllPerAppeals?page=1"><b>个人求助</b> </a></li>
					<li class=""><a href="<%=path %>/appeal/getAllGyAppeals?page=1"><b>公益项目</b> </a></li>
					<li class=""><a href="<%=path%>/record/getAll"><b>捐款记录</b>
					</a></li>
					<li class=""><a href="<%=path%>/apply/toApply"><b>申请求助</b> </a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
			<ul class="nav pull-right login-none nav-tips">
				<li class="ie6png divider-vertical"
					style="_width: 30px;_height: 40px;_background: url(<%=path%>/images/icons.png) no-repeat 10px -106px;">
					<a class="dropdown-toggle clearfix" href="javascript:;"
					style="padding: 7px 5px;"> <img class="logo-before pull-left"
						<c:if test="${sessionScope.userSession.headPhoto ==null}">src="<%=path%>/images/avatar-icon.png"</c:if>
						<c:if test="${sessionScope.userSession.headPhoto !=null}">src="${sessionScope.userSession.headPhoto}"</c:if> /> </a> 
				</li>
			</ul>
			<div class="popup-div tips-div"
				style="position: absolute;z-index: 10000001;display: none;"></div>
			<script type="text/javascript">
				var tip_show = 1;
				//头部下拉
				var timer1 = "";
				$('#dropdownID-0').hover(function() {
					var obj = $(this);
					if (timer1) {
						clearTimeout(timer1);
					}
					timer1 = setTimeout(function() {
						obj.find('.dropdown-menu').show();
						tip_show = 0;
						$(".tips-div").hide();
						obj.find('.other-icon').css({
							"background" : "#2E2E2E"
						});
					}, 500);
				}, function() {
					var obj = $(this);
					if (timer1) {
						clearTimeout(timer1);
					}
					timer1 = setTimeout(function() {
						obj.find('.dropdown-menu').hide();
						$(".tips-div").hide();
						tip_show = 1;
						getTips();
						obj.find('.other-icon').css({
							"background" : "none"
						});
					}, 500);
				});

				var timer2 = "";
				$('#dropdownID-1').hover(function() {
					var obj = $(this);
					if (timer2) {
						clearTimeout(timer2);
					}
					timer2 = setTimeout(function() {
						obj.find('.dropdown-menu').show();
						tip_show = 0;
						$(".tips-div").hide();
						obj.find('.other-icon').css({
							"background" : "#2E2E2E"
						});
					}, 500);
				}, function() {
					var obj = $(this);
					if (timer2) {
						clearTimeout(timer2);
					}
					timer2 = setTimeout(function() {
						obj.find('.dropdown-menu').hide();
						tip_show = 1;
						getTips();
						$(".tips-div").hide();
						obj.find('.other-icon').css({
							"background" : "none"
						});
					}, 500);
				});
			</script>

			<ul class="nav pull-right pl-20 myul">
				
				<c:if test="${sessionScope.userSession ==null }">
						<li class=""><a href="<%=path%>/user/register">注册</a></li>
						<li class="l10"><a href="<%=path%>/user/login">登录</a></li>
				</c:if>
				<c:if test="${sessionScope.userSession !=null }">
						<li class=""><a href="<%=path%>/homepage/toHomePage">个人中心</a></li>
						<li class="l10"><a href="<%=path%>/homepage/toHomePage">欢迎你，${sessionScope.userSession.userName}</a></li>
						<li class="l10"><a href="<%=path%>/user/exit">注销</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>


<!--头部代码结束-->


