<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<s:url id="downloadFileUrl" action="admin" escapeAmp="false">
	<s:param name="task">getLog</s:param>
	<s:param name="downloadRequest"><s:property value="%{calls.get(#node.key)}"/></s:param>
	<s:param name="donloadDir"><s:property value="%{#nodeDir}" /></s:param>
	<s:param name="downloadLog"><s:property value="%{#listLog}"/></s:param>
</s:url>
<s:url id="getLogFileUrl" action="admin" includeParams="none" escapeAmp="false">
	<s:param name="task">getLogFile</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="row spacer-top">
		<div class="col-xs-12">
			<div class="panel panel-default">
				<div class="panel-heading"><h4 class="panel-title"><s:text name="loglist.title"/></h4></div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 panel-group">
							<s:iterator id="node" value="clusterMap" >
								<div class="panel panel-info">
									<div class="panel-heading"><h5 class="panel-title"><s:property value="#node.key"/></h5></div>
									<div class="list-group">
										<s:iterator id="nodeDir" value="%{orderDir(#node.value.keySet())}">
											<s:if test="%{(#node.value.get(#nodeDir).isEmpty()==false)}">
												<s:url id="downloadDirUrl" action="admin" escapeAmp="false" includeParams="none">
													<s:param name="task">getLog</s:param>
													<s:param name="downloadNode" value="#node.key"/>
													<s:param name="downloadDir" value="#nodeDir"/>
												</s:url>
												<a class="list-group-item list-group-item-warning" href="<s:property value="#downloadDirUrl" escape="false"/>">
													<s:property value="#nodeDir"/>
													<span class="badge"><span class="glyphicon glyphicon-folder-open"></span></span>
												</a>
												<s:iterator id="listLog" value="%{#node.value.get(#nodeDir)}">
													<s:url id="downloadLogUrl" action="admin" escapeAmp="false" includeParams="none">
														<s:param name="task">getLog</s:param>
														<s:param name="downloadNode" value="#node.key"/>
														<s:param name="downloadDir" value="#nodeDir"/>
														<s:param name="downloadLog" value="#listLog"/>
													</s:url>
													<a class="list-group-item" href="<s:property value="#downloadLogUrl" escape="false"/>">
														<s:property value="#listLog"/>
														<span class="badge"><span class="glyphicon glyphicon-file"></span></span>
													</a>
												</s:iterator>
											</s:if>
										</s:iterator>
									</div>
								</div>
							</s:iterator>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="!nodeErrors.isEmpty()">
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-danger">
					<div class="panel-heading"><h4 class="panel-title"><s:text name="logList.errors"/></h4></div>
					<ul class="list-group">
						<s:iterator id="errors" value="nodeErrors">
							<li class="list-group-item"><s:property value="#errors"/></li>
						</s:iterator>
					</ul>
				</div>
			</div>
		</div>
	</s:if>
</body>
</html>
