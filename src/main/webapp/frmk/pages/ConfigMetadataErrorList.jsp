<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<s:url id="cancelUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">list</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	function editConfigMetadata(url){
		modal.init('<s:text name="configMetadata.edit.title"/>',url);
		modal.display();
	}
	function search(){<%-- funzione di "ricerca" fasulla che rimanda alla lista normale dei config dopo aver editato un config --%>
		document.location.href='<s:property value="#cancelUrl" escape="false" />';
	}
	$(function(){
		$('.with-tooltip').tooltip();
	});
	</script>
</head>
<body class="container-fluid">
	<s:if test="!popUp"><jsp:include page="Header.jsp" flush="true" /></s:if>
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-info">
				<div class="panel-heading"><h4 class="panel-title"><s:text name="configMetadata.errorList.results" /></h4></div>
				<div class="panel-footer">
					<div class="row">
						<div class="col-xs-3 text-left">
							<h4><s:text name="configMetadata.list.numRecord"/>&nbsp;<span class="badge"><s:property value="errorConfigMetadataList.size()"/></span></h4>
						</div>
						<div class="col-xs-9 text-right">
							<s:if test="!popUp">
								<ul class="group-list-icon">
									<li onclick="document.location.href='<s:property value="#cancelUrl" escape="false" />';">
										<span class="glyphicon glyphicon-arrow-left with-tooltip" data-title="<s:text name="configMetadata.image.backList"/>"></span><br/>
										<span class="glyphicon-descr"><s:text name="configMetadata.image.backList"/></span>
									</li>
								</ul>
							</s:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<s:if test="errorConfigMetadataList.size() == 0" ><s:text name="configMetadata.list.noResults"/></s:if>
			<s:else>
				<table class="table table-striped table-condensed table-hover table-bottom-border">
					<thead>
						<tr>
							<th width="1%">&nbsp;</th>
							<th><s:text name="configMetadata.title.code"/></th>
							<th><s:text name="configMetadata.list.application"/></th>
							<th><s:text name="configMetadata.list.section"/></th>
							<th><s:text name="configMetadata.title.value"/></th>
							<th><s:text name="configMetadata.title.type"/></th>
							<th><s:text name="configMetadata.title.missingMadatoryConfigField"/></th>
							<th><s:text name="configMetadata.title.conversionConfigError"/></th>
							<th><s:text name="configMetadata.title.duplicateConfigError"/></th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="errorConfigMetadataList" id="configMetadata" status="status">
							<tr>
				 				<td><%-- AZIONI --%>
									<s:url id="editUrl" action="configMetadata" includeParams="none" escapeAmp="false">
										<s:param name="task">editValues</s:param>
										<s:param name="reset">true</s:param>
										<s:param name="errorListMode">true</s:param>
										<s:param name="codeConfigMetadata" value="%{#configMetadata.code}"></s:param>
										<s:param name="applicationName" value="%{#configMetadata.application}"></s:param>
									</s:url>
									<span class="glyphicon glyphicon-th-list clickable with-tooltip" data-title="<s:text name="configMetadata.image.edit"/>" onclick="editConfigMetadata('<s:property value="#editUrl" escape="false"/>')"></span>
								</td>
								<td><s:property value="#configMetadata.code" /></td>
								<td><s:property value="#configMetadata.application" /></td>
								<td><s:property value="#configMetadata.section" /></td>
								<td>
									<s:if test="#configMetadata.clusterYN">
										<s:set var="clusterConfigMap" value="%{#configMetadata.getClusterConfigMap()}"></s:set>
										<dl>
											<s:iterator id="cluster" value="clusterList">
												<dt><s:property value="#cluster"/>:</dt>
												<s:set var="clusterConfigList" value="%{#clusterConfigMap.get(#cluster)}"></s:set>
												<dd>
													<s:if test="#clusterConfigList.size() == 1">
														<s:iterator id="val" value="#clusterConfigList">
															<s:property value="#val.getValue()"/>&nbsp;
														</s:iterator>
													</s:if>
													<s:elseif test="#clusterConfigList.size() > 1">
														<s:iterator id="val" value="#clusterConfigList">
															<s:if test="#val.nodeName == null || #val.nodeName.equals('') || #val.nodeName.equals(@java.lang.System@getProperty('clever.node'))">
																<s:property value="#val.getValue()"/>&nbsp;
															</s:if>
														</s:iterator>&nbsp;
													</s:elseif>
													<s:else>
														<s:if test="#configMetadata.isConfigMandatory(getSysConfigHandler())"><s:property value="getText('configMetadata.noValues')" escapeHtml="none"/></s:if>
													</s:else>
												</dd>
											</s:iterator>
										</dl>
									</s:if>
									<s:else>
										<s:if test="#configMetadata.configs.size() == 1">
											<s:iterator id="val" value="#configMetadata.configs">
												<s:property value="#val.getValue()"/>&nbsp;
											</s:iterator>
										</s:if>
										<s:elseif test="#configMetadata.configs.size() > 1">
											<ul class="list-unstyled">
											<s:iterator id="val" value="#configMetadata.configs">
												<s:if test="#val.nodeName == null || #val.nodeName.equals('') || #val.nodeName.equals(@java.lang.System@getProperty('clever.node'))">
													<li><s:property value="#val.getValue()"/></li>
												</s:if>
											</s:iterator>
											</ul>
										</s:elseif>
										<s:else>
											<s:if test="#configMetadata.isConfigMandatory(getSysConfigHandler())">
												<s:property value="getText('configMetadata.noValues')" escapeHtml="none"/>
											</s:if>
										</s:else>
									</s:else>
								</td>
								<td>
									<s:if test="#configMetadata.multipleYN">List&nbsp;<span class="badge"><s:property value="#configMetadata.type"/></span></s:if>
									<s:elseif test="#configMetadata.mapYN">Map&nbsp;<span class="badge"><s:property value="#configMetadata.type"/></span></s:elseif>
									<s:else><s:property value="#configMetadata.type"/></s:else>
								</td>
								<td>
									<span class="glyphicon <s:if test="!#configMetadata.missingMadatoryConfigField">glyphicon-ok text-success</s:if>
										<s:else>glyphicon-remove text-danger</s:else>"/>
								</td>
								<td>
									<span class="glyphicon <s:if test="!#configMetadata.conversionConfigError">glyphicon-ok text-success</s:if>
										<s:else>glyphicon-remove text-danger</s:else>"/>
								</td>
								<td>
									<span class="glyphicon <s:if test="!#configMetadata.duplicateConfigError">glyphicon-ok text-success</s:if>
										<s:else>glyphicon-remove text-danger</s:else>"/>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</s:else>
		</div>
	</div>
	<jsp:include page="./_modal.jsp" flush="true"/>
</body>
</html>	

