<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>求助申请管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 求助申请管理 <span class="c-gray en">&gt;</span> 未审核求助列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<form action="${pageContext.request.contextPath}/bApply/getApplysByTimeOrTitle.action" method="post">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" name="startTime" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" name="endTime" class="input-text Wdate" style="width:120px;">
		<input type="text" name="title" id="title" placeholder="求助标题" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜求助</button>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> 
		<a id="batchAdopt" href="javascript:;" onclick="pass()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 批量通过</a> 
		<a id="batchRefuse"href="javascript:;" onclick="refuse()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量不通过</a> 
	 
		</span> 
		<span class="r">共有数据：<strong>${page.recordCount }</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th width="80">申请人</th>		
					<th>标题</th>					 
					<th width="80">预筹金额</th>
					<th width="120">申请时间</th>
					<th width="60">状态</th>
					<th width="120">操作</th>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach items="${page.datas }" var="datas">
				<tr class="text-c">
					<td><input type="checkbox" value="" name=""></td>
					<td>${datas.id }</td>
					<td class="text-l">${datas.recipient.userName}</td>
					<td class="text-l"> ${datas.title } </td>					 
					<td>${datas.goalMoney }</td>
					<td><fmt:formatDate value="${datas.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>			 
					<td class="td-status">
						<c:if test="${datas.appealState == 0 }">
							<span class="label label-success radius">待审核</span>
						</c:if>
						<c:if test="${datas.appealState == 1 }">
							<span class="label label-success radius">通过</span>
						</c:if>
						<c:if test="${datas.appealState == 2 }">
							<span class="label label-fail radius">审核未通过</span>
						</c:if>
						<c:if test="${datas.appealState == 3 }">
							<span class="label label-fail radius">不可用</span>
						</c:if>
					</td>
					<td class="f-14 td-manage">
						
						<a style="text-decoration:none" class="ml-5" onClick=""  title="详情">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
						<a style="text-decoration:none" onClick=" " href="javascript:;" title="通过">
							<i class="Hui-iconfont">&#xe600;</i>
						</a> 
						<a style="text-decoration:none" class="ml-5" onClick=" " href="javascript:;" title="不通过">
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
				<a data-page="27" class="laypage_prev" href="javascript:;">上一页</a>
				
				
				<a data-page="29" class="laypage_next" href="javascript:;">下一页</a>
				<a data-page="32" id="lastPage" title="尾页" class="laypage_last" href="javascript:;">尾页</a>
				<span class="laypage_curr">当前第${page.pageCurrent}页/共${page.totalPage}页</span>
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

<!-- 下一页 -->
<script type="text/javascript">
	$("a").each(function(){
		if($(this).text() == "下一页"){
			$(this).unbind("click");
			$(this).bind("click",function(){
				var pageCurrent = ${page.pageCurrent} + 1;
				window.location.href="${pageContext.request.contextPath}/bApply/getAllApplys.action?pageCurrent="+pageCurrent;
			})
		}
		
	})
</script>
<!-- 上一页 -->
<script type="text/javascript">
	$("a").each(function(){
		if($(this).text() == "上一页"){
			$(this).unbind("click");
			$(this).bind("click",function(){
				var pageCurrent = ${page.pageCurrent} - 1;
				window.location.href="${pageContext.request.contextPath}/bApply/getAllApplys.action?pageCurrent="+pageCurrent;
			})
		}
	})
</script>

<script type="text/javascript">
	document.getElementById("firstPage").onclick = function(){
		window.location.href="${pageContext.request.contextPath}/bApply/getAllApplys.action?pageCurrent="+1;
	}
</script>
<script type="text/javascript">
	document.getElementById("lastPage").onclick = function(){
		var totalPage = ${page.totalPage};
		window.location.href="${pageContext.request.contextPath}/bApply/getAllApplys.action?pageCurrent="+totalPage;
	}
</script>

<!-- 查询详情 -->
<script type="text/javascript">
	$("a").each(function(){
		if($(this).attr("title") == "详情"){
			
			$(this).unbind("click");
			$(this).bind("click",function(){
				//获取到当前点击对象的id值
				var id = $(this).parent().siblings("td").next().html();
				var pageCurrent = ${page.pageCurrent};
				//alert(id);
				window.location.href="${pageContext.request.contextPath}/bApply/toApplyDetail.action?id="+id+"&pageCurrent="+pageCurrent;
			})
		}
	})
	
	//管理员通过申请
	$("a").each(function(){		
		if($(this).attr("title") == "通过"){
			$(this).unbind("click");
			$(this).bind("click",function(){
				//获取当前对象的id值
				var id = $(this).parent().siblings("td").next().html();
				var pageCurrent = ${page.pageCurrent};
				window.location.href="${pageContext.request.contextPath}/bApply/adoptApplyById.action?id="+id+"&pageCurrent="+pageCurrent;
			});
		}
	});
	//管理员拒绝申请
	$("a").each(function(){
		if($(this).attr("title") == "不通过"){
			$(this).unbind("click");
			$(this).bind("click",function(){
				//获取当前对象的id
				var id = $(this).parent().siblings("td").next().html();
				var pageCurrent = ${page.pageCurrent};
				window.location.href="${pageContext.request.contextPath}/bApply/refuseApplyById.action?id="+id+"&pageCurrent="+pageCurrent;
			});
		}
	});
	
	
</script>

<script type="text/javascript">
	//批量通过
	function getCheckBox(ids){
		
		$("input[type = 'checkbox']").each(function(){
			if($(this).is(':checked')){
				//alert($(this).parent().siblings("td").html());
				ids.push($(this).parent().siblings("td").html());
			}
			
		});
	}
	$("#batchAdopt").unbind("click");
	$("#batchAdopt").bind("click",function(){
		var ids = [];
		getCheckBox(ids);
		if(ids[0] == undefined){
			ids.splice(0, 1);
		}
		var IDS = ids.toString();
		var pageCurrent = ${page.pageCurrent};
		window.location.href="${pageContext.request.contextPath}/bApply/batchAdoptApplysById.action?IDS="+IDS+"&pageCurrent="+pageCurrent;
	});
	
	

</script>


<script type="text/javascript">
	//批量不通过
	function getCheckBox(ids){
		
		$("input[type = 'checkbox']").each(function(){
			if($(this).is(':checked')){
				//alert($(this).parent().siblings("td").html());
				ids.push($(this).parent().siblings("td").html());
			}
			
		});
	}
	$("#batchRefuse").unbind("click");
	$("#batchRefuse").bind("click",function(){
		var ids = [];
		getCheckBox(ids);
		if(ids[0] == undefined){
			ids.splice(0, 1);
		}
		var IDS = ids.toString();
		var pageCurrent = ${page.pageCurrent};
		window.location.href="${pageContext.request.contextPath}/bApply/batchRefuseApplysById.action?IDS="+IDS+"&pageCurrent="+pageCurrent;
	});

</script>
</body>
</html>