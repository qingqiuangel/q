<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><s:property value="#attr.sblog_typeDesc" />论坛</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/info.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	 
	
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
<div id="middle">
	<div id="list">
		 <div class="nav">当前位置: 论坛广场 > <s:property value="#attr.sblog_typeDesc" />板块 </div>
		 <div class="list_info">
			<ul>
				<s:iterator value="#attr.sblogs" id="sblog">
				<li>
					[ <strong><s:property value="#sblog.sblog_typeDesc" /></strong> ] <s:a href="page_querySblog.action?paramsSblog.sblog_id=%{#sblog.sblog_id}&paramsSblogReply.sblog_id=%{#sblog.sblog_id}" target="_blank" title="%{#sblog.sblog_title}"> 
						<s:property value="#sblog.sblog_title.length()>26?#sblog.sblog_title.substring(0,26)+'...':#sblog.sblog_title"/>
					</s:a>　<span style="color:#666"><s:property value="#sblog.sblog_date.substring(0,10)"/></span>
				</li>
				<li class="li_hr">
					<hr />
				</li>
				</s:iterator>
			</ul>
		 </div>
		 <jsp:include page="page.jsp"></jsp:include>
	</div>
	<div id="SblogTop">
		<div class="top5_title">本周<s:property value="#attr.sblog_typeDesc" />排名Top5</div>
		<div class="top5_detail">
			<s:if test="#attr.sblogTops!=null">
			<s:iterator value="#attr.sblogTops" id="sblog" status="status">
				<li>
					<strong><s:property value="#status.index+1" />.</strong> <s:a href="page_querySblog.action?paramsSblog.sblog_id=%{#sblog.sblog_id}&paramsSblogReply.sblog_id=%{#sblog.sblog_id}" target="_blank" title="%{#sblog.sblog_title}"> 
						<s:property value="#sblog.sblog_title.length()>15?#sblog.sblog_title.substring(0,12)+'...':#sblog.sblog_title"/>
					</s:a>
				</li>
				<li class="li_hr">
					<hr />
				</li>
			</s:iterator>
			</s:if>
		</div>
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
	var sblog_type = '<s:property value="#attr.sblog_type" />';
	function GoPage()
	{
	  var pagenum=document.getElementById("goPage").value;
	  var patten=/^\d+$/;
	  if(!patten.exec(pagenum))
	  {
	    alert("页码必须为大于0的数字");
	    return false;
	  }
	  window.location.href="page_listSblogs.action?pageNo="+pagenum+"&paramsSblog.sblog_type="+sblog_type;
	}
	function ChangePage(pagenum)
	{
		window.location.href="page_listSblogs.action?pageNo="+pagenum+"&paramsSblog.sblog_type="+sblog_type;
	}
</script>
</body>
</html>