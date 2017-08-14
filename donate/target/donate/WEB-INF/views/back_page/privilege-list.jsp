<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
<title>权限列表</title>
<script type="text/javascript">
	function searchPrivilege(){
		window.location.href="${pageContext.request.contextPath}/privilege/getAllPrivileges?pageCurrent="+${pageBean.pageCurrent}+"&queryPrivilegeName="+$("#inputPrivilege").val();
	}
</script>

<script type="text/javascript">
	function datadel(){
		var length = $("#privilegeId:checked").length;
		if(length<=0){
			alert("请至少选择一项!");
			return;
		}
		var boole = confirm("你确定要删除吗?");
		if(!boole){
			return;
		}
		$("#JvForm").attr("action","${pageContext.request.contextPath}/privilege/deleteById.action");
		$("#JvForm").attr("method","post");
		$("#JvForm").submit();
	}
</script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 公益项目管理 <span class="c-gray en">&gt;</span> 权限列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="page-container">
	<div class="text-c"> 
		<input type="text" name="" value="${queryPrivilegeName}" id="inputPrivilege" placeholder="权限名" style="width:250px" class="input-text">
		<button name="" id="searchPrivilege" onclick="searchPrivilege();" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜权限</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a href="javascript:void(0);" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a class="btn btn-primary radius" data-title="添加权限" _href="<%=path%>/privilege/add" onclick="Hui_admin_tab(this)" href="javascript:;">
			<i class="Hui-iconfont">&#xe600;</i> 添加权限
		</a>
		</span> 
		<span class="r">共有数据：<strong>${pageBean.recordCount}</strong> 条</span> 
	</div>
	
	<div class="mt-20">
	<form id="JvForm">
	 	<input type="hidden" name="pageCurrent" value="${pageBean.pageCurrent}"/> 
		<input type="hidden" name="queryPrivilegeName" value="${queryPrivilegeName}"/>
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th width="120">权限名称</th>
					<th >权限路径</th>
					<th width="60">父节点编码</th>
					<th width="50">根节点</th>
					<th width="60">是否根节点</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${pageBean.datas }" var="datas">
				<tr class="text-c">
					<td><input type="checkbox" value="${datas.id }" name="ids" id="privilegeId"></td>
					<td>${datas.id }</td>
					<td class="text-l">${datas.name }</td>
					<td>${datas.path}</td>
					<td>${datas.parentNode}</td>
					<td>${datas.rootNode}</td>			 
					<td class="td-status"><span class="label label-success radius">
					<c:if test="${datas.isRoot==0}">否</c:if>
					<c:if test="${datas.isRoot==1}">是</c:if></span></td>
					<td class="f-14 td-manage">
					
						<a style="text-decoration:none" class="ml-5" onClick="" href="<%=path%>/privilege/edit?id=${datas.id}" href="javascript:void(0);" title="编辑">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
						<a style="text-decoration:none" class="ml-5" onClick=" " href="<%=path%>/privilege/deleteCountTypeById?id=${datas.id}&pageCurrent=${pageBean.pageCurrent}&queryPrivilegeName=${queryPrivilegeName}" href="javascript:void(0);" title="删除">
							<i class="Hui-iconfont">&#xe6e2;</i>
						</a>
					</td>
				</tr>
 				</c:forEach>
				
			</tbody>
		</table>
		</form>
		
			<!--分页开始-->
		<div class="line"></div><div class="line"></div><div class="line"></div>
		<div class="text-c" id="page1">
			<div id="laypage_0" class="laypage_main laypageskin_default" name="laypage1.2">
				
				<c:if test="${pageBean.pageCurrent != 1}">
					<a data-page="27" class="laypage_prev" href="javascript:void(0)" onclick="window.location.href='<%=path %>/privilege/getAllPrivileges?pageCurrent=1&queryPrivilegeName=${queryPrivilegeName}'">首页</a>
				</c:if>
				
				<c:if test="${pageBean.pageCurrent > 1}">
					<a data-page="27" class="laypage_prev" href="javascript:void(0)" onclick="window.location.href='<%=path %>/privilege/getAllPrivileges?pageCurrent=${pageBean.pageCurrent-1}&queryPrivilegeName=${queryPrivilegeName}'">上一页</a>
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
					<a data-page="${i}" class="laypage_last" href="javascript:void(0)" onclick="window.location.href='<%=path %>/privilege/getAllPrivileges?pageCurrent=${i}&queryPrivilegeName=${queryPrivilegeName}'">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
				
				<c:if test="${pageBean.pageCurrent < pageBean.totalPage}">
					<a data-page="29" class="laypage_next" href="javascript:void(0)" onclick="window.location.href='<%=path %>/privilege/getAllPrivileges?pageCurrent=${pageBean.pageCurrent+1}&queryPrivilegeName=${queryPrivilegeName}'">下一页</a>
				</c:if>
				
				<c:if test="${pageBean.pageCurrent != pageBean.totalPage}">
					<a data-page="29" class="laypage_next" href="javascript:void(0)" onclick="window.location.href='<%=path %>/privilege/getAllPrivileges?pageCurrent=${pageBean.totalPage}&queryPrivilegeName=${queryPrivilegeName}'">尾页</a>
				</c:if>
				&nbsp;&nbsp;&nbsp;<var>共 <font color="red">${pageBean.totalPage}</font>页</var>
			</div>
		</div>
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