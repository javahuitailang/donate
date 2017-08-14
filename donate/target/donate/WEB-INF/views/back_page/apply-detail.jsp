<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="<%=path%>/back/lib/html5.js"></script>
<script type="text/javascript" src="<%=path%>/back/lib/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/back/lib/PIE_IE678.js"></script>
<![endif]-->

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=path%>/back/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/jquery.validation/1.14.0/messages_zh.min.js"></script> 
<script type="text/javascript" src="<%=path%>/back/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=path%>/back/static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=path%>/back/lib/My97DatePicker/WdatePicker.js"></script>  
<script type="text/javascript" src="<%=path%>/back/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="<%=path%>/back/lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="<%=path%>/back/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>


<link rel="stylesheet" type="text/css" href="<%=path%>/back/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=path%>/back/static/h-ui.admin/css/style.css" />

<script type="text/javascript" src="<%=path%>/res/fckeditor/fckeditor.js"></script>


<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

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



<title>求助申请详情 - 项目管理 </title>
<meta name="keywords" content=" ">
<meta name="description" content=" ">
</head>
<body>
<article class="page-container">
	<form name="form" action="" method="post" class="form form-horizontal" id="form-article-add">
		<input type="hidden" id="id" name="id" value="${apply.id }"/>
		<input type="hidden" id="pageCurrent" name="pageCurrent" value="${pageCurrent }"/>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">申请人：</label>
			<div class="formControls col-xs-8 col-sm-3">
				<input type="text" readonly="readonly" class="input-text" value="${apply.recipient.userName }" placeholder="" id="" name="recipient.userName">
			</div>
			<label class="form-label col-xs-4 col-sm-2">身份证号码：</label>
			<div class="formControls col-xs-8 col-sm-3">
				<input type="text" readonly="readonly" class="input-text" value="${apply.recipient.idCard }" placeholder="" id="" name="recipient.idCard">
			</div>
		</div>
		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">联系电话：</label>
			<div class="formControls col-xs-9 col-sm-3">
				<input type="text" readonly="readonly" class="input-text" value="${apply.recipient.tel }" placeholder="" id="" name="recipient.tel">
			</div>
			
			<label class="form-label col-xs-4 col-sm-2">联系邮箱：</label>
			<div class="formControls col-xs-9 col-sm-3">
				<input type="text" readonly="readonly" class="input-text" value="${apply.recipient.email }" placeholder="" id="" name="recipient.email">
			</div>
		</div>
		
 
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">详细地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly="readonly" class="input-text" value="${apply.recipient.address }" placeholder="" id="" name="recipient.address">
			</div>
		</div>
		
 
		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">预筹金额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${apply.goalMoney }" placeholder="" id="" name="goalMoney">
			</div>
		</div>
	 
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">项目标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${apply.title }" placeholder="" id="" name="title">
			</div>
		</div>
		
		
	 
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">文章内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				
				<h2 class="h2_ch">
   					<span id="tabs">
						<a href="javascript:void(0);" ref="#tab_1" title="求助详情" class="here"></a>
					</span>
				</h2>
				<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
						<tbody id="tab_1">
								<tr>
										<td >
											<textarea  style="width:700px;height:600px;" rows="10" cols="10" id="helpdesc" name="content"
												placeholder="请填写您详细的求助信息，建议大于100字。介绍的越详细，越容易得到网友和投资人关注哦。" >
												${apply.content}
											</textarea> 
										</td>
									</tr>
						</tbody>
					</table>
				<!-- 屏蔽自带的编辑器
				<script id="editor"  type="text/plain" style="width:100%;height:400px;">${apply.content }</script> 
				-->
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button type="submit" id="adopt"  class="btn btn-primary radius" ><i class="Hui-iconfont">&#xe632;</i> 通过审核</button>
				 <button type="submit" id="refuse"  class="btn btn-danger radius" ><i class="Hui-iconfont">&#xe632;</i> 拒绝申请</button>
				<button type="submit" id="back" class="btn btn-default radius" type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;</button>
			</div>
		</div>
		
	</form>
	
</article>



<script type="text/javascript">

	//通过申请
	document.getElementById("adopt").onclick = function(){
		var id = ${apply.id};
		var pageCurrent = ${pageCurrent};
		document.form.action="${pageContext.request.contextPath}/bApply/editThenAdoptApply.action?pageCurrent="+pageCurrent;
		document.form.submit();
	}
	

	//拒绝申请
	document.getElementById("refuse").onclick = function(){
		//alert("xxx");
		var id = ${apply.id};
		//window.location.href="${pageContext.request.contextPath}/bApply/refuseApplyById.action?id="+id;
		var pageCurrent = ${pageCurrent};
		//alert(pageCurrent);
		document.form.action="${pageContext.request.contextPath}/bApply/refuseApplyById.action?id="+id+"&pageCurrent="+pageCurrent;
		document.form.submit();
	}
	
	//返回
	document.getElementById("back").onclick = function(){
		var pageCurrent = ${pageCurrent};
		//alert(pageCurrent);
		document.form.action="${pageContext.request.contextPath}/bApply/getAllApplys.action?pageCurrent="+pageCurrent;
		document.form.submit();
	}

</script>






<%-- <script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: '<%=path%>/back/lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: 'fileupload.php',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',
	
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
	
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
	
	var ue = UE.getEditor('editor');
	
});
</script> --%>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>