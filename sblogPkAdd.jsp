<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>帖子挑战</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/reg.css">
<link rel="stylesheet" type="text/css" href="css/info.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="admin/My97DatePicker/WdatePicker.js"></script>
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
		 <div class="nav">当前位置: 主页 > 帖子挑战 </div>
		 <div class="list_info">
		 	 <form name="info" id="info" style="width:100%;height:300px" action="page_createCollege.action" method="post">
		 	 <input type="hidden" name="paramsSblogPk.reply_user_id" id="paramsSblogPk.reply_user_id" value='${userFront.user_id}'/>
		     <input type="hidden" name="paramsSblogPk.defend_user_id" id="paramsMember.defend_user_id" value='<s:property value="#attr.sblog.user_id"/>'/>
		     <input type="hidden" name="paramsSblogPk.defend_sblog_id" id="paramsMember.defend_sblog_id" value='<s:property value="#attr.sblog.sblog_id"/>'/>
			 <table class="regTable">
				<tr>
					<td class="theme" colspan="2">进行帖子挑战</td>
				</tr>
				<tr>
					<td align="right" width="20%"><span style="color:red">*</span> 守擂贴子：</td>
					<td align="left" width="80%">
						<s:property value="#attr.sblog.sblog_title"/>
					</td>
				</tr>
				<tr>
					<td align="right"><span style="color:red">*</span> 我的帖子：</td>
					<td align="left">
						<s:select list="#attr.sblogs" name="paramsSblogPk.reply_sblog_id" id="paramsSblogPk.reply_sblog_id"
								listKey="sblog_id" listValue="sblog_title" headerKey="0" headerValue="请选择" cssStyle="width:300px;">
						</s:select>
					</td>
				</tr>
			    <tr> 
		          <td align="right"><font color="red">*</font> 截止日期：</td>
		          <td>
		            <s:textfield name="paramsSblogPk.pk_date" id="paramsSblogPk.pk_date" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
		          </td>
		        </tr> 
				<tr>
					<td align="center" colspan="2">
						<input type="button" id="addBtn" class="btnstyle" value="提交挑战"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset"  class="btnstyle" value="清空"/>
					</td>
				</tr>
		 	 </table>
		 	 </form>
		 </div>
	</div>
	<div id="Picture"></div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	var user_id = '${userFront.user_id}';
	$("#addBtn").bind("click",function(){
		if(user_id==null || user_id==""){
			alert("进行帖子挑战请先登录！");
			return;
		}
		if($("#paramsSblogPk\\.reply_sblog_id").val()=='0'){
			alert("您的帖子不能为空！");
			return;
		}
		if($("#paramsSblogPk\\.pk_date").val()==''){
			alert("截止日期不能为空！");
			return;
		}
		var aQuery = $("#info").serialize();  
		$.post('page_addSblogPk.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('挑战成功，您的帖子已经进入擂台！');
						 window.location.href="page_listSblogPks.action";
					}else  if(responseObj.err.msg){
						 alert('失败：'+responseObj.err.msg);
					}else{
						 alert('失败：服务器异常！');
					}	
		 },'json');
	});
});
</script>
</body>
</html>