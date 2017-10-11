<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.exception.ExceptionUtils"%>
<%@page import="org.apache.tomcat.dbcp.dbcp.BasicDataSource"%>
<%@page import="it.quix.framework.web.interceptor.QuixUserInterceptor"%>
<%@page import="it.quix.framework.core.exception.SystemException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.SQLException"%><%-- JSP visualizza i parametri di connessione al database --%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NameNotFoundException"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Hashtable"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Head.jsp" />
<title>Datasource connection details</title>
<script type="text/javascript">
	$(function() {
		$('#dbForm').validator('validate');
	});
</script>
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="row spacer-top">
		<div class="col-xs-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<s:text name="database.title" />
					</h4>
				</div>
				<form id="dbForm" class="panel-body form-horizontal"
					action="<%=request.getContextPath()%>/frmk/pages/Database.jsp"
					method="get">
					<div class="form-group">
						<div class="control-group col-xs-12 col-sm-8">
							<label for="nameSearch"><s:text
									name="database.datasource" /></label> <input id="nameSearch"
								type="text" name="nameSearch" class="form-control"
								value="<%=request.getParameter("nameSearch") != null ? request.getParameter("nameSearch") : ""%>"
								required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12 text-center">
							<button type="submit" class="btn btn-primary">
								<s:text name="button.search" />
								&nbsp;<span class="glyphicon glyphicon-search"></span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<%
				if (request.getParameter("nameSearch") != null && request.getParameter("nameSearch") != "") {
					Connection con = null;
					try {
						String DATASOURCE_NAME = request.getParameter("nameSearch"); // "java:comp/env/jdbc/exampleid";
						String absoluteDatasourceName = "java:comp/env/";
						absoluteDatasourceName = absoluteDatasourceName.concat(DATASOURCE_NAME);
						Context initCtx = new InitialContext();
						DataSource datasource = (DataSource) initCtx.lookup(absoluteDatasourceName);
						con = datasource.getConnection();
						DatabaseMetaData dmd = con.getMetaData();
						BasicDataSource oBDs = null;
						if (datasource instanceof BasicDataSource) {
							oBDs = (BasicDataSource) datasource;
						}
			%>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label><s:text name="database.detail.sourceClass" /></label>
					<p><%=datasource.getClass().getName()%></p>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label><s:text name="database.detail.productName" /></label>
					<p><%=dmd.getDatabaseProductName()%></p>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label><s:text name="database.detail.productVersion" /></label>
					<p><%=dmd.getDatabaseProductVersion()%></p>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label><s:text name="database.detail.driverName" /></label>
					<p><%=dmd.getDriverName()%></p>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label><s:text name="database.detail.driverVersion" /></label>
					<p><%=dmd.getDriverVersion()%></p>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label><s:text name="database.detail.url" /></label>
					<p><%=dmd.getURL()%></p>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label><s:text name="database.detail.connOpen" /></label>
					<p><%=oBDs != null ? /*((BasicDataSource) datasource)*/oBDs.getNumActive() : ""%></p>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label><s:text name="database.detail.connIdle" /></label>
					<p><%=oBDs != null ? /*((BasicDataSource) datasource)*/oBDs.getNumIdle() : ""%></p>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label><s:text name="database.detail.connMax" /></label>
					<p><%=oBDs != null ? /*((BasicDataSource) datasource)*/oBDs.getMaxActive() : ""%></p>
				</div>
			</div>
			<%
				} catch (SQLException e) {
			%>
			<p class="text-center text-danger">
				<s:text name="database.error.sql" />
				&nbsp;<span class="caret clickable" data-toggle="collapse"
					data-target="#preCollapse"></span>
			</p>
			<pre id="preCollapse" class="collapse">
				<%
					out.print(ExceptionUtils.getStackTrace(e));
				%>
			</pre>
			<%
				} catch (NameNotFoundException e) {
			%>
			<p class="text-center text-warning">
				<s:text name="database.error.namePre" />
				&nbsp;<i class="mark"><s:property value="#parameters.nameSearch" /></i>&nbsp;
				<s:text name="database.error.namePost" />
				&nbsp;<span class="caret clickable" data-toggle="collapse"
					data-target="#preCollapse"></span>
			</p>
			<pre id="preCollapse" class="collapse">
				<%
					out.print(ExceptionUtils.getStackTrace(e));
				%>
			</pre>
			<%
				} catch (Exception e) {
			%>
			<p class="text-center text-danger">
				<s:text name="database.error.generic" />
				&nbsp;<span class="caret clickable" data-toggle="collapse"
					data-target="#preCollapse"></span>
			</p>
			<pre id="preCollapse" class="collapse">
				<%
					out.print(ExceptionUtils.getStackTrace(e));
				%>
			</pre>
			<%
				} finally {
						if (con != null) {
							con.close();
						}
					}
				}
			%>
		</div>
	</div>
</body>
</html>