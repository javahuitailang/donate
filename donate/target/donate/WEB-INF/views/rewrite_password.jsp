<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN" />
<script type="text/javascript" src="<%=path%>/js/jquery1.4.js"></script>
<title>在线捐款平台-找回密码</title>
<meta name="Keywords" content=""/>
<meta name="Description" content=""/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<!-- Le styles -->
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/style/login.css"/>
<script type="text/javascript" src="<%=path%>/js/bioV4.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.lazyload.mini.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/style/comment.css"/>
<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js?v=20130220"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]--> 
<link type="text/css" rel="stylesheet" href="<%=path%>/style/biobox2.css" />
<script type="text/javascript" src="<%=path%>/js/biobox.js"></script>
</head>
<body>
<script type="text/javascript" src="<%=path%>/js/borsertocss.js"> </script><!-- 判断在IE9以下浏览器中根据像素的不同而设置的样式 -->	
   



 <!--头部代码开始-->
	<jsp:include page="/public/head.jsp"></jsp:include>
	
<!--头部代码结束-->
	<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
	<div class="container pb-15">
	<!-- Example row of columns -->
	<div class="row">
		<div class="span16">
		 
			<div class="label-div t-15 border-all" style="padding: 0;">
				<div class="label-main">
					<div class="clearfix label-public pt-25">
						 
                        
                        <div class="clearfix" id="register-mail" >
							<form enctype="multipart/form-data" id="register-form" action="<%=path %>/user/updatePassWord" method="post">		
							<input type="hidden" value="${userName}"name="userName"/>
							<div class="pull-left public-login span10">
					   
								
								<div class="clearfix pl-25 pt-25">
									<div class="title pull-left fc999">密码</div>
									<div class="pull-left l-20" style="_margin-left: 0;_width: 100px;"><input type="password" id="UcenterMember_password1" name="password"  class="span4"/></div>
									<span class="pull-left l-20 fc999 info password_msg">密码最小值为6位（字母区分大小写）</span>
								</div>
								<div class="clearfix pl-25 pt-25">
									<div class="title pull-left fc999">确认密码</div>
									<div class="pull-left l-20" style="_margin-left: 0;_width: 100px;"><input type="password" id="UcenterMember_password2" name="checkPassword" class="span4"/></div>
									<span class="pull-left l-20 fc999 info password_msg">请再次输入密码</span>
								</div>
							 
							 
								<div class="clearfix pl-25 pt-25 pb-30">
									<div class="title pull-left l-20" style="_margin-left: 10px;">&nbsp;</div>
									<input type="submit" value="确认修改" />
								 
								</div>
							</div>
							 
							</form>						
                          </div>
						 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- /container -->
 <div class="container">
 
 	<div class="hr"></div>
    
    </div>
  
<!-- /container -->


	</div>
     
 
<div class="footer">
		 
			<!--<p class="fc999 b-5 footer-info">致力于前沿生物科技和成功商业模式的传播</p>-->
			<div class="clearfix" style="background:#EDEDED;">
				
                <!--<p class="fc999 pull-left footer-info">Copyright © 2013 生物探索网站<span class="l-20">苏ICP备11025281号</span></p>-->
				
                <ul class="about-ul">
					<li>客服电话 400-100-8884 - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a></li>
					<li><span>|</span></li>
					<li><a title="广告投放" href="javascript:;" class="fc666" target="_blank">广告投放</a></li>
					<li><span>|</span></li>
					<li><a title="企业服务" href="javascript:;" class="fc666" target="_blank">企业服务</a></li>
					<li><span>|</span></li>
					<li><a title="公司博客" href="javascript:;" class="fc666" target="_blank" >公司博客</a></li>
					<li><span>|</span></li>
					<li><a title="加入我们" href="javascript:;" class="fc666" target="_blank">加入我们</a></li>
					<li><span>|</span></li>
					<li><a title="服务协议" href="javascript:;" class="fc666" target="_blank">服务协议</a></li>
					<li><span>|</span></li>
                     <li id="zk_btn" class="ie6png down-class">
                   	 <a title="友情链接" href="javascript:void(0);" class="fc666">友情链接</a>
                    </li>
				    <div class="clear"></div>
				</ul>
			</div>
    
  			<div class="friend-link border-all t-20 b-20">
		<ul class="clearfix">
		
	</ul>
</div>
  <script type="text/javascript">
	$(document).ready(function(){
		var flag = 0;
		$(".friend-link").hide();
		//Down
		$("#zk_btn").click(function(){
			if(flag == 0){
				$(".friend-link").slideDown(400); 
				$(this).removeClass('down-class');
				$(this).addClass('up-class');
				$("html,body").animate({scrollTop:($(".friend-link").offset().top+2000)},600);
				flag = 1;
			}else{
				$(".friend-link").slideUp(400);  
				$(this).removeClass('up-class');
				$(this).addClass('down-class'); 
				flag = 0;
			}
		});
	});
</script>
<p>Copyright ©2013　　备8888888888号</p>
    
		</div> 
 
 
<script type="text/javascript">backToTop('body');</script>
 

<script type="text/javascript">
$(document).ready(function(){
	$(".email-register-button").click(function(){
		$("#register-mail").fadeIn();
		$("#register-third").hide(); 
		$('#UcenterMember_account').focus();
	});
	$(".sina-register-button").click(function(){
		$("#register-mail").hide();
		$("#register-third").fadeIn(); 
	});
});

$('input').keydown(function(event){  
	if(event.keyCode == 13)submit_form('.login-register-btn');
});
 

</script>

 
</body>
</html>