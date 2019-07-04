<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>帖子擂台</title>
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
	 <div class="nav">当前位置: 帖子擂台 > 擂台PK详情　　[PK截止日期：<s:property value="#attr.sblogPk.pk_date.substring(0,10)" />]</div>
	 <!-- 信息开始 -->
	 <div class="messages">
		 <div class="messages_left">
			<div class="nickName"><span style="color:red">守擂人：</span><s:property value="#attr.sblogDefend.nick_name" /></div>
			<div class="headphoto"><img src="images/head/<s:property value='#attr.sblogDefend.user_photo' />"/></div>
			<div class="stuNo">用户等级：<s:property value="#attr.sblogDefend.user_level" /> 级</div>
		</div>
		<div class="messages_right">
			<div class="time">
				守擂贴：<s:property value="#attr.sblogDefend.sblog_title" />&nbsp;&nbsp;
				<img src="images/time.gif" valign="middle"/> 
				<s:property value="#attr.sblogDefend.sblog_date.substring(0,19)" />&nbsp;&nbsp;
				<img src="images/wendang001.jpg" valign="bottom"/>&nbsp;&nbsp;<a id="addSblogVote1" href="javascript:void(0)">[我要投票<s:property value="#attr.sblogPk.defend_votes" />]</a>&nbsp;&nbsp;
				<span id="op1" style="display:none"><img src="images/loading001.gif" valign="middle"/></span>
			</div>

			<s:if test="#attr.sblogDefendPics!=null">
			<div class="pic">
				 <s:iterator value="#attr.sblogDefendPics" id="sblogPkPic">
				 <img src='images/tztp/<s:property value="#sblogPkPic.pic_picture" />'/>
				 </s:iterator>
			</div>
			</s:if>
			<div class="title">
				 <s:property value="#attr.sblogDefend.sblog_contentShow" escape="false" />
			</div>
		</div>
	 </div>
	 
	 <div class="messagesInterval"></div>
	 
	 <div class="messages">
		 <div class="messages_left">
			<div class="nickName"><span style="color:red">挑战人：</span><s:property value="#attr.sblogReply.nick_name" /></div>
			<div class="headphoto"><img src="images/head/<s:property value='#attr.sblogReply.user_photo' />"/></div>
			<div class="stuNo">用户等级：<s:property value="#attr.sblogReply.user_level" /> 级</div>
		</div>
		<div class="messages_right">
			<div class="time">
				挑战贴：<s:property value="#attr.sblogReply.sblog_title" />&nbsp;&nbsp;
				<img src="images/time.gif" valign="middle"/> 
				<s:property value="#attr.sblogReply.sblog_date.substring(0,19)" />&nbsp;&nbsp;
				<img src="images/wendang001.jpg" valign="bottom"/>&nbsp;&nbsp;<a id="addSblogVote2" href="javascript:void(0)">[我要投票<s:property value="#attr.sblogPk.reply_votes" />]</a>&nbsp;&nbsp;
				<span id="op2" style="display:none"><img src="images/loading001.gif" valign="middle"/></span>
			</div>

			<s:if test="#attr.sblogReplyPics!=null">
			<div class="pic">
				 <s:iterator value="#attr.sblogReplyPics" id="sblogPkPic">
				 <img src='images/tztp/<s:property value="#sblogPkPic.pic_picture" />'/>
				 </s:iterator>
			</div>
			</s:if>
			<div class="title">
				 <s:property value="#attr.sblogReply.sblog_contentShow" escape="false" />
			</div>
		</div>
	 </div>
	  
	<!-- 信息结束 -->
	 
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script type="text/javascript">
var user_id = "<s:property value='#attr.userFront.user_id' />";
var pk_id = "<s:property value='#attr.sblogPk.pk_id' />";
var defend_sblog_id = Number("<s:property value='#attr.sblogDefend.sblog_id' />");
var defend_votes = Number("<s:property value='#attr.sblogPk.defend_votes' />");
var reply_sblog_id = Number("<s:property value='#attr.sblogReply.sblog_id' />");
var reply_votes = Number("<s:property value='#attr.sblogPk.reply_votes' />");
//实现验证码点击刷新
function reloadcode(){
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','Random.jsp?'+Math.random());
}

 
$(document).ready(function(){
	$("#addSblogVote1,#addSblogVote2").bind("click",function(){
		if(user_id==''){
			alert('请先登录后再进行点赞！')
			return;
		}
		var a_id = $(this).attr("id");
		var sblog_id=defend_sblog_id;
		var flag = 1;
		if(a_id=="addSblogVote2"){
			sblog_id=reply_sblog_id;
			flag = 2;
		}
		var aQuery = {
			'paramsSblogVote.pk_id':pk_id,
			'paramsSblogVote.user_id':user_id,
			'paramsSblogVote.sblog_id':sblog_id,
			'paramsSblogVote.vote_type':flag
		};  
		$("#op"+flag).show();
		$.post('page_addSblogVote.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('投票成功！');
						 if(flag==1){
							 $("#addSblogVote1").html("[我要投票"+(defend_votes+1)+"]");
						 }else{
							 $("#addSblogVote2").html("[我要投票"+(reply_votes+1)+"]");
						 }
						 $("#op"+flag).hide();
					}else  if(responseObj.err.msg){
						 alert('投票失败：'+responseObj.err.msg);
						 $("#op"+flag).hide();
					}else{
						 alert('投票失败：服务器异常！');
						 $("#op"+flag).hide();
					}	
		},'json');
	});
	
	 
});

</script>
</body>
</html>