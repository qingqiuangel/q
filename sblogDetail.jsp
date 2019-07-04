<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><s:property value="#attr.sblog_typeDesc" />惨事</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/message.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script charset="utf-8" src="admin/editor/kindeditor.js"></script>
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
	 <div class="nav">当前位置: 论坛广场 > <s:property value="#attr.sblog_typeDesc" />惨事 </div>
	 <!-- 信息开始 -->
	 <div class="messages">
		 <div class="messages_left">
			<div class="nickName" style="color:red"><s:property value="#attr.sblog.nick_name" /></div>
			<div class="headphoto"><img src="images/head/<s:property value='#attr.sblog.user_photo' />"/></div>
			<div class="stuNo">用户等级：<s:property value="#attr.sblog.user_level" /> 级</div>
		</div>
		<div class="messages_right">
			<div class="time">
				主题：<s:property value="#attr.sblog.sblog_title" />&nbsp;&nbsp;
				<img src="images/time.gif" valign="middle"/> 
				<s:property value="#attr.sblog.sblog_date.substring(0,19)" />&nbsp;&nbsp;
				<img src="images/quote.gif" valign="middle"/>&nbsp;&nbsp;<a href="#link">[回复]</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="images/pk.gif" valign="bottom"/>&nbsp;&nbsp;<a id="addSblogPk" href="javascript:void(0)">[挑战]</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="images/hao.gif" valign="bottom"/>&nbsp;&nbsp;<a id="addSblogClick" href="javascript:void(0)">[点赞<s:property value="#attr.sblog.sblog_click" />]</a>&nbsp;&nbsp;
				<span id="op" style="display:none"><img src="images/loading001.gif" valign="middle"/></span>
			</div>

			<s:if test="#attr.sblogPics!=null">
			<div class="pic">
				 <s:iterator value="#attr.sblogPics" id="sblogPic">
				 <img src='images/tztp/<s:property value="#sblogPic.pic_picture" />'/>
				 </s:iterator>
			</div>
			</s:if>
			<div class="title">
				 <s:property value="#attr.sblog.sblog_contentShow" escape="false" />
			</div>
		</div>
	 </div>
	 <s:if test="#attr.sblogReplys!=null && #attr.sblogReplys.size()>0">
	 <s:iterator value="#attr.sblogReplys" id="sblogReply">
	 <div class="messages">
		 <div class="messages_left">
			<div class="nickName"><s:property value="#sblogReply.nick_name" /></div>
			<div class="headphoto"><img src="images/head/<s:property value='#sblogReply.user_photo' />"/></div>
			<div class="stuNo">用户等级：<s:property value="#sblogReply.user_level" /> 级</div>
		</div>
		<div class="messages_right">
			<div class="time">
				回复时间：
				<s:property value="#sblogReply.reply_date.substring(0,19)" />　
			</div>
			<div class="title">
				 <s:property value="#sblogReply.reply_contentShow" escape="false" />
			</div>
		</div>
	 </div>
	 </s:iterator>
	 </s:if>
	<!-- 信息结束 -->

	 <jsp:include page="page.jsp"></jsp:include>

	 <!-- 帖子回复 -->
	 <div id="addSblogReply" style="display:block">
	 <form name="info" id="info" action="page_addSblogReply.action" method="post">
	 <input type="hidden" name="paramsSblogReply.user_id" id="paramsSblogReply.user_id" value="<s:property value='#attr.userFront.user_id' />"/>
	 <input type="hidden" name="paramsSblogReply.sblog_id" id="paramsSblogReply.sblog_id" value="<s:property value='#attr.sblog.sblog_id' />"/>
	 <input type="hidden" name="paramsSblogReply.sblog_user_id" id="paramsSblogReply.sblog_user_id" value="<s:property value='#attr.sblog.user_id' />"/>
	 <table class="reply_add">
		<tr>
			<td class="theme" colspan="2">回复帖子：</td>
		</tr>
		<tr>
			<td align="right" width="150px">回复内容：</td>
			<td align="left" width="*">
				<textarea name="paramsSblogReply.reply_content" id="noticeContent" style="width:600px;height:150px" class="inputstyle">
			</textarea></td>
		</tr>
		<tr>
			<td align="right">验证码：</td>
			<td align="left">
				<input type="text" id="random" name="paramsSblogReply.random" style="width:80px;" class="inputstyle"/>
				&nbsp;<img src="Random.jsp" width="50" valign="middle" style="cursor:pointer;vertical-align:middle" title="换一张" id="safecode" border="0" onClick="reloadcode()"/>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="4">
				<input type="button" id="addBtn" class="btnstyle" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" id="resetBtn" class="btnstyle" value="清空"/>
			</td>
		</tr>
	 </table>
	 </form>
	 </div>
	 <a name="link"></a>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script type="text/javascript">
