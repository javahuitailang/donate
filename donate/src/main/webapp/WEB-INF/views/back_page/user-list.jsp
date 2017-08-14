<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="<%=path%>/back/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="<%=path%>/back/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=path%>/back/static/h-ui.admin/js/H-ui.admin.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/back/lib/laypage/1.2/skin/laypage.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>公益项目列表</title>
<script type="text/javascript">
	$(function(){
		$("#searchUser").click(function(){
			window.location.href="${pageContext.request.contextPath}/goVipManage/list?pageCurrent="+${pageBean.pageCurrent}+"&queryUserName="+$("#inputUser").val();
		});
	});

</script>

<script type="text/javascript">
	function datadel(){
		var length = $("#userId:checked").length;
		if(length<=0){
			alert("请至少选择一项!");
			return;
		}
		if(!confirm("你确定要删除吗?")){
				return;
		}
		$("#JvForm").attr("action","${pageContext.request.contextPath}/goVipManage/deleteById");
		$("#JvForm").attr("method","post");
		$("#JvForm").submit();
	}
</script>


</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 会员管理 <span class="c-gray en">&gt;</span> 会员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href='${pageContext.request.contextPath}/goVipManage/list?pageCurrent=${pageBean.pageCurrent}&queryUserName=${queryUserName}');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<input type="text" name="" value="${queryUserName}" id="inputUser" placeholder="用户名" style="width:250px" class="input-text">
		<button name="" id="searchUser" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a href="javascript:void(0);" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
	 
		</span> 
		<span class="r">共有数据：<strong>54</strong> 条</span> 
	</div>
	<div class="mt-20">
		<form id="JvForm">
		<input type="hidden" name="pageCurrent" value="${pageBean.pageCurrent}"/>
		<input type="hidden" name="queryUserName" value="${queryUserName}"/>
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th width="80">用户名</th>
					<th width="80">真实姓名</th>
					<th width="80">性别</th>
					<th width="120">联系电话</th>
					<th width="60">状态</th>
					<th width="60">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageBean.datas}" var="user">
				<tr class="text-c">
					<td><input type="checkbox" value="${user.id}" name="ids" id="userId"></td>
					<td>${user.id}</td>
					<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','${user.id}')" title="查看">${user.userName}</u></td>
					<td>${user.realName}</td>
					
					<c:if test="${user.sex == 0}">
						<td>男</td>
					</c:if>
					<c:if test="${user.sex == 1}">
						<td>女</td>
					</c:if>
					<td>${user.tel}</td>	
					
					<c:if test="${user.countState == 0 }">
						<td class="td-status"><span class="label label-success radius">未审核</span></td>
					</c:if>	 
					<c:if test="${user.countState == 1 }">
						<td class="td-status"><span class="label label-success radius">可用</span></td>
					</c:if>
					<c:if test="${user.countState == 2 }">
						<td class="td-status"><span class="label label-success radius">不可用</span></td>
					</c:if>		
					
					<td class="f-14 td-manage">					
					 
						<a style="text-decoration:none" class="ml-5" data-title="详情" onclick="window.location.href='<%=path %>/goVipManage/toUserDetail?id=${user.id}'" href="javascript:void(0);"   title="详情">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
						
						<a style="text-decoration:none" class="ml-5" onClick="window.location.href='<%=path %>/goVipManage/defriend?id=${user.id}&pageCurrent=${pageBean.pageCurrent}&queryUserName=${queryUserName}'" href="javascript:void(0);" title="拉黑">
							<i class="Hui-iconfont">&#xe6e2;</i>
						</a>
					</td>
				</tr>
				
				</c:forEach> 
				 		
				
			</tbody>
		</table>
		</form>
		
		<div class="line"></div><div class="line"></div><div class="line"></div>
		<div class="text-c" id="page1">
			<div id="laypage_0" class="laypage_main laypageskin_default" name="laypage1.2">
				
				<c:if test="${pageBean.pageCurrent != 1}">
					<a data-page="27" class="laypage_prev" href="javascript:void(0)" onclick="window.location.href='<%=path %>/goVipManage/list?pageCurrent=1&queryUserName=${queryUserName}'">首页</a>
				</c:if>
				
				<c:if test="${pageBean.pageCurrent > 1}">
					<a data-page="27" class="laypage_prev" href="javascript:void(0)" onclick="window.location.href='<%=path %>/goVipManage/list?pageCurrent=${pageBean.pageCurrent-1}&queryUserName=${queryUserName}'">上一页</a>
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
					<a data-page="${i}" class="laypage_last" href="javascript:void(0)" onclick="window.location.href='<%=path %>/goVipManage/list?pageCurrent=${i}&queryUserName=${queryUserName}'">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
				
				<c:if test="${pageBean.pageCurrent < pageBean.totalPage}">
					<a data-page="29" class="laypage_next" href="javascript:void(0)" onclick="window.location.href='<%=path %>/goVipManage/list?pageCurrent=${pageBean.pageCurrent+1}&queryUserName=${queryUserName}'">下一页</a>
				</c:if>
				
				<c:if test="${pageBean.pageCurrent != pageBean.totalPage}">
					<a data-page="29" class="laypage_next" href="javascript:void(0)" onclick="window.location.href='<%=path %>/goVipManage/list?pageCurrent=${pageBean.totalPage}&queryUserName=${queryUserName}'">尾页</a>
				</c:if>
				&nbsp;&nbsp;&nbsp;<var>共 <font color="red">${pageBean.totalPage}</font>页</var>
			</div>
		</div>
		<!--分页结束-->
	</div>
</div>



</body>
</html>