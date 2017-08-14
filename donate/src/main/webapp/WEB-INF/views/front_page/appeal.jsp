<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript" src="<%=path%>/js/bioV4.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery.lazyload.mini.js"></script>
<title>个人求助详情页</title>
<meta name="Keywords" content="个人求助详情页" />
<meta name="Description" content="个人求助详情页" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/zx_info.css" />
<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<script type="text/javascript" src="<%=path%>/js/zx_info.js"></script>

<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]-->
<script type="text/javascript">
  	function _change() {
  		var select = document.getElementById("select");
 		location = "<%=basePath%>
	record/${pageBean.url}?appealId=${appealId }&pageCurrent="
				+ select.value;
	}
</script>
</head>
<body>
	<script type="text/javascript" src="<%=path%>/js/borsertocss.js">
		
	</script>
	<!-- 判断在IE9以下浏览器中根据像素的不同而设置的样式 -->

	<jsp:include page="/public/head.jsp"></jsp:include>

	<div class="top-div">
		<div class="container clearfix">
			<div class="span3 logo-div logo-img" style="margin-left:0px;">
				<a href="/" title=" "><img src="<%=path%>/images/heartlogo.jpg"
					class="ie6png" style="display: block;" /> </a>
			</div>
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
		<div class="row">
			<div class="span12">
				<!--内容页面-->
				<div class="label-div b-30 border-all pt-5 t-20"
					style="position: relative; padding-left: 0;">
					<div class="mmdh pull-left">
						<a href="">首页</a> > <a href="">求助信息</a> > <a href="">${appeal.appealType==1?'公益项目':'个人求助'
							}</a>
					</div>

					<div class="mmclear"></div>
					<div style="margin-top: 14px;" class="clearfix pb-12 pl-25 pr-25">
						<h1 class="pull-left r-10">${appeal.title }</h1>

						<c:if test="${appeal.appealState == 1}">
							<form action="<%=basePath%>record/pay" name="reqForm">
								<input type="hidden" name="appealId" value="${appealId }" />
								<div class="pull-left pt-5 none-768"
									style="_margin-top:-33px; _margin-left:-10px;">
									<span class="like-plug-gz clearfix pull-left r-15"> <a
										title="感兴趣，关注一下吧" href="javascript:document.reqForm.submit();"
										class="like-btn pull-right ie6png">我要捐款</a> <span
										class="count pull-left t-5 d-none"></span> </span> 金额:<input
										type="text" name="price_t" value="" style="width:50px" />元
								</div>
							</form>
						</c:if>
						<c:if test="${appeal.appealState == 3}">
							<div class="pull-left pt-5 none-768"
								style="_margin-top:-33px; _margin-left:-10px;">
								<span class="like-plug-gz clearfix pull-left r-15"> <a
									title="感兴趣，关注一下吧" href="javascript:void(0);"
									class="like-btn pull-right ie6png">项目下线</a> <span
									class="count pull-left t-5 d-none"></span> </span>
							</div>

						</c:if>

						<font color="red">${error }</font>
					</div>
					<div style="margin-top: 4px;" class="clearfix pl-25 pr-25">
						<div class="pull-left">
							<span class="r-15 pull-left"> <span class="fc999 l-5">更新时间：<fmt:formatDate
										value="${appeal.updateDate }" type="both" /> </span> </span> <span
								class="r-15 pull-left"> <span class="fc999 l-5">更新管理员：${appeal.updateUser.userName
									}</span> </span> <span class="fc999 l-20 pull-left">捐赠对象： <span
								data-obj="News" data-oid="104437" id="obj_hits" class="fc999">${appeal.recipient.realName
									}</span> </span>
						</div>
					</div>
					<div class="view-main t-20 pl-25 pr-25">
						<table style="width: 100%;" class="fc333 border-all">
							<tbody>
								<tr>
									<td
										style="padding: 5px 12px;width: 25px;font-size: 22px;text-align: center;background: #E8E8E8; line-height: 30px;color: #999">简介</td>
									<c:choose>
										<c:when test="${fn:length(appeal.content)>30 }">
											<td style="padding: 10px 10px 12px;line-height: 24px;">${appeal.content.substring(0,30)
												}</td>
										</c:when>
										<c:otherwise>
											<td style="padding: 10px 10px 12px;line-height: 24px;">${appeal.content
												}</td>
										</c:otherwise>
									</c:choose>

								</tr>
							</tbody>
						</table>
						<div class="view-content" style="margin-top: 18px;">
							<p>${appeal.content }</p>
						</div>
					</div>
					<!--警告：切勿删除-->
					<!--[if IE 6]> <a class="follow-btn ie6png mmmzw"></a><![endif]-->
				</div>
				<div id="comment_div"
					class="t-10 label-div border-all pr-20 pt-50 pl-20">
					<div class="l-15 mmtop">
						<h3 class="label-title border-b small clearfix"
							style="padding-bottom: 14px; margin-bottom:14px;">
							<a href="javascript:;" title="已捐款用户" class="pull-left r-10">已捐款用户</a>
						</h3>
					</div>
					<ul class="comments-list clearfix">
						<table class="mytable" cellpadding="0" cellspacing="0">
							<tr>
								<th>捐赠人</th>
								<th>性别</th>
								<th>捐赠金额</th>
								<th>受捐用户</th>
								<th>捐赠项目</th>
								<th>捐赠时间</th>
							</tr>
							<c:forEach items="${pageBean.datas }" var="datas">
								<tr>
									<td><a href="<%=path%>/record/user/${datas.donor.id}">${datas.donor.realName
											}</a></td>
									<td><c:if test="${datas.donor.sex eq 0}">女</c:if> <c:if
											test="${datas.donor.sex eq 1}">男</c:if>
									</td>
									<td>¥${datas.donorMoney }</td>
									<td><a
										href="<%=path%>/record/user/${datas.appeal.recipient.id}">${datas.appeal.recipient.realName}</a>
									</td>
									<td><a href="<%=path%>/record/user/${datas.appeal.id}">${datas.appeal.title}</a>
									</td>
									<td><fmt:formatDate value="${datas.donorDate }"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</table>
					</ul>
					<div class="pagination center pagination-large pt-20">
						<ul id="yw1" class="yiiPager">
							<li class="page"><a
								href="<%=basePath%>record/${pageBean.url}?pageCurrent=1&appealId=${appealId}">首页</a>
							</li>
							<li class="page"><a
								href="<%=basePath%>record/${pageBean.url}?pageCurrent=${pageBean.pageCurrent-1}&appealId=${appealId}">上一页</a>
							</li>
							<li class="page"><a
								href="<%=basePath%>record/${pageBean.url}?pageCurrent=${pageBean.pageCurrent+1}&appealId=${appealId}">下一页</a>
							</li>
							<li class="page"><a
								href="<%=basePath%>record/${pageBean.url}?pageCurrent=${pageBean.totalPage}&appealId=${appealId}">尾页</a>
							</li>
							<li class="page">&nbsp;&nbsp;第 <select name="pageCurrent"
								onchange="_change()" id="select" style="width:50px">
									<c:forEach begin="1" end="${pageBean.totalPage }" var="i">
										<option value="${i }"
											<c:if test="${i eq pageBean.pageCurrent }">selected="selected"</c:if>>${i
											}</option>
									</c:forEach>
							</select> 页/共${pageBean.totalPage }页,共${pageBean.recordCount }条记录</li>
						</ul>
					</div>
				</div>
			</div>
			<!--右侧代码-->
			<div class="span4">
				<div class="label-div t-20 border-all">
					<div class="l-15">
						<h3 class="label-title border-b b-15 small clearfix"
							style="padding-bottom: 14px;">推荐求助</h3>
					</div>
					<div class="label-main tody-hot l-15">
						<c:forEach items="${appealHeader }" var="appeal">
							<div class="topic-list b-45">
								<div class="clearfix">
									<div class="span1 pull-left">
										<a href="javascript:;" rel="bookmark" title="${appeal.title }"
											target="_blank"> <img class="lazyloadimg"
											alt="${appeal.title }" src="<%=path%>/images/i2.jpg" /> </a>
									</div>
									<div class="offset1 intro">
										<h1>
											<a href="javascript:;" title="${appeal.title }"
												rel="bookmark" target="_blank">${appeal.title }</a>
										</h1>
									</div>
								</div>
								<div class="intro l-20">
									<c:choose>
										<c:when test="${fn:length(appeal.content)>40 }">
											<p class="t-15 fc666 mmbuttom">${appeal.content.substring(0,40)
												}...</p>
										</c:when>
										<c:otherwise>
											<p class="t-15 fc666 mmbuttom">${appeal.content }</p>
										</c:otherwise>
									</c:choose>

									<div class="myxm">
										<span> <a href="">${appeal.recipient.realName }</a> </span> <span
											class="two"><a href="">已筹¥${appeal.holdMoney }</a> </span>
										<fmt:formatDate value="${appeal.updateDate }"
											dateStyle="default" />
									</div>
									<div class="clearfix">
										<div class="clearfix">
											<a class="follow-btn pr-10 ie6png news-follow-btn"
												href="javascript:void(0);" title=" " data-id="104423"
												data-type="news">预筹¥${appeal.goalMoney }</a> <a
												class="read-btn ie6png" href="javascript:void(0);"
												title="370次阅读">已筹¥${appeal.holdMoney }</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="label-div t-20 border-all">
					<div class="l-15">
						<h3 class="label-title border-b b-15 small clearfix"
							style="padding-bottom: 14px;">热门捐款</h3>
					</div>
					<div class="label-main tody-hot l-15">
						<c:forEach items="${appealHeader }" var="appeal">
							<div class="topic-list b-45">
								<div class="clearfix">
									<div class="span1 pull-left">
										<a href="javascript:;" rel="bookmark" title="${appeal.title }"
											target="_blank"> <img class="lazyloadimg"
											alt="${appeal.title }" src="<%=path%>/images/i2.jpg" /> </a>
									</div>
									<div class="offset1 intro">
										<h1>
											<a href="javascript:;" title="${appeal.title }"
												rel="bookmark" target="_blank">${appeal.title }</a>
										</h1>
									</div>
								</div>
								<div class="intro l-20">
									<c:choose>
										<c:when test="${fn:length(appeal.content)>40 }">
											<p class="t-15 fc666 mmbuttom">${appeal.content.substring(0,40)
												}...</p>
										</c:when>
										<c:otherwise>
											<p class="t-15 fc666 mmbuttom">${appeal.content }</p>
										</c:otherwise>
									</c:choose>

									<div class="myxm">
										<span> <a href="">${appeal.recipient.realName }</a> </span> <span
											class="two"><a href="">已筹¥${appeal.holdMoney }</a> </span>
										<fmt:formatDate value="${appeal.updateDate }"
											dateStyle="default" />
									</div>
									<div class="clearfix">
										<div class="clearfix">
											<a class="follow-btn pr-10 ie6png news-follow-btn"
												href="javascript:void(0);" title=" " data-id="104423"
												data-type="news">预筹¥${appeal.goalMoney }</a> <a
												class="read-btn ie6png" href="javascript:void(0);"
												title="370次阅读">已筹¥${appeal.holdMoney }</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--右侧代码结束-->
	<!-- /container -->
	<div class="container">
		<div class="hr"></div>
	</div>
	<!-- /container -->
	</div>

	<jsp:include page="/public/footer.jsp"></jsp:include>
</body>
</html>
