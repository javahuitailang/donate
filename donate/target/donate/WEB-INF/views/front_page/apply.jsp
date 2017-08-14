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
<script type="text/javascript" src="<%=path%>/js/bioV4.min.js"></script>

<!-- 引入fck组件 -->
<script type="text/javascript"
	src="<%=path%>/res/fckeditor/fckeditor.js"></script>

<script type="text/javascript"
	src="<%=path%>/js/jquery.lazyload.mini.js"></script>
<script type="text/javascript" src="<%=path%>/js/dyfrom.js"></script>
<title>申请求助</title>
<meta name="Keywords" content="申请求助" />
<meta name="Description" content="申请求助" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/style/tzjg_write.css" />

<link rel="stylesheet" href="<%=path%>/res/common/css/style.css"
	type="text/css"></link>

<link rel="stylesheet" href="<%=path%>/res/common/css/theme.css"
	type="text/css"></link>

<script type="text/javascript" src="<%=path%>/res/common/js/com.js"></script>
<!--编辑器开始-->

<!--编辑器结束-->

<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<script type="text/javascript" src="<%=path%>/js/tzjg_write.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]-->


<script type="text/javascript">
$(function(){
	$("#tabs a").each(function(){
		if($(this).attr("class").indexOf("here") == 0){
			var ref = $(this).attr("ref");
			if(ref == '#tab_1'){
				//创建一个fck编辑器
				var fck = new FCKeditor("helpdesc");
				//重写原本fck的一些默认设置
				fck.BasePath = "<%=basePath%>res/fckeditor/";
				fck.Config["ImageUploadURL"] = "${pageContext.request.contextPath}/apply/fckUpload";
				fck.Height = 600 ;
				fck.Width = 700;
				fck.ReplaceTextarea();
			}
		}	
	});
});

</script>


<style type="">
.h2_ch a:hover,.h2_ch a.here {
	font-weight: bold;
	background-position: 0px -32px;
}

.h2_ch a {
	float: left;
	height: 32px;
	margin-right: -1px;
	padding: 0px 16px;
	line-height: 32px;
	font-size: 14px;
	font-weight: normal;
	border: 1px solid #C5C5C5;
	background: url('res/itcast/img/admin/bg.png') repeat-x scroll 0% 0%
		transparent;
}

a {
	color: #06C;
	text-decoration: none;
}
</style>

<script type="text/javascript">
	//金额校验
	$(function(){
		$("#inputmoney").blur(function(){
			$("#successMoney span").remove();
			var value = $("#inputmoney").val();
			if(value==''){
				var $err = $('<span class="tip errorTip">请输入金额&nbsp;</span>');
				$("#successMoney").append($err);
			}else{
				var $su = $('<span class="tip okTip">&nbsp;</span>');
				$("#successMoney").append($su);
			}  
		});
	});
</script>


<script type="text/javascript">
	//标题校验
	$(function(){
		$("#inputTitle").blur(function(){
			$("#successTitle span").remove();
			var value = $(this).val();
			if(value==''){
				var $err = $('<span class="tip errorTip">请输入标题&nbsp;</span>');
				$("#successTitle").append($err);
			}else{
				var $su = $('<span class="tip okTip">&nbsp;</span>');
				$("#successTitle").append($su);
			} 
		});
		
	});

</script>

<script type="text/javascript">
	
	$(function(){
		//钱的校验
		$("#inputmoney").keyup(function () {
                var reg = $(this).val().match(/\d+\.?\d{0,2}/);
                var txt = '';
                if (reg != null) {
                    txt = reg[0];
                }
                $(this).val(txt);
            }).change(function () {
                $(this).keyup();
            });
	});
	
</script>

