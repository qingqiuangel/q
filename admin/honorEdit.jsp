<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.honor!=null && #attr.honor.honor_id!=0">编辑</s:if><s:else>新增</s:else>荣誉奖状</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script charset="utf-8" src="editor/kindeditor.js"></script>
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
	
	 
	$("#addBtn").bind('click',function(){
		//KE.sync('noticeContent');
		if($("#paramsHonor\\.honor_name").val()==''){
			alert("荣誉名称不能为空！");
			return;
		}
		if($("#paramsHonor\\.honor_pic").val()==''){
			alert("荣誉图片不能为空！");
			return;
		}
		$("#paramsHonor\\.honor_id").val(0);
		$("#info").attr('action','Admin_addHonor.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		    //KE.sync('noticeContent');
		    if($("#paramsHonor\\.honor_name").val()==''){
				alert("荣誉名称不能为空！");
				return;
			}
			if($("#paramsHonor\\.honor_pic").val()==''){
				alert("荣誉图片不能为空！");
				return;
			}
			$("#info").attr('action','Admin_saveHonor.action').submit();
			 
	});
	
});

 
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">荣誉奖状&gt;&gt;<s:if test="#attr.honor!=null && #attr.honor.honor_id!=0">编辑</s:if><s:else>新增</s:else>荣誉奖状</span>
</div>
<form id="info" name="info" action="Admin_saveHonor.action" method="post">    
<s:hidden id="paramsHonor.honor_id" name="paramsHonor.honor_id" value="%{#attr.honor.honor_id}" /> 
<input type="hidden" name="paramsHonor.honor_pic" id="paramsHonor.honor_pic" value='<s:property value="#attr.honor.honor_pic"/>'/>
<table width="600" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle"><s:if test="#attr.honor!=null && #attr.honor.honor_id!=0">编辑</s:if><s:else>新增</s:else>荣誉奖状</TD>
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
          <td width="30%" align="right" style="padding-right:5px">荣誉名称：</td>
          <td width="70%">
            <s:textfield cssStyle="width:345px;" name="paramsHonor.honor_name" id="paramsHonor.honor_name" value="%{#attr.honor.honor_name}"/> 
          </td>  
        </tr> 
        <tr>
		  <td align="right" style="padding-right:5px">荣誉图片：</td>
		  <td align="left">
		    <img id="userImg" src="../images/rytp/<s:property value='%{#attr.honor.honor_pic}'/>" width="70" height="80" style="border:0px;"/>
		    <span id="op" style="display:none"><img src="images/loading004.gif"  height="50" /></span>
	      </td>
	    </tr>
	    <tr>
		  <td align="right" style="padding-right:5px">上传图片：</td>
	      <td align="left"> 
	          <iframe name="uploadPage" src="uploadImg.jsp" width="100%" height="50" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>            
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
            <s:if test="#attr.honor!=null && #attr.honor.honor_id!=0">
          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
          	</s:if>
          	<s:else>
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
          	</s:else>
            &nbsp;<label style="color:red">${tip}</label> 
          </td>
        </tr>
      </table>
     </td> 
   </tr>
</table>
</form>
<script>        
	   KE.show({ 
	            id : 'noticeContent',
	            items:['source', '|','plainpaste', '|', 'selectall', 'bold','italic'],
	            resizeMode:1
	            
	                    
	   });
	   
</script>
</body>
</html>