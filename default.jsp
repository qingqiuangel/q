<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>论坛广场</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
$(document).ready(function(){
 
}); 
</script>
<style type="text/css">
 body,td,div
 {
   font-size:12px;
 }
</style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<div id="middleBg">
	<!--  产品检索展示 -->
	 <div id="product_info">
	 		<!--  产品列表 -->
			<div class="list">
					<div class="sign"></div>
					<div class="products">
					<div class="product">
						<div class="productPic"><s:a href="page_listSblogs.action?paramsSblog.sblog_type=1"><img src="images/tzgc/1.jpg" /></s:a></div>
						<div class="productText"><span class="title">职业论坛</span>（<s:property value='#attr.count1'/>）</div>
					</div>
					<div class="product">
						<div class="productPic"><s:a href="page_listSblogs.action?paramsSblog.sblog_type=2"><img src="images/tzgc/2.jpg" /></s:a></div>
						<div class="productText"><span class="title">校园论坛</span>（<s:property value='#attr.count2'/>）</div>
					</div>
					<div class="product">
						<div class="productPic"><s:a href="page_listSblogs.action?paramsSblog.sblog_type=3"><img src="images/tzgc/3.jpg" /></s:a></div>
						<div class="productText"><span class="title">家庭论坛</span>（<s:property value='#attr.count3'/>）</div>
					</div>
					<div class="product">
						<div class="productPic"><s:a href="page_listSblogs.action?paramsSblog.sblog_type=4"><img src="images/tzgc/4.jpg" /></s:a></div>
						<div class="productText"><span class="title">爱情论坛</span>（<s:property value='#attr.count4'/>）</div>
					</div>
					<div class="product">
						<div class="productPic"><s:a href="page_listSblogs.action?paramsSblog.sblog_type=5"><img src="images/tzgc/5.jpg" /></s:a></div>
						<div class="productText"><span class="title">日常论坛</span>（<s:property value='#attr.count5'/>）</div>
					</div>
					<div class="product">
						<div class="productPic"><s:a href="page_listSblogPks.action"><img src="images/tzgc/6.jpg" /></s:a></div>
						<div class="productText"><span class="title">擂台广场</span>（<s:property value='#attr.countPk'/>）</div>
					</div>
					<div class="product">
						<div class="productPic"><s:a href="page_listSblogHelps.action"><img src="images/tzgc/7.jpg" /></s:a></div>
						<div class="productText"><span class="title">求助广场</span>（<s:property value='#attr.countHelp'/>）</div>
					</div>
					</div>

			</div>
			<!--  产品列表 -->
			
	 </div>
	 <!--  产品检索展示 -->
	 
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
	 
</script>
</body>
</html>