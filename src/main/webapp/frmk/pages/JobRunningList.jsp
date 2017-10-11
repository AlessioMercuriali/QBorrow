<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<s:url action="scheduler" id="backUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">listJob</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<s:url action="scheduler" id="refreshUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">listJobRunning</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	function backToJobList(){
		document.location.href = '<s:property value="#backUrl" escape="false" />';
	}
	function updateJobRunningList(){
		document.location.reload();
	}
	</script>
	<style>
		.redIcon {
		  color: #800517;
		}
	</style>
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="row">
		<jsp:include page="./_jobRunningList.jsp" flush="true" />
	</div>
</body>
</html>
