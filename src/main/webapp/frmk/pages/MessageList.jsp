<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:url action="message" id="pageUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">listPage</s:param>
	<s:param name="popup" value="popup"></s:param>
</s:url>
<s:url action="message" id="newMessageUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">edit</s:param>
	<s:param name="popup">true</s:param>
</s:url>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	function newMessage(){
		modal.init('<s:text name="message.edit.heading"/>','<s:property value="#newMessageUrl" escape="false"/>');
		modal.display();
	}
	function editMessage(url){
		modal.init('<s:text name="message.edit.heading"/>',url);
		modal.display();
	}
	function deleteMessage(url){
		modal.confirm('<s:text name="message.list.askConfirm"/>',url);
	}
	function search(){
		listPage(1);
	}
	function manageSearch(data){
		$('#messageListDiv').html(data);
		$('#ajaxloader').addClass('hidden');
		$('.with-tooltip').tooltip();
	}
	function listPage(page){
		$('#ajaxloader').removeClass('hidden');
		$('#messageListDiv').empty();
		parentDoResize();
		var params = [{name:'page',value:page}];
		qamCall('<s:property value="#pageUrl" escape="false"/>',params,manageSearch,'html','get');
	}
	$(function(){
		$('.with-tooltip').tooltip();
	});
	</script>
</head>
<body class="container-fluid">
	<s:if test="!popup"><jsp:include page="Header.jsp" flush="true" /></s:if>
	<jsp:include page="./_ajaxLoader.jsp" flush="true"/>
	<div id="messageListDiv" class="row"><jsp:include page="_messageList.jsp" flush="true" /></div>
	<jsp:include page="./_modal.jsp" flush="true"/>
</body>
</html>
