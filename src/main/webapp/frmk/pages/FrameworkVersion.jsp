<%@page import="it.quix.framework.web.interceptor.QuixUserInterceptor"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="Head.jsp" />
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="page-header">
		<h1><s:text name="framework.version"/>&nbsp;<small class="text-info"><s:property value="version"/></small></h1>
	</div>
</body>
</html>
