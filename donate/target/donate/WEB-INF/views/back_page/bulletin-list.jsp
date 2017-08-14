<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.donate.po.Bulletin"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="<%=path%>/back/lib/html5.js"></script>
<script type="text/javascript" src="<%=path%>/back/lib/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/back/lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=path%>/back/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/static/h-ui.admin/css/style.css" />
<!--
<script type="text/javascript" src="<%=path%>/back/lib/laypage/1.2/laypage.js"></script>-->
<link rel="stylesheet" type="text/css" href="<%=path%>/back/lib/laypage/1.2/skin/laypage.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<script type="text/javascript" src="<%=path%>/deleteData/deleteData.js"></script> 
<title>公告管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 公告管理 <span class="c-gray en">&gt;</span> 公告列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<form action="<%=path %>/bulletin/search" method="post">
	<div class="text-c"> 
		<input type="text" name="keywords" id="" placeholder="输入公告id或标题" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜公告</button>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="deleSeltedRecords()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a class="btn btn-primary radius" data-title="添加公告" _href="<%=path %>/bulletin/goadd" onclick="Hui_admin_tab(this)" href="javascript:;">
			<i class="Hui-iconfont">&#xe600;</i> 添加公告
		</a>
		</span> 
		<span class="r">共有数据：<strong>${pageBean.recordCount}</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th> 
					<th width="40">ID</th>
					<th width="80">标题</th>
					<th  >内容</th>
					<th width="70">发布时间</th>
					<th width="60">发布人</th>
					<th width="30">状态</th>
					<th width="60">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageBean.datas}" var="bulletin">
				<tr class="text-c">
					<td><input type="checkbox" value="${bulletin.id}" name="choicebulletin" id="choicebulletin"/></td>
					<td>${bulletin.id}</td>
					<td class="text-l">${bulletin.title}</td>
					<td>${bulletin.content }</td>
					<td><fmt:formatDate value="${bulletin.createDate }" pattern="yyyy-MM-dd"/></td>
					<td>${bulletin.createUser.userName}</td>			 
					<c:if test="${bulletin.state == 0}">
						<td class="td-status"><span class="label label-success radius">可用</span></td>
					</c:if>
					<c:if test="${bulletin.state == 1}">
						<td class="td-status"><span class="label label-success radius">不可用</span></td>
					</c:if>
					
					<td class="f-14 td-manage">
					
						<a style="text-decoration:none" class="ml-5" data-title="修改公告"  _href="<%=path %>/bulletin/toedit?id=${bulletin.id}&title=${bulletin.title}&content=${bulletin.content}" onclick="Hui_admin_tab(this)"   title="编辑">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
						<a style="text-decoration:none" class="ml-5" onClick=" " href="<%=path %>/bulletin/delete?id=${bulletin.id}" title="删除">
							<i class="Hui-iconfont">&#xe6e2;</i>
						</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
			<!--分页开始-->
		<div class="line"></div><div class="line"></div><div class="line"></div>
		<div class="text-c" id="page1">
			<div id="laypage_0" class="laypage_main laypageskin_default" name="laypage1.2">
				
				<c:if test="${pageBean.pageCurrent != 1}">
					<a data-page="27" class="laypage_prev" href="javascript:void(0)" onclick="window.location.href='<%=path %>/bulletin/list?pageCurrent=1'">首页</a>
				</c:if>
				
				<c:if test="${pageBean.pageCurrent > 1}">
					<a data-page="27" class="laypage_prev" href="javascript:void(0)" onclick="window.location.href='<%=path %>/bulletin/list?pageCurrent=${pageBean.pageCurrent-1}'">上一页</a>
				</c:if>
				
		<c:choose>
				
			<c:when test="${pageBean.pageCurrent<=3}">
					<c:if test="${pageBean.totalPage <= 5}">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="${pageBean.totalPage}"></c:set>
					</c:if>
					<c:if test="${pageBean.totalPage > 5}">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="5"></c:set>
					</c:if>
			</c:when>
			<c:otherwise>
					<c:set var="begin" value="${pageBean.pageCurrent-2}"></c:set> 
					<c:set var="end" value="${pageBean.pageCurrent+2}"></c:set>
					<c:if test="${begin <1}">
						<c:set var="begin" value="1"></c:set> 
						<c:set var="end" value="5"></c:set>
					</c:if>
					<c:if test="${end >pageBean.totalPage}">
						<c:if test="${pageBean.totalPage-4 < 0}">
							<c:set var="begin" value="1"></c:set> 
							<c:set var="end" value="${pageBean.totalPage}"></c:set>
						</c:if>
						<c:if test="${pageBean.totalPage-4 > 0}">
							<c:set var="begin" value="${pageBean.totalPage-4}"></c:set> 
							<c:set var="end" value="${pageBean.totalPage}"></c:set>
						</c:if>
					</c:if>
			</c:otherwise>
		
		</c:choose>
		
		
		<c:forEach var="i" begin="${begin}" end="${end}">
			<c:choose>
				<c:when test="${i eq pageBean.pageCurrent }">
					<strong>${i}</strong>
				</c:when>
				<c:otherwise>
					<a data-page="${i}" class="laypage_last" href="javascript:void(0)" onclick="window.location.href='<%=path %>/bulletin/list?pageCurrent=${i}'">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
				
				<c:if test="${pageBean.pageCurrent < pageBean.totalPage}">
					<a data-page="29" class="laypage_next" href="javascript:void(0)" onclick="window.location.href='<%=path %>/bulletin/list?pageCurrent=${pageBean.pageCurrent+1}'">下一页</a>
				</c:if>
				
				<c:if test="${pageBean.pageCurrent != pageBean.totalPage}">
					<a data-page="29" class="laypage_next" href="javascript:void(0)" onclick="window.location.href='<%=path %>/bulletin/list?pageCurrent=${pageBean.totalPage}'">尾页</a>
				</c:if>
				&nbsp;&nbsp;&nbsp;<var>共 <font color="red">${pageBean.totalPage}</font>页</var>
			</div>
		</div>
		<!--分页结束-->
		<!--分页结束-->
	</div>
</div>
<script type="text/javascript" src="<%=path%>/back/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="<%=path%>/back/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=path%>/back/static/h-ui.admin/js/H-ui.admin.js"></script>


</body>
</html>