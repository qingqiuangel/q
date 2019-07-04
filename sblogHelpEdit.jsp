<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>加入帖子求助</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/store.css">
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
	 <div id="product_menu">
	 	<table class="ptable_menu">
			<tr class="ptable_menu_title">
				<td>个人中心</td>
			</tr>
			<tr class="ptable_menu_text">
				<td><a href="page_myInfo.action">修改个人信息</a></td>
			</tr>
			<tr class="ptable_menu_text">
				<td><a href="page_myPwd.action">修改登录密码</a></td>
			</tr>
			<tr class="ptable_menu_text">
				<td><a href="page_addSblogHelpShow.action">发布新的帖子</a></td>
			</tr>
			<tr class="ptable_menu_text">
				<td><a href="page_listMySblogHelps.action">我发布的帖子</a></td>
			</tr>
			<tr class="ptable_menu_text">
				<td><a href="page_listMySblogHelpPks.action">我的帖子擂台</a></td>
			</tr>
			<tr class="ptable_menu_text">
				<td><a href="page_listMySblogHelps.action">我发布的求助</a></td>
			</tr>
		 </table>
	 </div>
	 <!--  购物车 -->
	 <div id="product_info">
			<div class="title">个人中心  &gt;&gt;  加入帖子求助</div>
			<div style="margin-top:5px">
				 <form id="info" name="info" action="page_addSblogHelp.action" method="post">    
				 <input type="hidden" name="paramsSblogHelp.user_id" id="paramsSblogHelp.user_id" value="<s:property value='#attr.sblog.user_id'/>"/>
				 <input type="hidden" name="paramsSblogHelp.sblog_id" id="paramsSblogHelp.sblog_id" value="<s:property value='#attr.sblog.sblog_id'/>"/>
				 <table class="ptable" style="margin-bottom:5px;">
					<tr>
			          <td width="15%" align="right" style="padding-right:5px">帖子标题：</td>
			          <td width="*">
			          	<s:property value="%{#attr.sblog.sblog_title}"/> 
			          </td>
			        </tr> 
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px">悬赏经验：</td>
			          <td width="*">
			          	<s:textfield name="paramsSblogHelp.help_score" id="paramsSblogHelp.help_score" /> 
			          </td>
			        </tr> 
			        </tr> 
			        <tr class="">
			          <td align="center" height="30" colspan="4">
			            <input type="button" id="addBtn" Class="btnstyle" value="加入求助" />
			          </td>
			        </tr>
				 </table>
				 </form>
			</div>
		</div>
	 <!--  购物车 -->
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
	$(document).ready(function(){
		var num = /^\d+$/;
		$("#addBtn").bind('click',function(){
			if(!num.exec($("#paramsSblogHelp\\.help_score").val())){
				alert('悬赏经验必须为数字');
				return;
			}
			var aQuery = $("#info").serialize();  
			$.post('page_addSblogHelp.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('加入求助成功！');
							 window.location.href="page_listMySblogHelps.action";
						}else  if(responseObj.err.msg){
							 alert('加入求助失败：'+responseObj.err.msg);
						}else{
							 alert('加入求助失败：服务器异常！');
						}	
			},'json');
		 });
	});	 
</script>
</body>
</html>