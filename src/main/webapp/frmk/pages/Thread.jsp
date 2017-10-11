<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@page import="it.quix.framework.web.interceptor.QuixUserInterceptor"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.SQLException"%><%-- JSP visualizza i parametri di connessione al database --%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.management.ThreadMXBean"%>
<%@page import="java.lang.management.ManagementFactory"%>
<%@page import="java.lang.management.ThreadInfo"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Head.jsp" />
<title>JVM executing threads details</title>
<link rel="stylesheet" type="text/css"
	href="<qs2:themesPath framework="true" nome="/dataTables.bootstrap.css"/>" />
<script type="text/javascript"
	src="<qs2:scriptsPath framework="true" nome="/jquery.dataTables.js"/>"></script>
<script type="text/javascript"
	src="<qs2:scriptsPath framework="true" nome="/dataTables.bootstrap.js"/>"></script>
<script type="text/javascript" charset="utf-8">
	$(function() {
		$('#tableToShow').dataTable({
			scrollX : true
		});
	});
</script>

</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<%!public static List<Thread> threadList = new ArrayList<Thread>();
	public static Map<Thread, Long> startTimeMap = new HashMap<Thread, Long>();
	public static Map<Thread, Long> stopTimeMap = new HashMap<Thread, Long>();

	//List all threads and recursively list all subgroup
	public static void listThreads(ThreadGroup group, String indent) {
		int nt = group.activeCount();
		Thread[] threads = new Thread[nt * 2 + 10]; //nt is not accurate
		nt = group.enumerate(threads, false);
		// List every thread in the group
		for (int i = 0; i < nt; i++) {
			Thread t = threads[i];
			threadList.add(t);
		}
		// Recursively list all subgroups
		int ng = group.activeGroupCount();
		ThreadGroup[] groups = new ThreadGroup[ng * 2 + 10];
		ng = group.enumerate(groups, false);
		for (int i = 0; i < ng; i++) {
			listThreads(groups[i], indent + "  ");
		}
	}%>
	<%
		// Walk up all the way to the root thread group
		ThreadGroup rootGroup = Thread.currentThread().getThreadGroup();
		ThreadMXBean threadBean = ManagementFactory.getThreadMXBean();
		ThreadGroup parent;
		while ((parent = rootGroup.getParent()) != null) {
			rootGroup = parent;
		}
		threadList = new ArrayList<Thread>();
		listThreads(rootGroup, "");
		for (Thread t : threadList) {
			startTimeMap.put(t, threadBean.getThreadCpuTime(t.getId()));
		}
		Thread.sleep(10000);
		for (Thread t : threadList) {
			stopTimeMap.put(t, threadBean.getThreadCpuTime(t.getId()));
		}
	%>
	<div class="row spacer-top">
		<div class="col-xs-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h4 class="panel-title">
						<s:text name="thread.title" />
					</h4>
				</div>
				<div class="panel-body">
					<table id="tableToShow" class="table table-striped table-condensed">
						<thead>
							<tr>
								<th><s:text name="thread.list.number" /></th>
								<th><s:text name="thread.list.group" /></th>
								<th><s:text name="thread.list.name" /></th>
								<th><s:text name="thread.list.cpuTime" /></th>
								<th><s:text name="thread.list.userTime" /></th>
								<th><s:text name="thread.list.state" /></th>
								<th><s:text name="thread.list.stackTrace" /></th>
							</tr>
						</thead>
						<tbody>
							<%
								int i = 1;
								for (Thread t : threadList) {
									if (t != null) {
							%>
							<tr>
								<td><%=i%></td>
								<td><%=t.getThreadGroup().getName()%></td>
								<td><%=t.getName()%></td>
								<td><%=threadBean.getThreadCpuTime(t.getId()) / 1000%> (+<%=(stopTimeMap.get(t) - startTimeMap.get(t)) / 1000%>)
								</td>
								<td><%=threadBean.getThreadUserTime(t.getId()) / 1000%></td>
								<td><%=t.getState()%></td>
								<td>
									<ul class="list-unstyled">
										<%
											for (StackTraceElement s : t.getStackTrace()) {
										%>
										<li><%=s.toString()%></li>
										<%
											}
										%>
									</ul>
								</td>
							</tr>
							<%
								i++;
									}
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
