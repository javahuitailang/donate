<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>在线捐款平台-登录</title>
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<!-- Le styles -->
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/login.css" />
<script type="text/javascript" src="<%=path%>/js/bioV4.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery.lazyload.mini.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/comment.css" />
<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js?v=20130220"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]-->
<link type="text/css" rel="stylesheet"
	href="<%=path%>/style/biobox2.css" />
<script type="text/javascript" src="<%=path%>/js/biobox.js"></script>
<%-- <script type="text/javascript" src="<%=path%>/js/checkName.js"></script> --%>
<script type="text/javascript" src="<%=path%>/js/checkRegister.js"></script>

<script type="text/javascript">
	function sendCode(){
		var d = $("#UcenterMember_email").val();
		
		var name = $("#usernameEle").val();
		var rurl = '<%=path%>/user/sendCode';
		$.ajax({
			url : rurl ,
			method : 'post',
			data : {
				"email" : d,
				"name"  :name
			},
			dataType : "json",
			success : function(backdata){
				alert(backdata.msg);
			}
		});
	}
</script>
<script type="text/javascript" language="javascript">
		//重新获取验证字符
		function changeImage() {
			//单击触发图片重载事件，完成图片验证码的更换
			document.getElementById("imgRandom").src = document
					.getElementById("imgRandom").src
					+ '?';
		}
	</script>
<%-- <script type="text/javascript" language="javascript">
	function validate(){
		var obj = $("#usernameEle");
		var span = document.getElementById("erroSpan");
		//alert("111");
    	var userName = obj.val();
    	//alert(userName);
    	var urlr = '<%=path%>/user/getName';
	    $.ajax({
	        method:'POST',   //http请求方式
	        url:urlr, //发送给服务器的url
	        data:{
	        	"userName" : userName, //发送给服务器的参数
	        },
	        dataType:"json",  
	        success:function(backdata){
				//alert(backdata.msg);
				if(backdata.msg=="用户名可以使用"){
					span.innerHTML = "<span style=' color:green;'><img height='15px' width='15px' src='<%=path%>/images/login-register/1.png'/>"+backdata.msg+"</span>";
				}else{
					span.innerHTML = "<span style=' color:red;'><img height='15px' width='15px' src='<%=path%>/images/login-register/2.png'/>"+backdata.msg+"</span>";
				}
			}
	    });
	}
	</script> --%>


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

	<h5 style="margin-left:3%">
		<font color="red">${erro}</font>
	</h5>

	<div class="container pb-15">
		<!-- Example row of columns -->
		<div class="row">
			<div class="span16">
				<!-- 	<div class="label-public-title t-30">
					<ul class="clearfix">
						<li class="pull-left r-20 border-all"><a href="javascript:;"
							title="登录">登录</a>
						</li>
						<li class="pull-left selected border-all"><a
							href="javascript:;" title="注册" style="_padding: 0;">注册</a>
						</li>
					</ul>
				</div> -->
				<div class="label-div t-15 border-all"
					style="padding: 0;margin-top: 15px">
					<div class="label-main">
						<div class="clearfix label-public pt-25">
							 

							<div class="clearfix" id="register-mail">

								<h5>
									<font color="red">${erro}</font>
								</h5>

								<form enctype="multipart/form-data" id="register-form"
									action="<%=path%>/user/registerOut" method="post"
									onsubmit="return regs('click')">
									<div class="pull-left public-login span10">
										<div class="clearfix pl-25 pt-25">
											<div class="title pull-left fc999">昵称:</div>
											<!-- onchange="validate()" -->
											<input style="margin-left:2.8%" class="span4" name="userName"
												id="usernameEle" type="text" maxlength="32" /> <span
												style="margin-left:2%" class="start1" id="erroSpan"><img
												height="15px" width="15px"
												src="<%=path%>/images/login-register/3.png" />请输入您的个性化昵称</span>
										</div>
										<div class="clearfix pl-25 pt-25">
											<div class="title pull-left fc999">邮箱:</div>

											<input style="margin-left:2.8%" class="span4" name="email"
												id="UcenterMember_email" type="text" maxlength="128" /> <span
												style="margin-left:2%" class="start1"><img
												height="15px" width="15px"
												src="<%=path%>/images/login-register/3.png" />请输入邮箱</span>
										</div>
										<div class="clearfix pl-25 pt-25">
											<div class="title pull-left fc999">性别:</div>
											<select name="sex" style="margin-left: 2.8%">
												<option value="0">女</option>
												<option value="1">男</option>
											</select>
										</div>

										<!-- <div class="clearfix pl-25 pt-25">
											<div class="title pull-left fc999">验证码:</div>
											<div class="pull-left l-20"
												style="_margin-left: 0;_width: 100px;">
												<input class="span2" name="code" id="code" type="text"
													maxlength="10" />
											</div> -->

										<!-- 发送邮件 -->
										<!-- <div class="clearfix pl-25 pt-25" style="margin-left:10%">
											<span class="pull-left l-20 fc999 info email_msg"> <input
												type="button" id="btnID" value="发送验证码" onclick="sendCode();" />
											</span>
										</div> -->

										<div class="clearfix pl-25 pt-25">
											<div class="title pull-left fc999">密码:</div>

											<input style="margin-left:2.8%" type="password"
												id="UcenterMember_password1" name="password" class="span4" />
											<span style="margin-left:2%" class="start1"><img
												height="15px" width="15px"
												src="<%=path%>/images/login-register/3.png" />请输入密码</span>
										</div>
										<div class="clearfix pl-25 pt-25">
											<div class="title pull-left fc999">确认密码:</div>

											<input style="margin-left:2.8%" type="password"
												id="UcenterMember_password2" name="checkPassword"
												class="span4" /> <span style="margin-left:2%"
												class="start1"><img height="15px" width="15px"
												src="<%=path%>/images/login-register/3.png" />请再输入密码</span>
										</div>
										<div class="clearfix pl-25 pt-25">
											<div class="title pull-left fc999"
												style="width: 60px;margin-left:2.3%">验证码</div>
											<div class="pull-left l-20">
												<input type="text" id="code" name="code" class="span2" />
											</div>
											<a href="#" onclick="changeImage();return false;"
												style="font-size: 13px;margin-top:10%"> <img
												style=" margin-left: 5%" id="imgRandom"
												src="<%=path%>/user/getCode.do" onclick="changeImage()" />看不清验证码，再点击一次</a>

										</div>
										<div class="clearfix pl-25 pt-25">
											<div class="title pull-left">&nbsp;</div>
											<div class="pull-left l-20 t-8"
												style="_width: auto;_margin-left: 15px;">
												<input type="checkbox" checked="checked"
													style="_width: 20px;_margin: 0;" />
											</div>
											<span class="pull-left l-5 info fc999"
												style="_width: auto;_margin: 0;">我已阅读并接受<a
												href="/agreement.html" title="生物探索服务条款协议" target="_blank">在线捐款平台协议</a>
											</span>
										</div>
										<div class="clearfix pl-25 pt-25 pb-30">
											<div class="title pull-left l-20" style="_margin-left: 10px;">&nbsp;</div>
											<input type="submit" value="注册" /> <input type="reset"
												value="重置" />
											<!-- <a href="javascript:void(0);" title="注册"
												class="pull-left login-register-btn">注&nbsp;册</a> -->
											<!-- <span class="pull-left l-20 info fc999"
												style="_width: auto;_margin: 0 0 0 10px;">社会化账号<a
												class="l-5 sina-register-button" href="javascript:void(0)"
												title="注册">注册</a> </span> -->
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


	<jsp:include page="/public/footer.jsp"></jsp:include>

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