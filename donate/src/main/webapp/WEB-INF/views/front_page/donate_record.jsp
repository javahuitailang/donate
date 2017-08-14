<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>捐款记录页</title>
<meta name="Keywords" content="捐款记录页" />
<meta name="Description" content="捐款记录页" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/tzjg_list.css" />
<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<script type="text/javascript" src="<%=path%>/js/tzjg_list.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js?v=20130220"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]-->
<script type="text/javascript">
  	function _change() {
  		var select = document.getElementById("select");
 		location = "<%=basePath%>record/${pageBean.url}?context=${context }&selected=${selected}&pageCurrent="
				+ select.value;
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
			<div class="span16">
				<!--搜索-->
				<div class="clearfix pb-15" style=" position:relative;">
					<form action="<%=basePath%>record/search" name="reqForm">
						<div class="pull-left classifyDIV pt-10">
							<div class="pull-left classifyDIV pt-10 my1D6597">捐赠记录</div>
							<div style="position: absolute; right:300px; "
								class="pull-left classifyDIV pt-10 my1D6597">
								<select name="selected" id="provinceid"
									class="location-select span2" style="width:100px">
									<option value="1"
										<c:if test="${selected eq 1 }">selected="selected"</c:if>>捐赠人</option>
									<option value="2"
										<c:if test="${selected eq 2 }">selected="selected"</c:if>>捐赠项目</option>
								</select>
							</div>
						</div>
						<div style="position: absolute; right:0px; background:#06f;"
							class="pull-right t-20 classifySearch">
							<input type="text" value="${context }" name="context"
								placeholder="请输入关键字" class="search-input pull-left span4"
								id="search-input"> <a
								class="search-btn-css pull-left search-btn" title="搜索"
								href="javascript:document.reqForm.submit();"></a>
						</div>
					</form>
				</div>
				<!--搜索结束-->

				<!--列表开始-->
				<!--第一个-->
				<div id="comment_div"
					class="t-10 label-div border-all pr-20 pt-50 pl-20">
					<ul class="comments-list clearfix">
						<table class="mytable" cellpadding="0" cellspacing="0">
							<tr>
								<th>捐赠人</th>
								<th>性别</th>
								<th>受捐用户</th>
								<th>捐赠项目</th>
								<th>捐赠金额</th>
								<th>捐赠时间</th>
							</tr>
							<c:forEach items="${pageBean.datas }" var="datas">
								<tr>
									<td><a
										href="<%=path%>/record/user?userId=${datas.donor.id}"
										onclick="return false;">${datas.donor.realName}</a></td>
									<td><c:if test="${datas.donor.sex eq 0}">女</c:if> <c:if
											test="${datas.donor.sex eq 1}">男</c:if>
									</td>
									<td><a
										href="<%=path%>/record/user/${datas.appeal.recipient.id}"
										onclick="return false;">${datas.appeal.recipient.realName}</a>
									</td>
									<td><a
										href="<%=path%>/record/appeal?appealId=${datas.appeal.id}">${datas.appeal.title}</a>
									</td>
									<td>¥${datas.donorMoney }</td>
									<td><fmt:formatDate value="${datas.donorDate }"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</table>
					</ul>
					<div class="pagination center pagination-large pt-20">
						<ul id="yw1" class="yiiPager">
							<li class="page"><a href="<%=basePath%>record/getAll">所有记录</a>
							</li>
							<li class="page"><a
								href="<%=basePath%>record/${pageBean.url}?pageCurrent=1&id=${userSession.id}&context=${context }&selected=${selected}">首页</a>
							</li>
							<li class="page"><a
								href="<%=basePath%>record/${pageBean.url}?pageCurrent=${pageBean.pageCurrent-1}&id=${userSession.id}&context=${context }&selected=${selected}">上一页</a>
							</li>
							<li class="page"><a
								href="<%=basePath%>record/${pageBean.url}?pageCurrent=${pageBean.pageCurrent+1}&id=${userSession.id}&context=${context }&selected=${selected}">下一页</a>
							</li>
							<li class="page"><a
								href="<%=basePath%>record/${pageBean.url}?pageCurrent=${pageBean.totalPage}&id=${userSession.id}&context=${context }&selected=${selected}">尾页</a>
							</li>
							<li class="page"><a
								href="<%=basePath%>record/getAllById?id=${userSession.id}">我的记录</a>
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
				<!--第一个结束-->
				<!--列表结束-->

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
	</div>

	<jsp:include page="/public/footer.jsp"></jsp:include>
</body>
</html>
