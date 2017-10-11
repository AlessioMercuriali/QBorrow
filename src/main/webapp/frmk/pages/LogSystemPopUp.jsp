<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.log4j.*" %>
<%@ page import="org.apache.commons.logging.Log" %>
<% Logger rootLogger = Logger.getRootLogger(); %>
<table class="table table-striped">
	<thead>
		<tr>
			<th><s:text name="logger.system.root"/></th>
			<th><s:text name="logger.system.level"/>:&nbsp;<%= rootLogger.getLevel() %></th>
		</tr>
	</thead>
	<tbody>
<% Enumeration<?> enumer = rootLogger.getAllAppenders();
	while(enumer.hasMoreElements()){
		Appender app = (Appender)enumer.nextElement();
%>
		<tr>
			<td><%= app.getName() %></td>
			<td><%= app.getClass().getName() %></td>
		</tr>
<% } %>
	</tbody>
	<tfoot>
		<tr><td colspan="2" class="text-center"><button type="button" data-dismiss="modal" class="btn btn-default"><s:text name="button.back"/></button></td></tr>
	</tfoot>
</table>