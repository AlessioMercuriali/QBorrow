<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<s:url id="homeUrl" action="home" includeParams="none" escapeAmp="false" >
	<s:param name="task">execute</s:param>
	<s:param name="linkBarReset">true</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-danger">
				<div class="panel-heading" ><h4 class="panel-title"><s:text name="error.internal.title" />:&nbsp;<s:text name="lockManager.lockAlreadyLockedTitle"/>&nbsp;<span class="glyphicon glyphicon-lock"></span></h4></div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-8 col-sm-offset-2">
							<s:text name="lockManager.lockAlreadyLockedMessage">
								<s:param  value="exception.lockGroup.lockUser"/>
							</s:text>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 table-responsive">
							<table class="table table-striped table-condensed table-border-bottom">
								<thead>
									<tr>
										<th><s:text name="lockManager.lockAlreadyLockedEntityName"/></th>
										<th><s:text name="lockManager.lockAlreadyLockedEntityKey"/></th>
										<th><s:text name="lockManager.lockAlreadyLockedGroupCode"/></th>
										<th><s:text name="lockManager.lockAlreadyLockedLocked"/></th>
									</tr>
								</thead>
								<tbody>
									<s:iterator id="lockInUseView" value="exception.lockInUserViewList" status="status">
										<tr>
											<td><s:property value="#lockInUseView.entityName"/></td>
											<td><s:property value="#lockInUseView.entityKey"/></td>
											<td><s:property value="#lockInUseView.codeGroup"/></td>
											<td>
												<span class="glypicon glyphicon-<s:if test="#lockInUseView.locked">ok text-success</s:if>
													<s:else>remove text-danger</s:else>"></span>
											</td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-8 col-sm-offset-2">
							<p><s:text name="lockManager.lockSmallMessage1" />&nbsp;<s:property value="exception.lockGroup.lockTime"/><s:text name="lockManager.lockSmallMessage2" />&nbsp;<s:property value="exception.lockGroup.checkTime"/>.</p>	
							<p><s:text name="lockManager.lockAlreadyLockedSmallMessage"/></p>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<div class="row">
						<div class="col-xs-12 text-center">
							<s:if test="configuration.actionTaskUrlMap != null && configuration.actionTaskUrlMap.containsKey(actionName + '|' + task)">
								<button class="btn btn-default" onclick="document.location.href='<s:property value="configuration.actionTaskUrlMap.get(actionName + '|' + task)"/>';" ><s:text name="button.back"/></button>
							</s:if>
							<s:else>
								<button class="btn btn-default" onclick="document.location.href='<s:property value="#homeUrl"/>';" ><s:text name="lockManager.button.home"/></button>
							</s:else>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>