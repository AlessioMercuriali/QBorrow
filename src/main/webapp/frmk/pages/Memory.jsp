<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="it.quix.framework.web.interceptor.QuixUserInterceptor"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="org.apache.struts2.views.jsp.TagUtils"%>
<%@page import="java.lang.management.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"  %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%!
public String formatNumber(double value){
	String pattern = "###,###,###";
	DecimalFormat myFormatter = new DecimalFormat(pattern);
	String output = myFormatter.format(value);
	return output;
}%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<title>JVM Memory Monitor</title>
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="row spacer-top">
		<div class="col-xs-12">
			<div class="panel panel-info">
				<div class="panel-heading"><h4 class="panel-title"><s:text name="memory.system.title"/></h4></div>
				<div class="panel-body table-responsive">
					<table class="table table-striped table-condensed">
						<thead>
							<tr>
								<th><s:text name="memory.list.name"/></th>
								<th class="text-right"><s:text name="memory.list.init"/></th>
								<th class="text-right"><s:text name="memory.list.used"/></th>
								<th class="text-right"><s:text name="memory.list.committed"/></th>
								<th class="text-right"><s:text name="memory.list.max"/></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><s:text name="memory.system.heap"/></td>
								<td class="text-right"><%=formatNumber(ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getInit()/1024)%></td>
								<td class="text-right"><%=formatNumber(ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getUsed()/1024)%></td>
								<td class="text-right"><%=formatNumber(ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getCommitted()/1024)%></td>
								<td class="text-right"><%=formatNumber(ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getMax()/1024)%></td>
							</tr>
							<tr>
								<td><s:text name="memory.system.nonheap"/></td>
								<td class="text-right"><%=formatNumber(ManagementFactory.getMemoryMXBean().getNonHeapMemoryUsage().getInit()/1024)%></td>
								<td class="text-right"><%=formatNumber(ManagementFactory.getMemoryMXBean().getNonHeapMemoryUsage().getUsed()/1024)%></td>
								<td class="text-right"><%=formatNumber(ManagementFactory.getMemoryMXBean().getNonHeapMemoryUsage().getCommitted()/1024)%></td>
								<td class="text-right"><%=formatNumber(ManagementFactory.getMemoryMXBean().getNonHeapMemoryUsage().getMax()/1024)%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="row spacer-top">
		<div class="col-xs-12">
			<div class="panel panel-info">
				<div class="panel-heading"><h4 class="panel-title"><s:text name="memory.mxbean.title"/></h4></div>
				<div class="panel-body table-responsive">
					<table class="table table-striped table-condensed">
						<tbody>
<%				Iterator<?> iter = ManagementFactory.getMemoryPoolMXBeans().iterator();
				while (iter.hasNext()) {
					MemoryPoolMXBean item = (MemoryPoolMXBean) iter.next();%>
							<tr>
								<th colspan="5" class="info text-center"><%= item.getName() %></th>
							</tr>
							<tr>
								<th><s:text name="memory.list.type"/>:&nbsp;<%= item.getType() %></th>
								<th class="text-right"><s:text name="memory.list.init"/></th>
								<th class="text-right"><s:text name="memory.list.used"/></th>
								<th class="text-right"><s:text name="memory.list.committed"/></th>
								<th class="text-right"><s:text name="memory.list.max"/></th>
							</tr>
							<tr>
								<td><s:text name="memory.list.usage"/></td>
								<td class="text-right"><%= formatNumber(item.getUsage().getInit()/1024) %></td>
								<td class="text-right"><%= formatNumber(item.getUsage().getUsed()/1024) %></td>
								<td class="text-right"><%= formatNumber(item.getUsage().getCommitted()/1024) %></td>
								<td class="text-right"><%= formatNumber(item.getUsage().getMax()/1024) %></td>
							</tr>
							<tr>
								<td><s:text name="memory.list.peak"/></td>
								<td class="text-right"><%= formatNumber(item.getPeakUsage().getInit()/1024) %></td>
								<td class="text-right"><%= formatNumber(item.getPeakUsage().getUsed()/1024) %></td>
								<td class="text-right"><%= formatNumber(item.getPeakUsage().getCommitted()/1024) %></td>
								<td class="text-right"><%= formatNumber(item.getPeakUsage().getMax()/1024) %></td>
							</tr>
							<tr>
								<td><s:text name="memory.list.collection"/></td>
								<td class="text-right"><%= formatNumber((item.getCollectionUsage()==null)?0:item.getCollectionUsage().getInit()/1024) %></td>
								<td class="text-right"><%= formatNumber((item.getCollectionUsage()==null)?0:item.getCollectionUsage().getUsed()/1024) %></td>
								<td class="text-right"><%= formatNumber((item.getCollectionUsage()==null)?0:item.getCollectionUsage().getCommitted()/1024) %></td>
								<td class="text-right"><%= formatNumber((item.getCollectionUsage()==null)?0:item.getCollectionUsage().getMax()/1024) %></td>
							</tr>
<%					} %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