<script type="text/javascript">
    //提交表单
	function toSubmit(flag){
			var way = flag;
			//提交之前从新校验一遍，防止无耻提交
			
				var money = $("#inputmoney").val();
				var title = $("#inputTitle").val();
				
				if(money == ''){
						$("#successMoney span").remove();
						var $err1 = $('<span class="tip errorTip">请输入金额&nbsp;</span>');
						$("#successMoney").append($err1);
						}
				if(title == ''){
						$("#successTitle span").remove();
						var $err2 = $('<span class="tip errorTip">请输入标题&nbsp;</span>');
						$("#successTitle").append($err2);
					}
				else{
					$("#successMoney span").remove();
					$("#successTitle span").remove();
					var $su1 = $('<span class="tip okTip">&nbsp;</span>');
					$("#successMoney").append($su1);
					var $su2 = $('<span class="tip okTip">&nbsp;</span>');
					$("#successTitle").append($su2);
				}
			
			$("#inputmoney").blur();
			$("#inputTitle").blur();			
			//获取所有的错误信息
			var text1 = $("#successMoney span").attr("class");
			var text2 = $("#successTitle span").attr("class");
			
			//获取fck编辑器中的内容
			var oEditor = FCKeditorAPI.GetInstance("helpdesc");  //name值
 			var checkContent = oEditor.GetXHTML();
 			
			if(text1 == 'tip errorTip' || text2 == 'tip errorTip' || checkContent == ''){
				alert("你还有一些未填项");
				return way;
			}else{
				//进行提交操作
				way = true;
				return way;
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
						<h4 class="mmh4">申请求助页面</h4>

						<form id="jvForm" class="form"
							action="${pageContext.request.contextPath}/apply/applyHelp"
							method="post" onsubmit="return toSubmit(false)">

							<div class="basic">请认真填写以下内容</div>
					 
							<div class="control-group">
								<label class="control-label" for="inputName"> 预期筹集金额
									<p class="text-error">必填项</p> </label>

								<div class="controls">
									<input id="inputmoney" type="text" name="goalMoney" value=""
										placeholder="请填写金额,只能是数字" class="input-xlarge placeholder on"
										maxlength="10" rel="input-text" style="ime-mode:disabled">元</input>
									<span class="help-inline"> </span>
									<!-- class="text-error"  -->
									<span class="pos" id="successMoney"></span>
								</div>

								<div class="mmclear"></div>
							</div>

							<div class="control-group">
								<label class="control-label" for="inputName"> 求助标题
									<p class="text-error">必填项</p> </label>
								<div class="controls">
									<input id="inputTitle" type="text" name="title" value=""
										placeholder="请填写中文简介,最多十个字"
										class="input-xlarge placeholder on" maxlength="10"
										rel="input-text" /> <span class="help-inline"></span> <span
										class="pos" id="successTitle"></span>
								</div>
								<div class="mmclear"></div>
							</div>


							<div class="control-group ">
								<label class="control-label" for="textAbstract"> 求助内容
									<p class="text-error">必填项</p> </label>
								<div class="controls">

									<h2 class="h2_ch" style="display: none;">
										<span id="tabs"> <a href="javascript:void(0);" ref="#tab_1" title="" class="here" ></a> </span>
									</h2>
									<span class="help-inline"></span>
									<table cellspacing="1" cellpadding="2" width="100%" border="0"
										class="pn-ftable">
										<tbody id="tab_1">
											<tr>
												<td><textarea style="width:700px;height:600px;"
														rows="10" cols="10" id="helpdesc" name="content"
														placeholder="请填写您详细的求助信息，建议大于100字。介绍的越详细，越容易得到网友和投资人关注哦。">
															</textarea>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<div class="mmclear"></div>

							<div class="basic"
								style="border-top:1px solid #ccc; text-align:right; margin-left:15px; padding:10px 0px 5px 0px;">

								<input type="image" src="<%=path%>/images/blutbottom.jpg"
									value="" style="width:81px; height:46px;" />

							</div>
							<div class="mmclear"></div>
						</form>
					</div>
				</div>
				<div class="body-box">
					<!--  style="float:right" -->
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
	<jsp:include page="/public/footer.jsp"></jsp:include>
</body>
</html>
