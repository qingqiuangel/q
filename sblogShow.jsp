<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我发布的帖子</title>
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
			<div class="title">个人中心  &gt;&gt;  我发布的帖子</div>
			<div style="margin-top:5px">
				 <table class="ptable" style="margin-bottom:5px;">
				 	<tr>
						<td colspan="7" align="right">
							<input type="button" id="delBtn" value="删除" class="btnstyle"/>
						</td>
					</tr>
					<tr class="head_text">
						<td width="40" align="center"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></td>
						<td align="center">帖子标题</td>
						<td align="center">发帖时间</td>
						<td align="center">点赞数</td>
						<td align="center">帖子类型</td>
						<td align="center">当前状态</td>
						<td align="center">操作</td>
					</tr>
					<s:if test="#attr.sblogs!=null && #attr.sblogs.size()>0">
   					<s:iterator value="#attr.sblogs" id="sblog" status="status">
					<tr>
						 <td width="" align="center"><s:checkbox name="chkid" fieldValue="%{#sblog.sblog_id}" cssStyle="vertical-align:text-bottom;"/></td>
						 <td width="" align="center" title="<s:property value='#sblog.sblog_title'/>">
						 	<s:property value="#sblog.sblog_title.length()>14?#sblog.sblog_title.substring(0,12)+'...':#sblog.sblog_title"/>
						 </td>
					     <td width="" align="center"><s:property value="#sblog.sblog_date.substring(0,10)"/></td>
					     <td width="" align="center"><s:property value="#sblog.sblog_click"/></td>  
					     <td width="" align="center"><s:property value="#sblog.sblog_typeDesc"/></td>
					     <td width="" align="center"><s:property value="#sblog.sblog_flagDesc"/></td>
					     <td width="" align="center">
					     	<s:a href="page_editSblog.action?paramsSblog.sblog_id=%{#sblog.sblog_id}">编辑</s:a>
					     	<s:if test="#sblog.sblog_flag==1 && #sblog.help_id==0">
					     		&nbsp;<s:a href="page_addSblogHelpShow.action?paramsSblog.sblog_id=%{#sblog.sblog_id}">加入求助</s:a>
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
	  window.location.href="page_listMySblogs.action?pageNo="+pagenum;
	}
	function ChangePage(pagenum)
	{
		window.location.href="page_listMySblogs.action?pageNo="+pagenum;
	}
	function CheckAll(obj) 
	{
		var checks=document.getElementsByName("chkid");
	    for (var i=0;i<checks.length;i++)
		{
		    var e = checks[i];
		    e.checked = obj.checked;
		}
	    
	}
	$(document).ready(function(){
		$("#delBtn").bind('click',function(){
			var checks=document.getElementsByName("chkid");
		    var ids="";
			for (var i=0;i<checks.length;i++)
		    {
		        var e = checks[i];
				if(e.checked==true)
				{
				  if(ids=="")
				  {
				    ids=ids+e.value;
				  }
				  else
				  {
				    ids=ids+","+e.value;
				  }
				}
		    }
		    if(ids=="")
		    {
		       alert("请至少选择一个要删除的帖子！");
		       return false;
		    }
		    if(confirm('确认删除吗!?'))
		    {
		    	var aQuery = {
						'paramsSblog.ids':ids
				};  
				$.post('page_delSblogs.action',aQuery,
					function(responseObj) {
							if(responseObj.success) {	
								 alert('删除成功！');
								 window.location.href="page_listMySblogs.action";
							}else  if(responseObj.err.msg){
								 alert('删除失败：'+responseObj.err.msg);
							}else{
								 alert('删除失败：服务器异常！');
							}	
				},'json');
		    }
		 });
		
	});
</script>
</body>
</html>