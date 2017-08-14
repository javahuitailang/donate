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
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN" />
<script type="text/javascript" src="<%=path%>/js/jquery1.4.js"></script>
<script type="text/javascript" src="<%=path%>/js/bioV4.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.lazyload.mini.js"></script>
<title>捐款对象列表</title>
<meta name="Keywords" content="捐款对象列表"/>
<meta name="Description" content="捐款对象列表"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="<%=path%>/style/basic.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/style/tzjg_list.css"/>
<script type="text/javascript" src="<%=path%>/js/function.js"></script>
<script type="text/javascript" src="<%=path%>/js/tzjg_list.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/js/DD_belatedPNG.js?v=20130220"></script>
<script type="text/javascript">
DD_belatedPNG.fix('img,.ie6png');
</script>
<![endif]-->
</head>
<body>
<script type="text/javascript" src="<%=path%>/js/borsertocss.js"> </script>
<!-- 判断在IE9以下浏览器中根据像素的不同而设置的样式 -->
<!--头部代码开始-->
<jsp:include page="/public/head.jsp"></jsp:include>

<!--头部代码结束-->
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
<div class="container pb-15">
  <!-- Example row of columns -->
  <div class="row">
    <div class="span12">
      <!--搜索-->
      <div class="clearfix">
        <div class="pull-left classifyDIV pt-10 my1D6597">捐赠对象  </div>
        <div class="pull-right t-20 classifySearch" style="position: relative;">
          <form action="" method="get" style="margin:0px; padding:0px;">
            <input id="search-input" type="text" class="search-input pull-left span4" value=""/>
            <a href="javascript:void(0);" title="搜索" class="search-btn-css pull-left search-btn"></a>
          </form>
        </div>
      </div>
      <!--搜索结束-->
 
      <div class="mylistshow b-20 t-20 " id="mmlistshow2">
        
        <dl class="mydllist">
          <dd>筛选条件：</dd>
		
          <dd class="selected"><span class="ml"></span><span class="mm"><a href="">全部</a></span><span class="mr"></span></dd>
          <dd><span class="ml"></span><span class="mm"><a href="">最新创建</a><i>15</i></span><span class="mr"></span></dd>
          <dd><span class="ml"></span><span class="mm"><a href="">男</a><i>15</i></span><span class="mr"></span></dd>
          <dd><span class="ml"></span><span class="mm"><a href="">女</a><i>15</i></span><span class="mr"></span></dd>
        </dl>
        <div class="mmclear"></div>
      </div>
 
      <!--列表开始-->
	  
      <!--第一个-->
      <div class="label-div b-30 border-all pb-20 pt-5" style="position: relative; padding-left: 0;">
        <div class="pl-20" style="margin-left: 1px;margin-top: 3px;"> <a class="fc1D6597" title="个人" href="javascript:;">个人</a> </div>
        <div class="news-list">
          <div class="clearfix pt-3">
            <div class="index-news-img spanm3 pull-left pt-5"> 
				<a href="javascript:;" title=" " target="_blank" rel="bookmark"> 
					<img class="lazyloadimg" alt=" " src="<%=path%>/images/1.jpg"/> 
				</a> 
			</div>
            <div class="offset3 intro">
				<div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"><i class="m"> 姓名：<a title="张三" target="_blank" href="javascript:;">张三</a></i></div>
              </div>
	 
              <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m"> 性别：男 </i> <i class="m"> 联系电话：18770912123 </i> <i class="m">联系邮箱：coding2u@163.com</i> </div>
              </div>
			   <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m"> 身份证号：360734199111233254 </i>  </div>
              </div>
              <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m"> 详细地址：江西省南昌市李渡镇GG乡101号 </i> </div>
              </div>
			  <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m">创建时间：2016-11-24</i>  </div>
				<a href="javascript:;" title="求助详情" target="_blank" rel="bookmark" class="read-all pull-right">求助详情</a>
              </div>
              
            </div>
          </div>
        </div>
      </div>
      <!--第一个结束-->
	  
       
		
		<div class="label-div b-30 border-all pb-20 pt-5" style="position: relative; padding-left: 0;">
        <div class="pl-20" style="margin-left: 1px;margin-top: 3px;"> <a class="fc1D6597" title="个人" href="javascript:;">个人</a> </div>
        <div class="news-list">
          <div class="clearfix pt-3">
            <div class="index-news-img spanm3 pull-left pt-5"> 
				<a href="javascript:;" title=" " target="_blank" rel="bookmark"> 
					<img class="lazyloadimg" alt=" " src="<%=path%>/images/1.jpg"/> 
				</a> 
			</div>
            <div class="offset3 intro">
				<div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"><i class="m"> 姓名：<a title="张三" target="_blank" href="javascript:;">张三</a></i></div>
              </div>
	 
              <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m"> 性别：男 </i> <i class="m"> 联系电话：18770912123 </i> <i class="m">联系邮箱：coding2u@163.com</i> </div>
              </div>
			   <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m"> 身份证号：360734199111233254 </i>  </div>
              </div>
              <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m"> 详细地址：江西省南昌市李渡镇GG乡101号 </i> </div>
              </div>
			  <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m">创建时间：2016-11-24</i>  </div>
				<a href="javascript:;" title="求助详情" target="_blank" rel="bookmark" class="read-all pull-right">求助详情</a>
              </div>
              
            </div>
          </div>
        </div>
      </div>
	  
	  
	  <div class="label-div b-30 border-all pb-20 pt-5" style="position: relative; padding-left: 0;">
        <div class="pl-20" style="margin-left: 1px;margin-top: 3px;"> <a class="fc1D6597" title="个人" href="javascript:;">个人</a> </div>
        <div class="news-list">
          <div class="clearfix pt-3">
            <div class="index-news-img spanm3 pull-left pt-5"> 
				<a href="javascript:;" title=" " target="_blank" rel="bookmark"> 
					<img class="lazyloadimg" alt=" " src="<%=path%>/images/1.jpg"/> 
				</a> 
			</div>
            <div class="offset3 intro">
				<div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"><i class="m"> 姓名：<a title="张三" target="_blank" href="javascript:;">张三</a></i></div>
              </div>
	 
              <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m"> 性别：男 </i> <i class="m"> 联系电话：18770912123 </i> <i class="m">联系邮箱：coding2u@163.com</i> </div>
              </div>
			   <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m"> 身份证号：360734199111233254 </i>  </div>
              </div>
              <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m"> 详细地址：江西省南昌市李渡镇GG乡101号 </i> </div>
              </div>
			  <div class="clearfix" style="height: 22px;margin-top: 0px;">
                <div class="pull-left myxx"> <i class="m">创建时间：2016-11-24</i>  </div>
				<a href="javascript:;" title="求助详情" target="_blank" rel="bookmark" class="read-all pull-right">求助详情</a>
              </div>
              
            </div>
          </div>
        </div>
      </div>
      
    
      
      
      
    
      <!--列表结束-->
      <div class="pagination center pagination-large pt-20">
        <ul id="yw1" class="yiiPager">
          <li class="previous"><a href="javascript:;">《</a></li>
          <li class="page"><a href="">1</a></li>
          <li class="page selected"><a href="">2</a></li>
          <li class="page"><a href="">3</a></li>
          <li class="page"><a href="">4</a></li>
          <li class="page"><a href="">5</a></li>
          <li class="page"><a href="">6</a></li>
          <li class="page"><a href="">7</a></li>
          <li class="next"><a href="javascript:;">》</a></li>
        </ul>
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


	<jsp:include page="/public/footer.jsp"></jsp:include>
 
</body>
</html>
