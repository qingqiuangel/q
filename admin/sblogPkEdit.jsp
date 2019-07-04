<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发放奖励</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	function trimStr(str)     
	{     
	    if ((typeof(str) != "string") || !str)   
	    {    
	        return "";    
	    }   
	    return str.replace(/(^\s*)|(\s*$)/g, "");    
	}
	
	var num = /^\d+$/;
	$("#addBtn").bind('click',function(){
		if(!num.exec($("#paramsSblogPk\\.user_score").val())){
			alert("奖励经验必须为数字！");
			return;
		}
		if($("#paramsSblogPk\\.honor_id").val()=='0'){
			alert("荣誉奖状不能为空！");
			return;
		}
		$("#paramsSblogPk\\.sblogPk_id").val(0);
		$("#info").attr('action','Admin_rewardSblogPk.action').submit();
		 
	 });
	
});

 
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">擂台管理&gt;&gt;发放奖励</span>
</div>
<form id="info" name="info" action="Admin_rewardSblogPk.action" method="post">    
<s:hidden id="paramsSblogPk.pk_id" name="paramsSblogPk.pk_id" value="%{#attr.sblogPk.pk_id}" /> 
<s:hidden id="paramsSblogPk.defend_user_id" name="paramsSblogPk.defend_user_id" value="%{#attr.sblogPk.defend_user_id}" /> 
<s:hidden id="paramsSblogPk.reply_user_id" name="paramsSblogPk.reply_user_id" value="%{#attr.sblogPk.reply_user_id}" /> 
<s:hidden id="paramsSblogPk.pk_flag" name="paramsSblogPk.pk_flag" value="%{#attr.sblogPk.pk_flag}" /> 
<table width="600" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle">发放奖励</TD>
              <TD class="edittitleright">&nbsp;</TD>
            </TR>
        </TABLE>
     </td>
   </tr>
   <tr>
     <td height="1" bgcolor="#8f8f8f"></td>
   </tr>
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="30%" align="right" style="padding-right:5px">奖励经验：</td>
          <td width="70%">
            <s:textfield name="paramsSblogPk.user_score" id="paramsSblogPk.user_score" value="%{#attr.sblogPk.user_score}"/> 
          </td>  
        </tr> 
        <tr>
		  <td align="right" style="padding-right:5px">荣誉奖状：</td>
		  <td align="left">
		  	<s:select list="#attr.honors" name="paramsSblogPk.honor_id" id="paramsSblogPk.honor_id" value="%{#attr.sblogPk.honor_id}"
		  			  listKey="honor_id" listValue="honor_name" cssStyle="width:200px;" headerKey="0" headerValue="请选择">
		  	</s:select>
	      </td>
	    </tr>
     </table>  
     </td> 
   </tr>   
   <tr>
     <td> 
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30"> 
          	<input type="button" id="addBtn" Class="btnstyle" value="发放奖励" />
            &nbsp;<label style="color:red">${tip}</label> 
          </td>
        </tr>
      </table>
     </td> 
   </tr>
</table>
</form>
</body>
</html>