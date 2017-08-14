<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="<%=path%>/js/bioV4.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery.lazyload.mini.js"></script>
<script type="text/javascript" src="<%=path%>/js/dyfrom.js"></script>
<title>个人资料维护</title>
<meta name="Keywords" content="个人资料维护" />
<meta name="Description" content="个人资料维护" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/xm_write.css" />
<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<script type="text/javascript" src="<%=path%>/js/xm_write.js"></script>

<link rel="stylesheet" href="<%=path%>/res/common/css/style.css"
	type="text/css"></link>

<link rel="stylesheet" href="<%=path%>/res/common/css/theme.css"
	type="text/css"></link>

<script type="text/javascript" src="<%=path%>/res/common/js/com.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]-->

<!-- jquery异步上传图片插件 -->
<script type="text/javascript"
	src="<%=path%>/res/common/js/jquery.form.js"></script>


<script type="text/javascript">

	//上传头像
	function fileChange(){
			
			$("#jvForm").ajaxSubmit({
					url : '${pageContext.request.contextPath}/homepage/upload',
					dataType : "json",
					type : 'post',
					success :function(backdata){
						$("#allImgUrl").attr("src",backdata.url);
						$("#path").val(backdata.path);
				}
			});
	}
</script>
<script type="text/javascript">
	$(function(){
		//身份证号校验
         $("#inputIdNum").blur(function(){
         	var value = $(this).val();
         	if(!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(value))){
         		$(this).parent().parent().removeClass("success");
         		$(this).parent().parent().addClass("error");
         	}else{
         		$(this).parent().parent().removeClass("error");
         		$(this).parent().parent().addClass("success");
         	}
         });
	});

</script>
<script type="text/javascript">

			/**
			* 提交
			*/
		function toSubmit(bb){
			//提交之前先校验是否有未填项
			var flag = bb;
			//获取头像路径
			var picPath = $("#allImgUrl").attr("src");
			if(picPath == 'http://localhost:8080/donate/picture/'){
				alert("你头像还未上传");
				return flag;
			}else{
					var s1 = document.getElementById("inputPhone");
					s1.focus();
					
					var s2 = document.getElementById("inputWebsite");
					s2.focus();
					
					var s3 = document.getElementById("inputIdNum");
					s3.focus();
					
					var s4 = document.getElementById("inputNeedtail");
					s4.focus();
					
					var s5 = document.getElementById("inputName");
					s5.focus();
					
					var s6 = document.getElementById("inputEmail");
					s6.focus();
					s6.blur();
			
					//获取电话输入框的错误信息
					var errorPhone = $("#inputPhone").parent().parent().attr("class");
					
					//获取真实名字输入框中的错误信息
					var errorWebsite = $("#inputWebsite").parent().parent().attr("class");
					
					//获取身份证号输入框中的错误信息
					var errorProductClass = $("#inputIdNum").parent().parent().attr("class"); 
					
					//获取地址输入框中的样式
					var addressClass = $("#inputNeedtail").parent().parent().attr("class");
					
					var nameClass = $("#inputName").parent().parent().attr("class");
					
					var emailClass = $("#inputEmail").parent().parent().attr("class");
					
					 // || errorProductClass!= 'success' || addressClass != 'success'
					if(nameClass != "control-group success" 
									||emailClass != "control-group success" 
									||errorPhone != "control-group success" 
									|| errorWebsite != "control-group success" 
									|| errorProductClass != "control-group success" 
									|| addressClass != "control-group success"){
							
							alert("你还有未填项");
							return flag;
					}else{
						
							//提交
							return true;
					}
			
			
			}
		
	}

	
