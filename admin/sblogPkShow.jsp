<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>擂台信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
var tempClassName="";
function tr_mouseover(obj) 
{ 
	tempClassName=obj.className;
	obj.className="list_mouseover";
}
function tr_mouseout(obj)      
{ 
	obj.className=tempClassName;
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


function serch()
{
   document.info.action="Admin_listSblogPks.action";
   document.info.submit();
}
function del()
{
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
       alert("请至少选择一个要删除的擂台！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="Admin_delSblogPks.action?paramsSblogPk.ids="+ids;
       document.info.submit();
    }
    
}
function GoPage()
{
  var pagenum=document.getElementById("goPage").value;
  var patten=/^\d+$/;
  if(!patten.exec(pagenum))
  {
    alert("页码必须为大于0的数字");
    return false;
  }
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listSblogPks.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listSblogPks.action";
  document.info.submit();
}
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">擂台管理&gt;&gt;擂台查询</span>
</div>
<form name="info" id="info" action="Admin_listSblogPks.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<table width="95%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="10px">&nbsp;</td></tr>
  <tr>
    <td width="">擂台列表</td>
    <td width="" align="right">
            守擂帖子：
      <input type="text" id="paramsSblogPk.defend_sblog_title" name="paramsSblogPk.defend_sblog_title" value="${paramsSblogPk.defend_sblog_title}" class="inputstyle"/>&nbsp;
            守擂人：
      <input type="text" id="paramsSblogPk.defend_nick_name" name="paramsSblogPk.defend_nick_name" value="${paramsSblogPk.defend_nick_name}" class="inputstyle"/>&nbsp;&nbsp;
      <input type="button" value="搜索" onclick="serch();" class="btnstyle"/>
    </td>
  </tr>
  <tr><td colspan="2" height="2px"></td></tr>  
</table>
<table width="95%" align="center" class="table_list" cellpadding="0" cellspacing="0">
   <tr class="listtitle">
     <td width="40" align="center">序号</td>
     <td width="" align="center">守擂帖子</td>
     <td width="" align="center">守擂人</td>
     <td width="" align="center">挑战帖子</td>
     <td width="" align="center">挑战人</td>
     <td width="" align="center">截止日期</td>
     <td width="" align="center">当前状态</td>
     <td width="" align="center">操作</td>
   </tr>
   <s:if test="#attr.sblogPks!=null && #attr.sblogPks.size()>0">
   <s:iterator value="#attr.sblogPks" id="sblogPk" status="status">
   <tr class="<s:if test='(#status.index + 1)%2==0'>list1</s:if><s:else>list0</s:else>" onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)"> 
     <td width="" align="center"><s:property value="#status.index+1"/></td>
     <td width="" align="center"><s:property value="#sblogPk.defend_sblog_title"/></td>
     <td width="" align="center"><s:property value="#sblogPk.defend_nick_name"/></td>
     <td width="" align="center"><s:property value="#sblogPk.reply_sblog_title"/></td>
     <td width="" align="center"><s:property value="#sblogPk.reply_nick_name"/></td>
     <td width="" align="center"><s:property value="#sblogPk.pk_date.substring(0,10)"/></td>  
     <td width="" align="center"><s:property value="#sblogPk.pk_flagDesc"/></td>
     <td width="" align="center">
     <s:if test="#sblogPk.pk_flag!=1 && #sblogPk.pk_reward==1">
       <s:a href="Admin_querySblogPk.action?paramsSblogPk.pk_id=%{#sblogPk.pk_id}">发放奖励</s:a>
     </s:if>
     <s:elseif test="#sblogPk.pk_flag!=1 && #sblogPk.pk_reward==2">已经奖励</s:elseif>
     </td>
   </tr> 
   </s:iterator>
   </s:if>
   <s:else>
   <tr>
     <td height="60" colspan="8" align="center"><b>&lt;不存在擂台信息&gt;</b></td>
   </tr>
   </s:else>
   
</table>
<jsp:include page="page.jsp"></jsp:include>
</form> 
</body>
</html>