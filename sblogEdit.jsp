<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><s:if test="#attr.sblog!=null && #attr.sblog.sblog_id!=0">编辑</s:if><s:else>发布</s:else>帖子信息</title>
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
			<div class="title">个人中心  &gt;&gt;  <s:if test="#attr.sblog!=null && #attr.sblog.sblog_id!=0">编辑</s:if><s:else>发布</s:else>帖子信息</div>
			<div style="margin-top:5px">
				 <form id="info" name="info" action="page_saveSblog.action" method="post">    
				 <input type="hidden" name="paramsSblog.user_id" id="paramsSblog.user_id" value="${userFront.user_id }"/>
				 <input type="hidden" name="paramsSblog.sblog_id" id="paramsSblog.sblog_id" value="<s:property value='#attr.sblog.sblog_id'/>"/>
				 <input type="hidden" name="paramsSblog.sblog_pics" id="paramsSblog.sblog_pics" value="<s:property value='#attr.sblogPic'/>"/>
				 <input type="hidden" name="paramsSblog.sblog_pics_old" id="paramsSblog.sblog_pics_old" value="<s:property value='#attr.sblogPic'/>"/>
				 <table class="ptable" style="margin-bottom:5px;">
					<tr>
			          <td width="15%" align="right" style="padding-right:5px">帖子标题：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsSblog.sblog_title" id="paramsSblog.sblog_title" value="%{#attr.sblog.sblog_title}"/> 
			          </td>
			        </tr> 
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px">帖子类型：</td>
			          <td width="*">
			          	<s:select name="paramsSblog.sblog_type" id="paramsSblog.sblog_type" 
			          		    list="#{'1':'公司', '2':'校园', '3':'家庭', '4':'恋爱', '5':'日常'}"
				      			value="%{#attr.sblog.sblog_type}" listKey="key" listValue="value" headerKey="0" headerValue="请选择" 
				      			cssClass="selectstyle" cssStyle="width:200px"></s:select>
			          </td>
			        </tr>
			        <tr>
					  <td align="right" style="padding-right:5px">帖子图片：</td>
					  <td align="left">
					    <img id="userImg" src="images/tztp/<s:property value='%{#attr.sblogPic}'/>" width="70" height="80" style="border:0px;"/>
					    <span id="op" style="display:none"><img src="images/loading004.gif"  height="50" /></span>
				      </td>
				    </tr>
				    <tr>
					  <td align="right" style="padding-right:5px">上传图片：</td>
				      <td align="left"> 
				          <iframe name="uploadPage" src="uploadImg.jsp" width="100%" height="50" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>            
				       </td>
				    </tr>
			        <tr>
			          <td align="right" style="padding-right:5px">帖子内容：</td>
			          <td class="KEEdit">
			          	<textarea style="width:450px;height:150px" name="paramsSblog.sblog_content" id="noticeContent">
			          		<s:property value="#attr.sblog.sblog_content" escape="false"/>
			          	</textarea> 
			          </td>
			        </tr> 
			        <tr class="">
			          <td align="center" height="30" colspan="4">
			            <s:if test="#attr.sblog!=null && #attr.sblog.sblog_id!=0">
			          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
			          	</s:if>
			          	<s:else>
			          	<input type="button" id="addBtn" Class="btnstyle" value="发 布" />
			          	</s:else>
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
		$("#addBtn").bind('click',function(){
			KE.sync('noticeContent');
			if($("#paramsSblog\\.sblog_title").val()==''){
				alert('帖子标题不能为空');
				return;
			}
			if($("#paramsSblog\\.sblog_type").val()=='0'){
				alert('帖子类型不能为空');
				return;
			}
			if($("#paramsSblog\\.sblog_content").val()==''){
				alert('帖子内容不能为空');
				return;
			}
			$("#paramsSblog\\.sblog_id").val(0);
			var aQuery = $("#info").serialize();  
			$.post('page_addSblog.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('发布成功！');
							 window.location.href="page_listMySblogs.action";
						}else  if(responseObj.err.msg){
							 alert('发布失败：'+responseObj.err.msg);
						}else{
							 alert('发布失败：服务器异常！');
						}	
			},'json');
		 });
		
		 $("#editBtn").bind('click',function(){
			KE.sync('noticeContent');
			if($("#paramsSblog\\.sblog_title").val()==''){
				alert('帖子标题不能为空');
				return;
			}
			if($("#paramsSblog\\.sblog_type").val()=='0'){
				alert('帖子类型不能为空');
				return;
			}
			if($("#paramsSblog\\.sblog_content").val()==''){
				alert('帖子内容不能为空');
				return;
			}
			var aQuery = $("#info").serialize();  
			$.post('page_saveSblog.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('编辑成功！');
							 window.location.href="page_listMySblogs.action";
						}else  if(responseObj.err.msg){
							 alert('编辑失败：'+responseObj.err.msg);
						}else{
							 alert('编辑失败：服务器异常！');
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