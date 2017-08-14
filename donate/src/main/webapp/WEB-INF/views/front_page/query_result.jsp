<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script type="text/javascript">
	function _change() {
		var select = document.getElementById("select");
		location = "?page=" + select.value;
	}
</script>
<title>查询结果页</title>
<meta name="Keywords" content="查询结果页" />
<meta name="Description" content="查询结果页" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/xmdata.css" />
<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<script type="text/javascript" src="<%=path%>/js/xmdata.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js?v=20130220"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]-->
</head>
<body>
	<script type="text/javascript" src="<%=path%>/js/borsertocss.js">
		
	</script>
	<!-- 判断在IE9以下浏览器中根据像素的不同而设置的样式 -->
	<!--头部代码开始-->
	<jsp:include page="/public/head.jsp"></jsp:include>

	<!--头部代码结束-->
	<div class="hr tp-div-nexthr"
		style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
	<div class="container pb-15">
		<!-- Example row of columns -->
		<div class="row">
			<div class="span14">
				<!--搜索-->
				<div class="clearfix">
					<div class="pull-left classifyDIV pt-10 my1D6597">所有结果</div>
					<div class="pull-right t-20 classifySearch"
						style="position: relative;">
						<form action="<%=path%>/appeal/getAppealList" method="get"
						style="margin:0px; padding:0px;" id="mmsearchform"  name="reqForm">
						<input id="search-input" type="text" name="title"
							class="search-input pull-left span4" value="${title }" /> <a
							id="keysearch" href="javascript:document.reqForm.submit();" title="搜索"
							class="search-btn-css pull-left search-btn"></a>
					</form>
					</div>
				</div>
				<!--搜索结束-->
				<div class="hr tp-div-nexthr"
					style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
				<div class="mylistshow b-20  t-20" id="mmlistshow"></div>
				<!--列表开始-->

				<c:forEach items="${allAppealsByType.datas }" var="appealByType"
					varStatus="obj">
					<div
						class="label-div b-20 border-all pb-10 pt-5  
					<c:if test="${obj.count%2 != '0'}">
						pull-left
					</c:if>
					<c:if test="${obj.count%2 == '0'}">
						pull-right
					</c:if>"
						style="width:48%; width:48% \9; position: relative; padding-left: 0; 
						<c:if test="${obj.count%2 != '0'}">
							height:auto;
						</c:if>">
						<div class="clearfix pt-3">
							<div class="index-news-img spanm3 pull-left pt-5">
								<a href="javascript:;" title="${appealByType.title }"
									target="_blank" rel="bookmark"> <img class="lazyloadimg"
									alt="${appealByType.title }"
									src="<%=path%>/images/gyheart.jpg" /> </a>
							</div>
							<div class="offset3 intro mmwidth">
								<h1>
									<a title="${appealByType.title }" target="_blank"
										href="<%=path%>/record/appeal?appealId=${appealByType.id }">${appealByType.title
										}</a>
								</h1>
								<c:choose>
									<c:when test="${fn:length(appealByType.content)>55 }">
										<p class="t-1 mt1">${appealByType.content.substring(0,55)
											}...</p>
									</c:when>
									<c:otherwise>
										<p class="t-1 mt1">${appealByType.content }</p>
									</c:otherwise>
								</c:choose>
								<div class="clearfix" style="height:auto;margin-top:0px;">
									<div class="pull-left myxx">
										<i class="mr"><fmt:formatDate
												value="${appealByType.updateDate }" dateStyle="default" />
										</i> <i class="m"><a href="javascript:;" target="_blank">${appealByType.recipient.userName
												}</a> </i> <i class="m"><a href="javascript:;" target="_blank">已筹¥${appealByType.holdMoney
												}</a> </i>
									</div>
									<div class="mmclear"></div>
									<div class="">
										<a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
											title="已筹¥60000" data-id="104417" data-type="news">预筹¥${appealByType.goalMoney
											}</a> <a class="read-btn ie6png" href="javascript:void(0);">状态：
											<c:if test="${appealByType.appealState == 1}">
												项目进行中
											</c:if>
											<c:if test="${appealByType.appealState == 3}">
												项目下线
											</c:if>
											</a>
									</div>
									
									<c:if test="${obj.count%2 == '0'}">
										<div class="mmclear"></div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<!--第一个结束-->


				</c:forEach>

				<!--列表结束-->
				<div class="mmclear"></div>
				<div class="pagination center pagination-large pt-20">
					<ul id="yw1" class="yiiPager">
						<li class="next"><a href="?page=1">首页</a>
						</li>
						<li class="next"><a
							href="?page=${allAppealsByType.pageCurrent-1 }">上一页</a>
						</li>
						<li class="next"><a
							href="?page=${allAppealsByType.pageCurrent+1 }">下一页</a>
						</li>
						<li class="next"><a
							href="?page=${allAppealsByType.totalPage }">尾页</a>
						</li>
						<li class="next"><span>共${allAppealsByType.totalPage
								}页/当前第${allAppealsByType.pageCurrent }页</span>
						</li>
						<li class="page">&nbsp;&nbsp;第 <select name="select"
							onchange="_change()" id="select" style="width:50px">
								<c:forEach begin="1" end="${allAppealsByType.totalPage }"
									var="i">
									<option value="${i }"
										<c:if test="${i eq allAppealsByType.pageCurrent }">selected="selected"</c:if>>${i
										}</option>
								</c:forEach>
						</select>
						</li>
					</ul>
					<span>总共${allAppealsByType.recordCount }条记录</span>
				</div>
			</div>
			<!--右侧代码-->
			<!--右侧代码结束-->
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
