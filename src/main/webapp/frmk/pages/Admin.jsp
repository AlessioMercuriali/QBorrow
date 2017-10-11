<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	var currentPageLinkBarTitle = '';
	</script>
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="row"><%--  corpo centrale --%>
		<div class="col-xs-12 col-sm-8 col-sm-offset-2">
			<ul>
				<li><a href="<%=request.getContextPath() %>/logger.action?task=list">Logger</a></li>
				<li><a href="<%=request.getContextPath() %>/configMetadata.action?task=list">Gestione_Sys_Config</a></li>
				<li><a href="<%=request.getContextPath() %>/attributeType.action?task=list&reset=true">Gestione_Sys_Attribute</a></li>
				<li><a href="<%=request.getContextPath() %>/lockManager.action?task=list&reset=true">Lock</a></li>
				<li><a href="<%=request.getContextPath() %>/database.action">Database</a></li>
				<li><a href="<%=request.getContextPath() %>/admin.action?task=logFileList">Log File List</a></li>
				<li><a href="<%=request.getContextPath() %>/memory.action">Memory</a></li>
				<li><a href="<%=request.getContextPath() %>/thread.action">Thread</a></li>
				<li><a href="<%=request.getContextPath() %>/admin.action?task=showVersion">Framework_Version</a></li>
				<li><a href="<%=request.getContextPath() %>/scheduler.action?task=listJob">Jobs</a></li><%-- scheduler part --%>
				<li><a href="<%=request.getContextPath() %>/label.action">Label</a></li>
			</ul>
		</div>
	</div>
</body>
</html>