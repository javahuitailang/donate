<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<script type="text/javascript">
	function _change() {
  		var select = document.getElementById("select");
 		location = "?page="+select.value;
	}
</script>
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
			<div class="span12">
				<!--搜索-->
				<div class="clearfix">
					<div class="pull-left classifyDIV pt-10 my1D6597">
						所有结果:<span>所有公告信息</span>
					</div>
				</div>
				<!--搜索结束-->
				<div class="hr tp-div-nexthr"
					style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
				<div class="mylistshow b-20  t-20" id="mmlistshow"></div>
				<!--列表开始-->
				
				<c:forEach items="${bulletins.datas }" var="bulletin">
					<!--第一个    左对齐      pull-left-->
				<div class="label-div b-20 border-all pb-10 pt-5 pull-left"
					style="width:47%; width:47% \9; position: relative; padding-left: 0; height:auto;">
					<div class="clearfix pt-3">
						<div class="index-news-img spanm3 pull-left pt-5">
							<a href="javascript:;" title="${bulletin.title }" target="_blank"
								rel="bookmark"> <img class="lazyloadimg" alt="${bulletin.title }"
								src="<%=path%>/images/bulletin.jpg" /> </a>
						</div>
						<div class="offset3 intro mmwidth">
							<h1>
								<a title="${bulletin.title }" target="_blank" href="#">${bulletin.title }</a>
							</h1>
							<c:choose>
								<c:when test="${fn:length(bulletin.content)>50 }">
									<p class="t-1 mt1">${bulletin.content.substring(0,50) }...</p>
								</c:when>
								<c:otherwise>
									<p class="t-1 mt1">${bulletin.content }</p>
								</c:otherwise>
							</c:choose>
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
						<li class="next"><a href="?page=${bulletins.pageCurrent-1 }">上一页</a>
						</li>
						<li class="next"><a href="?page=${bulletins.pageCurrent+1 }">下一页</a>
						</li>
						<li class="next"><a href="?page=${bulletins.totalPage }">尾页</a>
						</li>
						<li class="next"><span>共${bulletins.totalPage }页/当前第${bulletins.pageCurrent }页</span>
						</li>
						<li class="page">&nbsp;&nbsp;第 <select name="select"
								onchange="_change()" id="select" style="width:50px">
									<c:forEach begin="1" end="${bulletins.totalPage }" var="i">
										<option value="${i }"
											<c:if test="${i eq bulletins.pageCurrent }">selected="selected"</c:if>>${i
											}</option>
									</c:forEach>
							</select> </li>
					</ul>
					<span>总共${bulletins.recordCount }条记录</span>
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