var user_id = "<s:property value='#attr.userFront.user_id' />";
var sblog_id = "<s:property value='#attr.sblog.sblog_id' />";
var sblog_click = Number("<s:property value='#attr.sblog.sblog_click' />");
var sblog_user_id = "<s:property value='#attr.sblog.user_id' />";
//实现验证码点击刷新
function reloadcode(){
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','Random.jsp?'+Math.random());
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
  window.location.href="page_querySblog.action?pageNo="+pagenum+"&paramsSblog.sblog_id="+sblog_id+"&paramsSblogReply.sblog_id="+sblog_id;
}
function ChangePage(pagenum)
{
	window.location.href="page_querySblog.action?pageNo="+pagenum+"&paramsSblog.sblog_id="+sblog_id+"&paramsSblogReply.sblog_id="+sblog_id;
}
 
$(document).ready(function(){
	$("#addSblogClick").bind("click",function(){
		if(user_id==''){
			alert('请先登录后再进行点赞！')
			return;
		}
		if(user_id==sblog_user_id){
			alert('请不要点赞自己的帖子来刷经验！')
			return;
		}
		var aQuery = {
			'paramsSblogClick.sblog_id':sblog_id,
			'paramsSblogClick.user_id':user_id
		};  
		$("#op").show();
		$.post('page_addSblogClick.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('点赞成功！');
						 $("#addSblogClick").html("[点赞"+(sblog_click+1)+"]");
						 $("#op").hide();
					}else  if(responseObj.err.msg){
						 alert('点赞失败：'+responseObj.err.msg);
						 $("#op").hide();
					}else{
						 alert('点赞失败：服务器异常！');
						 $("#op").hide();
					}	
		},'json');
	});
	
	$("#addSblogPk").bind("click",function(){
		if(user_id==''){
			alert('请先登录后再进行挑战！')
			return;
		}
		if(user_id==sblog_user_id){
			alert('请不要挑战自己的帖子！')
			return;
		}
		window.location.href="page_addSblogPkShow.action?paramsSblog.sblog_id="+sblog_id;
	});
	
	$("#addBtn").bind("click",function(){
		KE.sync('noticeContent');
		if(user_id==''){
			alert('请先登录后在进行回复！')
			return;
		}
		if(user_id==sblog_user_id){
			alert('请不要回复自己的帖子来刷经验！')
			return;
		}
		if($("#noticeContent").val()==''){
			alert('回复内容不能为空！')
			return;
		}
		if($("#random").val()==''){
			alert('验证码不能为空！')
			return;
		}
		
		var aQuery = $("#info").serialize();  
		$.post('page_addSblogReply.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('回复成功！');
						 window.location.reload();
					}else  if(responseObj.err.msg){
						 alert('回复失败：'+responseObj.err.msg);
					}else{
						 alert('回复失败：服务器异常！');
					}	
		},'json');
	});
});

KE.show({ 
    id : 'noticeContent',
    items:['source', '|','plainpaste', '|', 'selectall', 'bold','italic'],
    resizeMode:1
    
            
});
</script>
</body>
</html>