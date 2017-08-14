<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>公益项目列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 公益项目管理 <span class="c-gray en">&gt;</span> 公益项目列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<form action="${pageContext.request.contextPath}/bAppeal/getProjectsByTimeOrTitle.action?" method="post">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" name="startTime" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" name="endTime" class="input-text Wdate" style="width:120px;">
		<input type="text" name="title" id="" placeholder="公益项目名称" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜项目</button>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a id="batchDelete" href="javascript:;"  class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a class="btn btn-primary radius" data-title="添加项目" _href="${pageContext.request.contextPath }/bAppeal/toAddPorject.action" onclick="Hui_admin_tab(this)" href="javascript:;">
			<i class="Hui-iconfont">&#xe600;</i> 添加项目
		</a>
		</span> 
		<span class="r">共有数据：<strong>${pageBean.recordCount}</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th>标题</th>
					<th width="80">排序值</th>
					<th width="80">已筹金额</th>
					<th width="80">预筹金额</th>
					<th width="120">更新时间</th>
					<th width="60">状态</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageBean.datas }" var="datas">
				<tr class="text-c">
					<td><input type="checkbox" value="" name=""></td>
					<td>${datas.id }</td>
					<td class="text-l">${datas.title } </td>
					<td>${datas.sortNum }</td>
					<td>${datas.holdMoney }</td>
					<td>${datas.goalMoney }</td>
					<td><fmt:formatDate value="${datas.updateDate }" /></td>			 
					<td class="td-status">
						<c:if test="${datas.appealState  == 0}">
							<span class="label label-fail radius">待审核</span>
						</c:if>
						<c:if test="${datas.appealState  == 1}">
							<span class="label label-success radius">通过</span>
						</c:if>
						<c:if test="${datas.appealState  == 2}">
							<span class="label label-fail radius">失败</span>
						</c:if>
						<c:if test="${datas.appealState  == 3}">
							<span class="label label-fail radius">不可用</span>
						</c:if>
					</td>
					<td class="f-14 td-manage">
						<a style="text-decoration:none" onClick=" " href="javascript:;" title="下线">
							<i class="Hui-iconfont">&#xe6de;</i>
						</a> 
					 
						<a style="text-decoration:none" class="ml-5" data-title="编辑"  _href="" onclick="" href="javascript:;"   title="编辑">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
						<a style="text-decoration:none" class="ml-5" onClick=" " href="javascript:;" title="删除">
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
			<a title="首页" id="firstPage" data-page="1" class="laypage_first" href="javascript:;">首页</a>
				<a id="prePage" data-page="27" class="laypage_prev" href="javascript:;">上一页</a>
				
				
				
				<a id="nextPage" data-page="29" class="laypage_next" href="javascript:;">下一页</a>
				<a data-page="32" id="lastPage" title="尾页" class="laypage_last" href="javascript:;">尾页</a>
				<span class="laypage_curr">当前第${pageBean.pageCurrent}页/共${pageBean.totalPage}页</span>
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


<script type="text/javascript">
	//alert("1");
	document.getElementById("nextPage").onclick =function(){
		var pageCurrent = ${pageBean.pageCurrent} + 1;
		window.location.href="${pageContext.request.contextPath}/bAppeal/getAllProjectAppeals.action?pageCurrent="+pageCurrent;
	}
</script>
<script type="text/javascript">
	document.getElementById("firstPage").onclick = function(){
		window.location.href="${pageContext.request.contextPath}/bAppeal/getAllProjectAppeals.action?pageCurrent="+1;
	}
</script>
<script type="text/javascript">
	document.getElementById("lastPage").onclick = function(){
		var totalPage = ${pageBean.totalPage};
		window.location.href="${pageContext.request.contextPath}/bAppeal/getAllProjectAppeals.action?pageCurrent="+totalPage;
	}
</script>
<script type="text/javascript">
	document.getElementById("prePage").onclick = function(){
		var pageCurrent = ${pageBean.pageCurrent} - 1;
		window.location.href="${pageContext.request.contextPath}/bAppeal/getAllProjectAppeals.action?pageCurrent="+pageCurrent;
	}
</script>

<script type="text/javascript">
	$("a").each(function(){
		if($(this).attr("title") == "下架"){
			$(this).unbind("click");
			$(this).bind("click",function(){
				//获取当前对象的id值
				var id = $(this).parent().siblings("td").next().html();
				var pageCurrent = ${pageBean.pageCurrent};
				window.location.href="${pageContext.request.contextPath}/bAppeal/invalidProjectAppealById.action?id="+id+"&pageCurrent="+pageCurrent;
			})
		}
	})
</script>

<script type="text/javascript">
//编辑公益项目
$("a").each(function(){
		
		if($(this).attr("title") == "编辑"){
			
			$(this).unbind("click");
			$(this).bind("click",function(){
				//获取当前对象的id值
				var id = $(this).parent().siblings("td").next().html();
				var pageCurrent = ${pageBean.pageCurrent};
				
				//alert(id);
				window.location.href="${pageContext.request.contextPath }/bAppeal/toEditProject.action?id="+id+"&pageCurrent="+pageCurrent;
			})
		}
	})
</script>

<script type="text/javascript">
	$("a").each(function(){
		if($(this).attr("title") == "删除"){
			$(this).unbind("click");
			$(this).bind("click",function(){
				//获取当前对象的id
				var id = $(this).parent().siblings("td").next().html();
				window.location.href="${pageContext.request.contextPath}/bAppeal/deleteAppealById.action?id="+id;
			})
		}
	})
</script>

<script type="text/javascript">
	function getCheckBox(ids){
		
		$("input[type = 'checkbox']").each(function(){
			if($(this).is(':checked')){
				//alert($(this).parent().siblings("td").html());
				ids.push($(this).parent().siblings("td").html());
			}
			
		});
		//alert(ids.length);
	}
	$("#batchDelete").unbind("click");
	$("#batchDelete").bind("click",function(){
		
		var ids = [];
		getCheckBox(ids);
		if(ids[0] == undefined){
			ids.splice(0, 1);
		}
		var IDS = ids.toString();
		//alert(IDS);
		var pageCurrent = ${pageBean.pageCurrent};
		window.location.href="${pageContext.request.contextPath}/bAppeal/batchDeleteProjects.action?IDS="+IDS+"&pageCurrent="+pageCurrent;
	});
</script>

</body>
</html>