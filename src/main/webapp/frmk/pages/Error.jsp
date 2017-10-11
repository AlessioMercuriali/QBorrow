<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="org.apache.struts2.views.jsp.TagUtils"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="org.apache.commons.lang.exception.ExceptionUtils"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="Head.jsp" />
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="row spacer-top">
		<div class="col-xs-12">
			<div class="panel panel-warning">
				<div class="panel-heading"><h4 class="panel-title"><s:text name="error.internal.title" /></h4></div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-6">
							<label><s:text name="error.internal.message"/></label>
							<p><s:property value="exception.toString()"/></p>
						</div>
						<div class="col-xs-12 col-sm-6">
							<label><s:text name="error.internal.number"/></label>
							<p><s:property value="number"/></p>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label><s:text name="error.internal.cause"/></label>
							<p><s:if test="exception.cause != null"><s:property value="exception.cause.toString()"/></s:if></p>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label><s:text name="error.internal.detail"/>&nbsp;<span class="caret clickable" data-toggle="collapse" data-target="#errDetailCollapse"></span></label>
							<pre id="errDetailCollapse" class="collapse"><% Exception e = (Exception) request.getAttribute("exception");
								out.print(ExceptionUtils.getStackTrace(e)); %></pre>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<div class="row">
						<div class="col-xs-12 text-center">
						<s:url id="homeUrl" action="home" includeParams="none" escapeAmp="false"/>
							<button class="btn btn-default" onclick="document.location.href='<s:property value="#homeUrl" escape="false" />';"><s:text name="header.home" /></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>