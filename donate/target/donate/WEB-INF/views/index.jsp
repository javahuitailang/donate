<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<title>传习在线捐款平台</title>
<meta name="Keywords" content="  " />
<meta name="Description" content=" " />
<!-- Le styles -->
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/index.css" />
<script type="text/javascript" src="<%=path%>/js/bioV4.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery.lazyload.mini.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/comment.css" />
<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js"></script>
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

	<jsp:include page="/public/head.jsp"></jsp:include>

	<div class="top-div">
		<div class="container clearfix">
			<div class="span3 logo-div logo-img" style="margin-left:0px;">
				<a href="#" title="传习在线捐款平台"><img
					src="<%=path%>/images/heartlogo.jpg" class="ie6png"
					style="display: block;" /> </a>
			</div>

			<!--搜索-->
			<div class="clearfix">

				<div class="pull-right t-20 classifySearch"
					style="position: relative;">
					<form action="<%=path%>/appeal/getAppealList" method="get"
						style="margin:0px; padding:0px;" id="mmsearchform"  name="reqForm">
						<input id="search-input" type="text" name="title"
							class="search-input pull-left span4"  value="${title }" /> <a
							id="keysearch" href="javascript:document.reqForm.submit();" title="搜索"
							class="search-btn-css pull-left search-btn"></a>
					</form>
				</div>
			</div>
			<!--搜索结束-->
		</div>
	</div>


	<!--头部代码结束-->
	<div class="hr tp-div-nexthr"
		style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
	<div class="container pb-15">
		<!-- Example row of columns -->
		<div class="row home-index">
			<div class="span18">
				<div class="span10">
					<div class="label-div t-20 border-all">
						<div class="l-15"></div>
						<div class="label-main">
							<div class="news-slides b-15 l-15">
								<div class="slides-list slides-banner">
									<div class="slides-css" style="display:block;">
										<!-- 	<a target="_blank" href="javascript:;" title="标题标题"
											rel="bookmark"> -->
										<img alt=" " src="<%=path%>/images/lun01.jpg" />
										<!-- </a> -->
									</div>
									<div class="slides-css" style="display:none;">
										<!-- 	<a target="_blank" href="javascript:;" title="标题标题"
											rel="bookmark">  -->
										<img alt=" " src="<%=path%>/images/lunbo3.jpg" />
										<!-- </a> -->
									</div>

									<!--轮播图的小按钮-->
									<div class="slides-icon slides-banner-point">
										<a href="javascript:void(0);" class="icon-css-on ie6png">&nbsp;</a>
										<a href="javascript:void(0);" class="icon-css ie6png">&nbsp;</a>

									</div>
									<!--轮播图的小按钮结束-->
								</div>


								<script type="text/javascript">

									$(function() {
										var Interval_control = '';
										var current_index = 0;
										$(".slides-banner .slides-css").hide();
										$(".slides-banner .slides-css:first")
												.show();
										$(".slides-banner-title").hide();
										$(".slides-banner-title:first").show();

										show_pic = function(index) {
											$(".slides-css").each(function(i) {
												$(this).hide();
												if (i == index) {
													$(this).show();
												}
											});
										};

										show_content = function(index) {
											$(".slides-banner-title").each(
													function(i) {
														$(this).hide();
														if (i == index) {
															$(this).show();
														}
													});
										};
										show_point = function(index) {
											$(".slides-banner-point a")
													.each(
															function(i) {
																if ($(this)
																		.hasClass(
																				"icon-css-on")) {
																	$(this)
																			.removeClass(
																					"icon-css-on");
																	$(this)
																			.addClass(
																					"icon-css");
																}
																if (i == index) {
																	if ($(this)
																			.hasClass(
																					"icon-css")) {

																		$(this)
																				.removeClass(
																						"icon-css");
																	}
																	$(this)
																			.addClass(
																					"icon-css-on");
																}
															});
										};

										slides = function() {
											$(".slides-icon a")
													.each(
															function(index) {
																$(this)
																		.click(
																				function() {
																					current_index = index;
																					show_point(index);
																					show_content(current_index);
																					show_pic(current_index);
																				});
															});
										};
										slides();

										Interval_control = setInterval(
												function() {
													show_point(current_index);
													show_content(current_index);
													show_pic(current_index);
													if (current_index == ($(".slides-banner .slides-css img").length - 1)) {
														current_index = -1;
													}
													current_index++;
												}, 5000);//设置自动切换函数
										//当触发mouseenter事件时，取消正在执行的自动切换方法，触发mouseouter事件时重新设置自动切换
										$(
												".slides-banner .slides-css,.slides-banner-title")
												.mouseenter(
														function() {
															clearInterval(Interval_control);//停止自动切换
														})
												.mouseleave(
														function() {
															Interval_control = setInterval(
																	function() {
																		show_point(current_index);
																		show_content(current_index);
																		show_pic(current_index);
																		if (current_index == ($(".slides-banner .slides-css img").length - 1)) {
																			current_index = -1;
																		}
																		current_index++;
																	}, 5000);//设置自动切换函数
														});
									});
								</script>
							</div>

							<!--图文解说开始-->
							<div class="hr l-15 t-15 b-20"></div>

							<div class="l-15">
								<h3 class="label-title border-b b-15 small clearfix"
									style="padding-bottom: 14px;">
									<a href="javascript:;" title="公益项目" class="pull-left r-10">公益项目</a>
									<a href="<%=path%>/appeal/getAllGyAppeals?page=1" title="更多"
										class="more-add ie6png pull-right">&nbsp;</a>
								</h3>
							</div>



							<c:forEach items="${gyAppeals }" var="gyAppeal">

								<div class="news-list b-30 clearfix">
									<div class="spanm3 pull-left" style="padding-top:7px;">
										<a href="<%=path%>/record/appeal?appealId=${gyAppeal.id }" rel="bookmark" title=" ${datas.title }"
											style="display: block;" target="_blank"> <img
											src="<%=path%>/images/heart.jpg" /> </a>
									</div>
									<div class="offsetindex3 intro">
										<h1>
											<a href="<%=path%>/record/appeal?appealId=${gyAppeal.id }"
												title=" ${gyAppeal.title }" rel="bookmark" target="_blank">
												${gyAppeal.title } </a>
										</h1>
										<p class="t-5 fc666" style=" margin-bottom:0px;">
											<c:choose>
												<c:when test="${fn:length(gyAppeal.content)>200 }">
												${fn:substring(gyAppeal.content,0,200) }...
										</c:when>
												<c:otherwise>
												${gyAppeal.content } 
										</c:otherwise>
											</c:choose>
										</p>
										<div class="myxm">
											<span> <a href="">${gyAppeal.recipient.userName }</a>
											</span> <span class="two"><a href="">已筹${gyAppeal.holdMoney
													}</a> </span>
											<fmt:formatDate value="${gyAppeal.updateDate}"
												dateStyle="default" />
										</div>
										<div class="clearfix">
											<a class="follow-btn pr-10 ie6png news-follow-btn"
												href="javascript:void(0);" title=" " data-id="104423"
												data-type="news">预筹${gyAppeal.goalMoney }</a> <a
												class="read-btn ie6png" href="javascript:void(0);"
												title="370次阅读">已筹${gyAppeal.holdMoney }</a>
										</div>
									</div>
								</div>

							</c:forEach>

						</div>
					</div>
				</div>


				<div class="span5">
					<div class="label-div t-20 border-all">

						<div class="l-15 mmtop">
							<h3 class="label-title border-b small clearfix"
								style="padding-bottom: 14px; margin-bottom:14px;">
								<a href="javascript:;" title="系统公告" class="pull-left r-10">系统公告</a>
								<a href="<%=path%>/bulletin/getBulletins?page=1" title="更多"
									class="more-add ie6png pull-right">&nbsp;</a>
							</h3>
						</div>

						<div class="label-main">
							<c:if test="${bulletin.size()>=1 }">
								<!--内容介绍第一个-->
								<div class="topic-list b-45">
									<div class="clearfix">
										<div class="span1 pull-left">
											<a href="javascript:;" rel="bookmark"
												title="${bulletin.get(bulletin.size()-1).title}"
												target="_blank"> <img class="lazyloadimg"
												alt="${bulletin.get(bulletin.size()-1).title}"
												src="<%=path%>/images/bulletin.jpg" /> </a>
										</div>
										<div class="offset1 intro">
											<h1>
												<a href="javascript:;"
													title="${bulletin.get(bulletin.size()-1).title}"
													rel="bookmark" target="_blank">${bulletin.get(bulletin.size()-1).title}</a>
											</h1>
										</div>
									</div>
									<div class="intro l-20">
										<c:choose>
											<c:when
												test="${fn:length(bulletin.get(bulletin.size()-1).content)>50 }">
												<p class="t-15 fc666 mmbuttom">
													${bulletin.get(bulletin.size()-1).content.substring(0,50)}...</p>
											</c:when>
											<c:otherwise>
												<p class="t-15 fc666 mmbuttom">
													${bulletin.get(bulletin.size()-1).content}</p>
											</c:otherwise>
										</c:choose>
										<div class="clearfix">
											<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
												title="1人关注"><fmt:formatDate
													value="${bulletin.get(bulletin.size()-1).createDate}"
													type="both" /> </a>
										</div>
									</div>
								</div>
								<!--内容介绍第一个结束-->
							</c:if>


						</div>
					</div>


					<div class="label-div t-20 border-all">

						<div class="l-15 mmtop">
							<h3 class="label-title border-b small clearfix"
								style="padding-bottom: 14px; margin-bottom:14px;">
								<a href="javascript:;" title="最新捐款" class="pull-left r-10">最新捐款</a>
								<a href="<%=path%>/record/getAll" title="更多"
									class="more-add ie6png pull-right">&nbsp;</a>
							</h3>
						</div>

						<div class="label-main">

							<table class="mytable" cellpadding="0" cellspacing="0">
								<tr>
									<th>捐赠人</th>
									<th>捐赠对象</th>
									<th>捐赠金额</th>
									<th>捐赠时间</th>
								</tr>
								<c:forEach items="${donorRecords.datas }" var="donorRecord">
									<tr>
										<td>${donorRecord.donor.realName }</td>
										<td>${donorRecord.appeal.recipient.realName }</td>
										<td>${donorRecord.donorMoney }</td>
										<td><fmt:formatDate value="${donorRecord.donorDate }"
												dateStyle="default" /></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>


					<div class="label-div t-20 border-all">

						<div class="l-15 mmtop">
							<h3 class="label-title border-b small clearfix"
								style="padding-bottom: 14px; margin-bottom:14px;">
								<a href="javascript:;" title="最新捐款排行" class="pull-left r-10">最新捐款排行</a>

							</h3>
						</div>

						<div class="label-main">

							<table class="mytable" cellpadding="0" cellspacing="0">
								<tr>
									<th>排行</th>
									<th>用户名</th>
									<th>性别</th>
									<th>捐赠总金额</th>
									<th>最近捐款时间</th>
								</tr>

								<c:forEach items="${donateRanking.datas }" var="ranking"
									varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>${ranking.realName }</td>
										<td>${ranking.sex==0?"女":"男" }</td>
										<td>${ranking.totalMoney }</td>
										<td><fmt:formatDate value="${ranking.donorDate }"
												dateStyle="default" /></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>


				</div>


				<!--个人求助-->
				<div class="span15">
					<div class="label-div t-30 border-all">
						<div class="l-15">
							<h3 class="label-title border-b b-15 small clearfix"
								style="padding-bottom: 14px;">
								<a href="/talk.html" title=" " class="pull-left r-10">个人求助</a> <a
									href="<%=path%>/appeal/getAllPerAppeals?page=1" title="更多"
									class="more-add ie6png pull-right">&nbsp;</a>
							</h3>
						</div>
						<div class="label-main clearfix" style="padding-left: 16px;">

							<div class="clearfix">

								<c:forEach items="${perAppeals }" var="perAppeal">
									<!--个人求助第一个--->
									<div class="video-list b-34 pull-left pr-20">
										<div class="clearfix">
											<div class="video-img">
												<a href="<%=path%>/record/appeal?appealId=${perAppeal.id}" title="${perAppeal.title }"
													target="_blank" rel="bookmark"> <img
													class="lazyloadimg" src="<%=path%>/images/grheart.jpg"
													alt="${perAppeal.title}" /> </a>
											</div>
										</div>
										<div style="margin-top: 8px;">
											<h1>
												<a href="<%=path%>/record/appeal?appealId=${perAppeal.id }"
													title="${perAppeal.title }" rel="bookmark" target="_blank">${perAppeal.title
													}</a>
											</h1>
										</div>

										<c:choose>
											<c:when test="${fn:length(perAppeal.content)>30 }">
												<p class="fc666 t-5"
													style=" margin-bottom:0px; height:50px;">
													${fn:substring(perAppeal.content,0,30) }...</p>
											</c:when>
											<c:otherwise>
												<p class="fc666 t-5"
													style=" margin-bottom:0px; height:50px;">
													${perAppeal.content }</p>
											</c:otherwise>
										</c:choose>
										<div class="myxm">
											<span><a href="">${perAppeal.recipient.userName }</a>
											</span> <span class="two"><a href="">${perAppeal.goalMoney
													}</a> </span>
											<fmt:formatDate value="${perAppeal.updateDate }"
												dateStyle="default" />
										</div>
										<div class="clearfix t-10">
											<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
												title="">预筹${perAppeal.goalMoney }</a> <a
												class="watch-btn ie6png" href="javascript:void(0);" title="">已筹${perAppeal.holdMoney
												}</a>
										</div>
									</div>
									<!--项目展示第一个结束-->
								</c:forEach>
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
	</div>

	<jsp:include page="/public/footer.jsp"></jsp:include>
</body>
</html>