</script>


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
	<div class="container pb-15">
		<!-- Example row of columns -->
		<div class="row">
			<div class="span12">
				<!--内容页面-->
				<div class="label-div b-30 border-all pt-5 t-20"
					style="position: relative; padding-left: 0;">
					<div class="txmd">
						<h4 class="mmh4"></h4>
						<h4 class="mmh4">个人资料维护</h4>
						<form id="jvForm" method="post"
							action="${pageContext.request.contextPath}/homepage/complementInf"
							onsubmit="return toSubmit(false)" enctype="multipart/form-data">
							<div class="basic">您的个人资料</div>

							<div class="control-group">
								<label class="control-label" for="avatarUpload"> 上传头像
									<p class="text-error">必填项</p> </label>
								<div class="controls">
									<div id="avatarUpload">
										<img id="allImgUrl" src="${user.headPhoto}"
											rel="img-target-avatar" data-value="0"
											data-check="eb1ae6331b63d1ad95006586c4add55b"
											class="active img-target img-on" /> <span class="help-inline"></span>
									</div>
									<input type="hidden" name="photo" id="path"
										value="${user.photo}" /> <input type="file" id="uphototx"
										name="multipartFile" onchange="fileChange();"
										style="display:none;" />
									<button type="button" modal-target="#img-modal"
										rel="ajax-upload-avatar" class="btn btn-primary uploadphoto"
										onclick="uphoto()">上传头像</button>
									<p></p>
									<span class="help-block">
										请上传jpg/jpeg/png/gif格式文件，文件小于1MB </span>
								</div>

								<div class="mmclear"></div>
							</div>

							<div class="control-group">
								<label class="control-label" for="inputName"> 用户名 </label>
								<div class="controls">
									<input id="inputName" type="text" name="userName"
										value="${user.userName }" placeholder=" "
										class="input-xlarge placeholder on" maxlength="10"
										rel="input-text" /> <span class="help-inline"> </span>
								</div>
								<div class="mmclear"></div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputEmail"> E-mail
									<p class="text-error"></p> </label>
								<div class="controls">
									<input id="inputEmail" type="text" placeholder=" "
										value="${user.email }" class="input-xlarge placeholder on"
										rel="input-email" /> <span class="help-inline"></span>
								</div>
								<div class="mmclear"></div>
							</div>
							-->
							<div class="control-group">
								<label class="control-label" for="inputPhone"> 联系电话
									<p class="text-error">必填项</p> </label>
								<div class="controls">
									<input type="text" id="inputPhone" value="${user.tel }"
										placeholder="请填写真实手机号，我们会联系您确认信息" maxlength="30" name="tel"
										rel="input-phone" class="input-xlarge placeholder on" /> <span
										class="help-inline"></span>
								</div>
								<div class="mmclear"></div>
							</div>

							<div class="control-group ">
								<label class="control-label" for="inputWebsite"> 真实姓名
									<p class="text-error">必填项</p> </label>
								<div class="controls">
									<input id="inputWebsite" name="realName" type="text"
										value="${user.realName }" placeholder="真实姓名"
										class="input-xlarge on placeholder" maxlength="100"
										rel="input-url" /> <span class="help-inline"></span>
								</div>
								<div class="mmclear"></div>
							</div>

							<div class="control-group ">
								<label class="control-label" for="inputProductName">
									身份证号
									<p class="text-error">必填项</p> </label>
								<div class="controls">
									<input id="inputIdNum" type="text" value="${user.idCard }"
										name="idCard" placeholder="填写15或18位身份证号码"
										class="input-xlarge on check-exist placeholder" maxlength="30"
										rel="input-text" /> <span class="help-inline"></span>
								</div>
								<div class="mmclear"></div>
							</div>

							<div class="control-group ">
								<label class="control-label" for="inputProductWeibo"> 性别

								</label>
								<div class="controls">

									<c:if test="${user.sex==0 }">
										<label class="radio-inline"> <input type="radio"
											name="sex" id="inlineRadio1" value="0" checked="checked" /> 男
										</label>

										<label class="radio-inline"> <input type="radio"
											name="sex" id="inlineRadio2" value="1" /> 女 </label>
									</c:if>
									<c:if test="${user.sex==1 }">
										<label class="radio-inline"> <input type="radio"
											name="sex" id="inlineRadio1" value="0" /> 男 </label>

										<label class="radio-inline"> <input type="radio"
											name="sex" id="inlineRadio2" value="1" checked="checked" /> 女
										</label>
									</c:if>

									<span class="help-inline"></span>
								</div>


								<div class="mmclear"></div>
							</div>


							<div class="control-group ">
								<label class="control-label" for="inputNeedtail"> 详细地址
									<p class="text-error">必填项</p> </label>
								<div class="controls">

									<textarea id="inputNeedtail" type="text"
										class="input-xlarge placeholder on" maxlength="45"
										rel="text-area" name="address">${user.address }</textarea>
									<span class="help-inline"></span>
									<p>
										还可输入<span rel="inputNeedtail" class="myhelp-inline" id="hnum">45</span>字
									</p>
								</div>
								<div class="mmclear"></div>
							</div>


							<div class="control-group">
								<div class="controls">
									<span class="help-block center fs16" rel="form-help"></span>
								</div>
								<div class="mmclear"></div>
							</div>

							<div class="basic"
								style="border-top:1px solid #ccc; text-align:right; margin-left:15px; padding:10px 0px 5px 0px;">
								<input type="image" src="<%=path%>/images/blutbottom.jpg"
									value="" style="width:81px; height:46px;" />
							</div>
							<div class="mmclear"></div>
						</form>

					</div>
				</div>
				<!--右侧代码-->

				<!--右侧代码结束-->
			</div>
		</div>
		<!-- /container -->
		<div class="container">
			<div class="hr"></div>
		</div>
		<!-- /container -->
	</div>

	<!--尾部开始-->

	<!--尾部结束-->

</body>
</html>
