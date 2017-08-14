<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt " %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.sendRedirect(basePath+"index/getIndexMsg");
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
				<a href="/" title="传习在线捐款平台"><img
					src="<%=path%>/images/logo.jpg" class="ie6png"
					style="display: block;" />
				</a>
			</div>
			<!--
    <div class="span11 pull-right top-ad" style="position: relative;_float: right;_height: 80px;_overflow: hidden;"> 
		<a href="javascript:;" class="pull-left" target="_blank" rel="nofollow"> 
			<img alt="" src="<%=path%>/images/img1.jpg" style="width: 100%; display: block;"/>
		</a> 
		<a href="javascript:;" class="pull-left" style="display:none;" target="_blank"> 
			<img alt="" src="<%=path%>/images/img2.jpg" style="width: 100%; display: block;"/> 
		</a>
		<div class="slides-icon-ad slides-ad-point" style="position: absolute;right:60px;"> 
			<a href="javascript:void(0);" class="icon-css-on ie6png">&nbsp;</a> 
			<a href="javascript:void(0);" class="icon-css ie6png">&nbsp;</a> 
		</div>
    </div>
	-->
			<!--搜索-->
			<div class="clearfix">

				<div class="pull-right t-20 classifySearch"
					style="position: relative;">
					<form action="?" method="get" style="margin:0px; padding:0px;"
						id="mmsearchform">
						<input id="search-input" type="text"
							class="search-input pull-left span4" value="" /> <a
							href="javascript:void(0);" title="搜索"
							class="search-btn-css pull-left search-btn"></a>
					</form>
				</div>
			</div>
			<!--搜索结束-->
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			var Interval_control = '';
			var current_index = 0;
			show_pic_ad = function(index) {
				$(".top-ad .pull-left").each(function(i) {
					$(this).hide();
					if (i == index) {

						$(this).show();
					}
				});
			};
			show_point_ad = function(index) {
				$(".top-ad .slides-ad-point a").each(function(i) {
					if ($(this).hasClass("icon-css-on")) {
						$(this).removeClass("icon-css-on");
						$(this).addClass("icon-css");
					}
					if (i == index) {
						if ($(this).hasClass("icon-css")) {
							$(this).removeClass("icon-css");
						}
						$(this).addClass("icon-css-on");
					}
				});
			};
			slides = function() {
				$(".slides-ad-point a").each(function(index) {
					$(this).click(function() {
						current_index = index;
						show_point_ad(index);
						show_pic_ad(current_index);
					});
				});
			};
			slides();
			Interval_control = setInterval(function() {
				show_point_ad(current_index);
				show_pic_ad(current_index);
				if (current_index == ($(".slides-icon-ad a").length - 1)) {
					current_index = -1;
				}
				current_index++;
			}, 5000);//设置自动切换函数
			//当触发mouseenter事件时，取消正在执行的自动切换方法，触发mouseouter事件时重新设置自动切换
			$(".top-ad .pull-left").mouseenter(function() {
				clearInterval(Interval_control);//停止自动切换
			}).mouseleave(function() {
				Interval_control = setInterval(function() {
					show_point_ad(current_index);
					show_pic_ad(current_index);
					if (current_index == ($(".top-ad .pull-left").length - 1)) {
						current_index = -1;
					}
					current_index++;
				}, 5000);//设置自动切换函数
			});
		});
	</script>
	
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
										<a target="_blank" href="javascript:;" title=" "
											rel="bookmark"> <img alt=" "
											src="<%=path%>/images/lunbo1.jpg" /> </a>
									</div>
									<div class="slides-css" style="display:none;">
										<a target="_blank" href="javascript:;" title=" "
											rel="bookmark"> <img alt=" "
											src="<%=path%>/images/lunbo2.jpg" /> </a>
									</div>
									<!--轮播图的小按钮-->
									<div class="slides-icon slides-banner-point">
										<a href="javascript:void(0);" class="icon-css-on ie6png">&nbsp;</a>
										<a href="javascript:void(0);" class="icon-css ie6png">&nbsp;</a>
									</div>
									<!--轮播图的小按钮结束-->
								</div>
								<!--第一组新闻开始-->
								<div class="slides-title slides-banner-title"
									style="display:block">
									<div class="intro">
										<h1 class="t-15">
											<a href="javascript:;" title="标题标题标题标题" rel="bookmark"
												target="_blank"> 标题标题标题标题标题标题1 </a>
										</h1>
									</div>
									<div class="clearfix t-10 related-news"
										style="height:45px; overflow:hidden; position:relative;">
										<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
											内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介容简介内容简介内容简介内容简介内容简介内容简介
										</p>
									</div>
								</div>
								<!--第一组新闻结束-->
								<!--第二组新闻结束-->
								<div class="slides-title slides-banner-title"
									style="display:none;">
									<div class="intro">
										<h1 class="t-15">
											<a href="javascript:;" title="标题标题标题标题" rel="bookmark"
												target="_blank">标题标题标题标题标题标题2</a>
										</h1>
									</div>
									<div class="clearfix t-10 related-news"
										style="height:45px; overflow:hidden; position:relative;">
										<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
											内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									</div>


								</div>
								<!--第二组新闻结束-->
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

													if (current_index == ($(".slides-banner .slides-css a").length - 1)) {
														current_index = -1;
													}

													current_index++;
												}, 8000);//设置自动切换函数

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

																		if (current_index == ($(".slides-banner .slides-css a").length - 1)) {
																			current_index = -1;
																		}

																		current_index++;
																	}, 8000);//设置自动切换函数

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
									<a href="/news.html" title="更多"
										class="more-add ie6png pull-right">&nbsp;</a>
								</h3>
							</div>
							
							<!--第一个开始-->
							<div class="news-list b-30 clearfix">
								<div class="spanm3 pull-left" style="padding-top:7px;">
									<a href="javascript:;" rel="bookmark" title="标题"
										style="display: block;" target="_blank"> <img
										src="<%=path%>/images/y.jpg" /> </a>
								</div>
								<div class="offsetindex3 intro">
									<h1>
										<a href="<%=path%>/record/appeal?appealId=1" title="标题标题标题" rel="bookmark"
											target="_blank"> ${appeal.title }</a>
									</h1>
									<p class="t-5 fc666" style=" margin-bottom:0px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span> <a href="">张三</a>
										</span> <span class="two"><a href="">已筹¥60000</a>
										</span> 2016/03/02
									</div>
									<div class="clearfix">
										<a class="follow-btn pr-10 ie6png news-follow-btn"
											href="javascript:void(0);" title=" " data-id="104423"
											data-type="news">预筹¥80000</a> <a class="read-btn ie6png"
											href="javascript:void(0);" title="370次阅读">已筹¥60000</a>
											<a class="read-all pull-right" style="color:#fff;" href="###">捐款</a>
									</div>
								</div>
							</div>
							<!--第一个结束-->

							<div class="news-list b-30 clearfix">
								<div class="spanm3 pull-left" style="padding-top:7px;">
									<a href="javascript:;" rel="bookmark" title="标题"
										style="display: block;" target="_blank"> <img
										src="<%=path%>/images/y.jpg" /> </a>
								</div>
								<div class="offsetindex3 intro">
									<h1>
										<a href="javascript:;" title="标题标题标题" rel="bookmark"
											target="_blank"> 标题标题标题标题标题标题标题标题 </a>
									</h1>
									<p class="t-5 fc666" style=" margin-bottom:0px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span> <a href="">张三</a>
										</span> <span class="two"><a href="">已筹¥60000</a>
										</span> 2016/03/02
									</div>
									<div class="clearfix">
										<a class="follow-btn pr-10 ie6png news-follow-btn"
											href="javascript:void(0);" title=" " data-id="104423"
											data-type="news">预筹¥80000</a> <a class="read-btn ie6png"
											href="javascript:void(0);" title="370次阅读">已筹¥60000</a>
											<a class="read-all pull-right" style="color:#fff;" href="###">捐款</a>
									</div>
								</div>
							</div>

							<div class="news-list b-30 clearfix">
								<div class="spanm3 pull-left" style="padding-top:7px;">
									<a href="javascript:;" rel="bookmark" title="标题"
										style="display: block;" target="_blank"> <img
										src="<%=path%>/images/y.jpg" /> </a>
								</div>
								<div class="offsetindex3 intro">
									<h1>
										<a href="javascript:;" title="标题标题标题" rel="bookmark"
											target="_blank"> 标题标题标题标题标题标题标题标题 </a>
									</h1>
									<p class="t-5 fc666" style=" margin-bottom:0px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span> <a href="">张三</a>
										</span> <span class="two"><a href="">已筹¥60000</a>
										</span> 2016/03/02
									</div>
									<div class="clearfix">
										<a class="follow-btn pr-10 ie6png news-follow-btn"
											href="javascript:void(0);" title=" " data-id="104423"
											data-type="news">预筹¥80000</a> <a class="read-btn ie6png"
											href="javascript:void(0);" title="370次阅读">已筹¥60000</a>
											<a class="read-all pull-right" style="color:#fff;" href="###">捐款</a>
									</div>
								</div>
							</div>

							<div class="news-list b-30 clearfix">
								<div class="spanm3 pull-left" style="padding-top:7px;">
									<a href="javascript:;" rel="bookmark" title="标题"
										style="display: block;" target="_blank"> <img
										src="<%=path%>/images/y.jpg" /> </a>
								</div>
								<div class="offsetindex3 intro">
									<h1>
										<a href="javascript:;" title="标题标题标题" rel="bookmark"
											target="_blank"> 标题标题标题标题标题标题标题标题 </a>
									</h1>
									<p class="t-5 fc666" style=" margin-bottom:0px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span> <a href="">张三</a>
										</span> <span class="two"><a href="">已筹¥60000</a>
										</span> 2016/03/02
									</div>
									<div class="clearfix">
										<a class="follow-btn pr-10 ie6png news-follow-btn"
											href="javascript:void(0);" title=" " data-id="104423"
											data-type="news">预筹¥80000</a> <a class="read-btn ie6png"
											href="javascript:void(0);" title="370次阅读">已筹¥60000</a>
									</div>
								</div>
							</div>



						</div>
					</div>
				</div>


				<div class="span5">
					<div class="label-div t-20 border-all">

						<div class="l-15 mmtop">
							<h3 class="label-title border-b small clearfix"
								style="padding-bottom: 14px; margin-bottom:14px;">
								<a href="javascript:;" title="系统公告" class="pull-left r-10">系统公告</a>
								<a href="/topic.html" title="更多"
									class="more-add ie6png pull-right">&nbsp;</a>
							</h3>
						</div>

						<div class="label-main">
							<!--内容介绍第一个-->
							<div class="topic-list b-45">
								<div class="clearfix">
									<div class="span1 pull-left">
										<a href="javascript:;" rel="bookmark" title="标题标题标题标题1"
											target="_blank"> <img class="lazyloadimg" alt="标题标题"
											src="<%=path%>/images/i2.jpg" /> </a>
									</div>
									<div class="offset1 intro">
										<h1>
											<a href="javascript:;" title="标题" rel="bookmark"
												target="_blank">${pageBean.datas.get(pageBean.datas.size()-1).title}</a>
										</h1>
									</div>
								</div>
								<div class="intro l-20">
									<p class="t-15 fc666 mmbuttom">
										${pageBean.datas.get(pageBean.datas.size()-1).content}</p>
									<div class="clearfix">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="1人关注"><fmt:formatDate value="${pageBean.datas.get(pageBean.datas.size()-1).createDate}" type="both"/></a> <a class="read-btn ie6png"
											href="javascript:void(0);" title="277次浏览">详情</a>
									</div>
								</div>
							</div>
							<!--内容介绍第一个结束-->

						</div>
					</div>


					<div class="label-div t-20 border-all">

						<div class="l-15 mmtop">
							<h3 class="label-title border-b small clearfix"
								style="padding-bottom: 14px; margin-bottom:14px;">
								<a href="javascript:;" title="最新捐款" class="pull-left r-10">最新捐款</a>
								<a href="/topic.html" title="更多"
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

								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>

								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>

								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>

								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>

								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>

								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>


								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>


								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>

								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>

								<tr>
									<td>张三</td>
									<td>李四</td>
									<td>¥600</td>
									<td>2013-03-02</td>
								</tr>
							</table>
						</div>
					</div>


					<div class="label-div t-20 border-all">

						<div class="l-15 mmtop">
							<h3 class="label-title border-b small clearfix"
								style="padding-bottom: 14px; margin-bottom:14px;">
								<a href="javascript:;" title="最新捐款排行" class="pull-left r-10">最新捐款排行</a>
								<a href="/topic.html" title="更多"
									class="more-add ie6png pull-right">&nbsp;</a>
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

								<tr>
									<td>1</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>

								<tr>
									<td>2</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>

								<tr>
									<td>3</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>

								<tr>
									<td>4</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>


								<tr>
									<td>5</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>

								<tr>
									<td>6</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>

								<tr>
									<td>7</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>

								<tr>
									<td>8</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>

								<tr>
									<td>9</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>


								<tr>
									<td>10</td>
									<td>张三</td>
									<td>男</td>
									<td>¥60000</td>
									<td>2016-08-02</td>
								</tr>


							</table>
						</div>
					</div>


				</div>


				<!--项目展示-->
				<div class="span15">
					<div class="label-div t-30 border-all">
						<div class="l-15">
							<h3 class="label-title border-b b-15 small clearfix"
								style="padding-bottom: 14px;">
								<a href="/talk.html" title=" " class="pull-left r-10">个人求助</a> <a
									href="javascript:;" title="更多"
									class="more-add ie6png pull-right">&nbsp;</a>
							</h3>
						</div>
						<div class="label-main clearfix" style="padding-left: 16px;">

							<div class="clearfix">

								<!--项目展示第一个--->
								<div class="video-list b-30 pull-left pr-20">
									<div class="clearfix">
										<div class="video-img">
											<a href="javascript:;" title="标题" target="_blank"
												rel="bookmark"> <img class="lazyloadimg"
												src="<%=path%>/images/x1.jpg" alt="标题标题" /> </a>
										</div>
									</div>
									<div style="margin-top: 8px;">
										<h1>
											<a href="javascript:;" title="标题标题标题" rel="bookmark"
												target="_blank">标题标题标题</a>
										</h1>
									</div>
									<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span><a href="">张三</a>
										</span> <span class="two"><a href="">¥60000</a>
										</span>2013/03/02
									</div>
									<div class="clearfix t-10">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="">预筹¥60000</a> <a class="watch-btn ie6png"
											href="javascript:void(0);" title="">已筹¥60000</a>
									</div>
								</div>
								<!--项目展示第一个结束--->


								<div class="video-list b-30 pull-left pr-20">
									<div class="clearfix">
										<div class="video-img">
											<a href="javascript:;" title="标题" target="_blank"
												rel="bookmark"> <img class="lazyloadimg"
												src="<%=path%>/images/x1.jpg" alt="标题标题" /> </a>
										</div>
									</div>
									<div style="margin-top: 8px;">
										<h1>
											<a href="javascript:;" title="标题标题标题" rel="bookmark"
												target="_blank">标题标题标题</a>
										</h1>
									</div>
									<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span><a href="">张三</a>
										</span> <span class="two"><a href="">¥60000</a>
										</span>2013/03/02
									</div>
									<div class="clearfix t-10">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="">预筹¥60000</a> <a class="watch-btn ie6png"
											href="javascript:void(0);" title="">已筹¥60000</a>
									</div>
								</div>


								<div class="video-list b-30 pull-left pr-20">
									<div class="clearfix">
										<div class="video-img">
											<a href="javascript:;" title="标题" target="_blank"
												rel="bookmark"> <img class="lazyloadimg"
												src="<%=path%>/images/x1.jpg" alt="标题标题" /> </a>
										</div>
									</div>
									<div style="margin-top: 8px;">
										<h1>
											<a href="javascript:;" title="标题标题标题" rel="bookmark"
												target="_blank">标题标题标题</a>
										</h1>
									</div>
									<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span><a href="">张三</a>
										</span> <span class="two"><a href="">¥60000</a>
										</span>2013/03/02
									</div>
									<div class="clearfix t-10">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="">预筹¥60000</a> <a class="watch-btn ie6png"
											href="javascript:void(0);" title="">已筹¥60000</a>
									</div>
								</div>



								<div class="video-list b-30 pull-left ">
									<div class="clearfix">
										<div class="video-img">
											<a href="javascript:;" title="标题" target="_blank"
												rel="bookmark"> <img class="lazyloadimg"
												src="<%=path%>/images/x1.jpg" alt="标题标题" /> </a>
										</div>
									</div>
									<div style="margin-top: 8px;">
										<h1>
											<a href="javascript:;" title="标题标题标题" rel="bookmark"
												target="_blank">标题标题标题</a>
										</h1>
									</div>
									<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span><a href="">张三</a>
										</span> <span class="two"><a href="">¥60000</a>
										</span>2013/03/02
									</div>
									<div class="clearfix t-10">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="">预筹¥60000</a> <a class="watch-btn ie6png"
											href="javascript:void(0);" title="">已筹¥60000</a>
									</div>
								</div>
							</div>


							<div class="clearfix">

								<!--项目展示第一个--->
								<div class="video-list b-30 pull-left pr-20">
									<div class="clearfix">
										<div class="video-img">
											<a href="javascript:;" title="标题" target="_blank"
												rel="bookmark"> <img class="lazyloadimg"
												src="<%=path%>/images/x1.jpg" alt="标题标题" /> </a>
										</div>
									</div>
									<div style="margin-top: 8px;">
										<h1>
											<a href="javascript:;" title="标题标题标题" rel="bookmark"
												target="_blank">标题标题标题</a>
										</h1>
									</div>
									<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span><a href="">张三</a>
										</span> <span class="two"><a href="">¥60000</a>
										</span>2013/03/02
									</div>
									<div class="clearfix t-10">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="">预筹¥60000</a> <a class="watch-btn ie6png"
											href="javascript:void(0);" title="">已筹¥60000</a>
									</div>
								</div>
								<!--项目展示第一个结束--->


								<div class="video-list b-30 pull-left pr-20">
									<div class="clearfix">
										<div class="video-img">
											<a href="javascript:;" title="标题" target="_blank"
												rel="bookmark"> <img class="lazyloadimg"
												src="<%=path%>/images/x1.jpg" alt="标题标题" /> </a>
										</div>
									</div>
									<div style="margin-top: 8px;">
										<h1>
											<a href="javascript:;" title="标题标题标题" rel="bookmark"
												target="_blank">标题标题标题</a>
										</h1>
									</div>
									<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span><a href="">张三</a>
										</span> <span class="two"><a href="">¥60000</a>
										</span>2013/03/02
									</div>
									<div class="clearfix t-10">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="">预筹¥60000</a> <a class="watch-btn ie6png"
											href="javascript:void(0);" title="">已筹¥60000</a>
									</div>
								</div>


								<div class="video-list b-30 pull-left pr-20">
									<div class="clearfix">
										<div class="video-img">
											<a href="javascript:;" title="标题" target="_blank"
												rel="bookmark"> <img class="lazyloadimg"
												src="<%=path%>/images/x1.jpg" alt="标题标题" /> </a>
										</div>
									</div>
									<div style="margin-top: 8px;">
										<h1>
											<a href="javascript:;" title="标题标题标题" rel="bookmark"
												target="_blank">标题标题标题</a>
										</h1>
									</div>
									<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span><a href="">张三</a>
										</span> <span class="two"><a href="">¥60000</a>
										</span>2013/03/02
									</div>
									<div class="clearfix t-10">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="">预筹¥60000</a> <a class="watch-btn ie6png"
											href="javascript:void(0);" title="">已筹¥60000</a>
									</div>
								</div>



								<div class="video-list b-30 pull-left ">
									<div class="clearfix">
										<div class="video-img">
											<a href="javascript:;" title="标题" target="_blank"
												rel="bookmark"> <img class="lazyloadimg"
												src="<%=path%>/images/x1.jpg" alt="标题标题" /> </a>
										</div>
									</div>
									<div style="margin-top: 8px;">
										<h1>
											<a href="javascript:;" title="标题标题标题" rel="bookmark"
												target="_blank">标题标题标题</a>
										</h1>
									</div>
									<p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
										内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
									<div class="myxm">
										<span><a href="">张三</a>
										</span> <span class="two"><a href="">¥60000</a>
										</span>2013/03/02
									</div>
									<div class="clearfix t-10">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="">预筹¥60000</a> <a class="watch-btn ie6png"
											href="javascript:void(0);" title="">已筹¥60000</a>
									</div>
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
	</div>
	
	<jsp:include page="/public/footer.jsp"></jsp:include>
</body>
</html>

