<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico">
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="<%=path%>/back/lib/html5.js"></script>
<script type="text/javascript" src="<%=path%>/back/lib/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/back/lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/back/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/back/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/back/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/back/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/back/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/back/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>在线捐款系统后台</title>
<meta name="keywords" content=" ">
<meta name="description" content=" ">
</head>
<body>
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl">
				<a class="logo navbar-logo f-l mr-10 hidden-xs" href=" ">在线捐款系统</a>
				<span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a
					aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
					href="javascript:;">&#xe667;</a>

				<nav id="Hui-userbar"
					class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li>
						<c:if test="${backUserSession.countType==1}">管理员</c:if>
							<c:if test="${backUserSession.countType==2}">系统管理员</c:if>
						</li>
						<li class="dropDown dropDown_hover"><a href="#"
							class="dropDown_A">${backUserSession.userName} <i class="Hui-iconfont">&#xe6d5;</i>
						</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="<%=path%>/user/backLoginOut">退出</a>
								</li>
							</ul></li>

						<li id="Hui-skin" class="dropDown right dropDown_hover"><a
							href="javascript:;" class="dropDown_A" title="换肤"><i
								class="Hui-iconfont" style="font-size:18px">&#xe62a;</i>
						</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" data-val="default"
									title="默认(蓝色)">默认</a>
								</li>
								<li><a href="javascript:;" data-val="black" title="黑色">黑色</a>
								</li>
								<li><a href="javascript:;" data-val="default" title="蓝色">蓝色</a>
								</li>
								<li><a href="javascript:;" data-val="green" title="绿色">绿色</a>
								</li>
								<li><a href="javascript:;" data-val="red" title="红色">红色</a>
								</li>
								<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
								</li>
								<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a>
								</li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<aside class="Hui-aside">
		<input runat="server" id="divScrollValue" type="hidden" value="" />
		<div class="menu_dropdown bk_2">
			<dl id="menu-article">
				<dt>
					<i class="Hui-iconfont">&#xe639;</i> 公益项目管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath }/bAppeal/getAllProjectAppeals.action"
							data-title="公益项目管理" href="javascript:void(0)">公益项目管理</a>
						</li>

					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe637;</i> 个人求助管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="<%=path%>/bAppeal/getAllAppeals.action?pageCurrent=1"
							data-title="个人求助管理" href="javascript:void(0)">已通过申请</a>
						</li>
						<li><a
							_href="<%=path%>/bApply/getAllApplys.action?pageCurrent=1"
							data-title="求助申请管理" href="javascript:void(0)">未审核申请</a>
						</li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe63a;</i> 捐款管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a _href="<%=basePath%>record/getBackAll"
							data-title="捐款管理" href="javascript:void(0)">捐款列表</a>
						</li>
						<li><a _href="<%=basePath%>appeal/getBackAll"
							data-title="捐款统计" href="javascript:void(0)">捐款统计</a>
						</li>

					</ul>
				</dd>
			</dl>

			<dl id="menu-member">
				<dt>
					<i class="Hui-iconfont">&#xe6cc;</i> 会员管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a _href="<%=path%>/goVipManage/list" data-title="会员列表"
							href="javascript:;">会员管理</a>
						</li>

					</ul>
				</dd>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe62b;</i> 管理员管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a _href="<%=path%>/manage/list.action"
							data-title="管理员管理" href="javascript:void(0)">管理员管理</a>
						</li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe62d;</i> 权限管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a _href="<%=path%>/privilege/getAllPrivileges.action"
							data-title="权限管理" href="javascript:void(0)">权限管理</a>
						</li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe636;</i> 公告管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a _href="<%=path%>/bulletin/list" data-title="公告管理"
							href="javascript:void(0)">公告管理</a>
						</li>

					</ul>
				</dd>
			</dl>

			<dl id="menu-system">
				<dt>
					<i class="Hui-iconfont">&#xe62e;</i> 系统管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>

						<li><a _href="<%=path%>/bulletin/data-copy"
							data-title="数据备份" href="javascript:void(0)">数据备份</a>
						</li>
						<li><a _href="<%=path%>/bulletin/data-recover"
							data-title="数据恢复" href="javascript:void(0)">数据恢复</a>
						</li>
					</ul>
				</dd>
			</dl>
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active"><span title="我的桌面" data-href="welcome.jsp">我的桌面</span><em></em>
					</li>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i>
				</a><a id="js-tabNav-next" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i>
				</a>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display:none" class="loading"></div>
				<iframe scrolling="yes" frameborder="0"
					src="<%=path%>/admin/welcome"></iframe>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="<%=path%>/back/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/back/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript"
		src="<%=path%>/back/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="<%=path%>/back/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		/*资讯-添加*/
		function article_add(title, url) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*图片-添加*/
		function picture_add(title, url) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*产品-添加*/
		function product_add(title, url) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*用户-添加*/
		function member_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
	</script>
	<script type="text/javascript">
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s)
		})();
		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
				: " http://");
		document
				.write(unescape("%3Cscript src='"
						+ _bdhmProtocol
						+ "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
	</script>
</body>
</html>