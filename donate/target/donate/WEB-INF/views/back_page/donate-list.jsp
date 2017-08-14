<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<title>捐款管理</title>
<script type="text/javascript">
  	function _change() {
  		var select = document.getElementById("select");
 		location = "<%=basePath%>record/${pageBean.url}?context=${context }&beforDate=${beforDate }&afterDate=${afterDate}"+
 		"&selected=${selected}&pageCurrent="
				+ select.value;
	}
</script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 捐款管理 <span class="c-gray en">&gt;</span> 捐款列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<form action="<%=path%>/record/donate-list">
	<div class="text-c"> 日期范围：
		<input type="text" name="beforDate" value="${beforDate }" 
			onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" name="afterDate" value="${afterDate }" 
			onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate" style="width:120px;">
		&nbsp;&nbsp;&nbsp;
		<span class="select-box inline">
			<select name="selected" id="provinceid"class="location-select span2" style="width:100px">
				<option value="1" <c:if test="${selected eq 1 }">selected="selected"</c:if>>捐赠人</option>
				<option value="2" <c:if test="${selected eq 2 }">selected="selected"</c:if>>捐赠项目</option>
			</select>
		</span> 
		<input type="text" value="${context }" name="context" id="" placeholder="请输入关键字" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit">
			<i class="Hui-iconfont">&#xe665;</i> 搜索
		</button>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">累计捐款金额:¥<font color="red">${getTotal}</font>元</span> 
		<span class="r">共有数据：<strong>${pageBean.recordCount }</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="60">ID</th>
					<th width="80">捐款人</th>
					<th width="80">受捐用户</th>							
					<th width="80">捐赠项目</th>					 
					<th width="80">捐助金额</th>
					<th width="120">捐助时间</th>
				</tr>
			</thead>
			<c:forEach items="${pageBean.datas }" var="datas">
			<tbody>
				<tr class="text-c">
					<td>${datas.id}</td>
					<td class="text-m"><a href="#"><span class="label label-success radius">${datas.donor.realName}</span> </a>  </td>
					<td class="text-m"><a href="#"><span class="label label-primary radius">${datas.appeal.recipient.realName}</span> </a>  </td>
					<td class="text-m"> <a href="#"><span class="label label-success radius">${datas.appeal.title}</span>  </a> </td>					 
					<td>¥${datas.donorMoney }</td>
					<td><fmt:formatDate value="${datas.donorDate }" pattern="yyyy-MM-dd" /></td>			 
				</tr>
			</tbody>
			</c:forEach>
		</table>
		
		
			<!--分页开始-->
		 <div class="line"></div><div class="line"></div><div class="line"></div>
		<div class="text-c" id="page1">
			<div id="laypage_0" class="laypage_main laypageskin_default" name="laypage1.2">
				<a class="laypage_prev" href="<%=basePath%>record/${pageBean.url}?context=${context }&beforDate=${beforDate }&selected=${selected}&afterDate=${afterDate}&pageCurrent=1">首页</a>
				<a class="laypage_prev" href="<%=basePath%>record/${pageBean.url}?context=${context }&beforDate=${beforDate }&selected=${selected}&afterDate=${afterDate}&pageCurrent=${pageBean.pageCurrent-1}">上一页</a>
				<a class="laypage_next" href="<%=basePath%>record/${pageBean.url}?context=${context }&beforDate=${beforDate }&selected=${selected}&afterDate=${afterDate}&pageCurrent=${pageBean.pageCurrent+1}">下一页</a>
				<a class="laypage_prev" href="<%=basePath%>record/${pageBean.url}?context=${context }&beforDate=${beforDate }&selected=${selected}&afterDate=${afterDate}&pageCurrent=${pageBean.totalPage }">尾页</a>
				<li>&nbsp;&nbsp;第 <select name="pageCurrent"
					onchange="_change()" id="select" style="width:50px">
						<c:forEach begin="1" end="${pageBean.totalPage }" var="i">
							<option value="${i }"
								<c:if test="${i eq pageBean.pageCurrent }">selected="selected"</c:if>>${i
								}</option>
						</c:forEach>
				</select> 页/共${pageBean.totalPage }页,共${pageBean.recordCount }条记录</li>
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