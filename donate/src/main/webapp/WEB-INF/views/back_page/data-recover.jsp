<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>数据恢复</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 数据恢复 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
	 
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	 
 
		<form id="demoform-1" class="form form-horizontal" method="post" action="<%=path %>/bulletin/recover">
					<div class="row cl">
						<div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
							<input type="text" readonly="" id="uploadfile-2" name="uploadfile-2" class="input-text upload-url">
							<a class="btn btn-primary upload-btn" href="javascript:void();"><i class="Hui-iconfont"></i> 备份文件路径</a>
							<input type="file" class="input-file" name="file-2" multiple="">
							</span> </div>
					</div>
					<div class="row cl">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
							<input type="submit" value="开始恢复" class="btn btn-primary radius">
						</div>
					</div>
				</form>
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