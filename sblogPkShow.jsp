<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的擂台帖子</title>
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
				<td><a href="page_addSblogShow.action">发布新的帖子</a></td>
			</tr>
			<tr class="ptable_menu_text">
				<td><a href="page_listMySblogs.action">我发布的帖子</a></td>
			</tr>
			<tr class="ptable_menu_text">
				<td><a href="page_listMySblogPks.action">我的帖子擂台</a></td>
			</tr>
			<tr class="ptable_menu_text">
				<td><a href="page_listMySblogHelps.action">我发布的求助</a></td>
			</tr>
		 </table>
	 </div>
	 <!--  购物车 -->
	 <div id="product_info">
			<div class="title">个人中心  &gt;&gt;  我的帖子擂台</div>
			<div style="margin-top:5px">
				 <table class="ptable" style="margin-bottom:5px;">
					<tr class="head_text">
						<td align="center">守擂贴</td>
						<td align="center">守擂人</td>
						<td align="center">挑战贴</td>
						<td align="center">挑战人</td>
						<td align="center">截止日期</td>
						<td align="center">状态</td>
						<td align="center">操作</td>
					</tr>
					<s:if test="#attr.sblogPks!=null && #attr.sblogPks.size()>0">
   					<s:iterator value="#attr.sblogPks" id="sblogPk" status="status">
					<tr>
						 <td width="" align="center" title="<s:property value='#sblogPk.defend_sblog_title'/>">
						 	<s:property value="#sblogPk.defend_sblog_title.length()>10?#sblogPk.defend_sblog_title.substring(0,8)+'..。':#sblogPk.defend_sblog_title"/>
						 </td>
					     <td width="" align="center"><s:property value="#sblogPk.defend_nick_name"/></td>  
					     <td width="" align="center" title="<s:property value='#sblogPk.reply_sblog_title'/>">
						 	<s:property value="#sblogPk.reply_sblog_title.length()>10?#sblogPk.reply_sblog_title.substring(0,8)+'..。':#sblogPk.reply_sblog_title"/>
						 </td>
						 <td width="" align="center"><s:property value="#sblogPk.reply_nick_name"/></td>  
					     <td width="" align="center"><s:property value="#sblogPk.pk_date.substring(0,10)"/></td>
					     <td width="" align="center"><s:property value="#sblogPk.pk_flagDesc"/></td>
					     <td width="" align="center">
					     	<s:if test="#sblogPk.pk_flag==1 && #sblogPk.defend_user_id==#attr.userFront.user_id">
					     		<s:a id="defeatPk_%{#sblogPk.pk_id}" href="javascript:void(0)">认输</s:a>
					     	</s:if>
					     </td>
					</tr>
					</s:iterator>
				    </s:if>
				    <s:else>
				    <tr>
				      <td height="60" colspan="7" align="center"><b>&lt;不存在发布的帖子信息&gt;</b></td>
				    </tr>
				    </s:else>
				 </table>
			</div>
			<div class="pages">
				<jsp:include page="page.jsp"></jsp:include>
			</div>
		</div>
	 <!--  购物车 -->
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
	function GoPage()
	{
	  var pagenum=document.getElementById("goPage").value;
	  var patten=/^\d+$/;
	  if(!patten.exec(pagenum))
	  {
	    alert("页码必须为大于0的数字");
	    return false;
	  }
	  window.location.href="page_listMySblogPks.action?pageNo="+pagenum;
	}
	function ChangePage(pagenum)
	{
		window.location.href="page_listMySblogPks.action?pageNo="+pagenum;
	}
	$(document).ready(function(){
		$("a[id^='defeatPk']").bind('click',function(){
		    if(confirm('确认认输吗!?'))
		    {
		    	var pk_id=$(this).attr('id').split('_')[1];
		    	var aQuery = {
						'paramsSblogPk.pk_id':pk_id
				};  
				$.post('page_defeatPk.action',aQuery,
					function(responseObj) {
							if(responseObj.success) {	
								 alert('认输成功！');
								 window.location.href="page_listMySblogPks.action";
							}else  if(responseObj.err.msg){
								 alert('认输失败：'+responseObj.err.msg);
							}else{
								 alert('认输失败：服务器异常！');
							}	
				},'json');
		    }
		 });
		
	});
</script>
</body>
</html>