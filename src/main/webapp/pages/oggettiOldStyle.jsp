<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="_head.jsp"></jsp:include>
	</head>
	<body ng-app="qborrow">
		<div class="frameworkGlobalDiv">
			<ul>
			<s:iterator value="oggettiList" var="oggetto">
				<li><s:property value="#oggetto.titolo"/></li>
			</s:iterator>
			<s:form action="oggetti">
			<s:hidden name="task" value="listMieiOggettiStruts"/>
			<s:textfield name="search"></s:textfield>
			<button type="submit">cerca</button>
			</s:form>
			</ul>
		</div>
	</body>
</html>
