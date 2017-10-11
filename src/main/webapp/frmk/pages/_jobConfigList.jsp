<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="org.apache.struts2.views.jsp.TagUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="qf2" uri="/quix-framework-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="jobConfigMetadataList != null && jobConfigMetadataList.size() > 0" >
	<script type="text/javascript">
		function editJobConfig(url, idx) {
			$('.jobConfigs tr.info').removeClass('info');
			$('#jobCfg' + idx).addClass('info');
			$('#jobConfEdit').empty();
			$('#ajaxloaderJobConfig').removeClass('hidden');
			qamCall(url, [], manageEditJobConfig, 'html', 'get');
		}
		function manageEditJobConfig(data) {
			$('#ajaxloaderJobConfig').addClass('hidden');
			$('#jobConfEdit').html(data);
		}
		function closeJobConfigEdit(){
			$('.jobConfigs tr.info').removeClass('info');
			$('#jobConfEdit').empty();
		}
	</script>
	<jsp:include page="./_ajaxLoader.jsp">
		<jsp:param value="JobConfigMetadata" name="innerId"/>
	</jsp:include>
	<div class="row" id="jobConfigMetadataList">
		<div class="col-xs-12">
			<div class="table-responsive">
				<table class="table table-hover table-striped table-bottom-border">
					<thead>
						<tr>
							<th class="narrow">&nbsp;</th>
							<th><s:text name="configMetadata.title.code"/></th>
	 						<th><s:text name="configMetadata.title.value"/></th>
							<th><s:text name="configMetadata.title.type"/></th>
							<th class="narrow"><s:text name="configMetadata.title.clusterYN"/></th>
						</tr>
					</thead>
					<tbody class="jobConfigs">
						<s:iterator value="jobConfigMetadataList" id="configMetadata" status="status">
							<tr id="jobCfg<s:property value="#status.index"/>">
								<td class="narrow">
									<s:url id="editValUrl" action="configMetadata" includeParams="none" escapeAmp="false" encode="false">
										<s:param name="task">editJobValues</s:param>
										<s:param name="reset">true</s:param>
										<s:param name="codeConfigMetadata" value="#configMetadata.code"></s:param>
										<s:param name="applicationName" value="%{#configMetadata.application}"></s:param>
									</s:url>
									<span class="glyphicon glyphicon-th-list clickable with-tooltip" data-title="<s:text name="configMetadata.image.editValues"/>" onclick="editJobConfig('<s:property value="#editValUrl" escape="false"/>', <s:property value="#status.index"/>);"></span>
								</td>
								<td><s:property value="#configMetadata.code" /></td>
								<td><%-- VALORI --%>
									<qf2:configMetadataDisplayConfig value="#configMetadata" max="3"/>
								</td>
								<td>
									<s:if test="#configMetadata.multipleYN">List<%-- &nbsp;<span class="badge"><s:property value="#configMetadata.type"/></span> --%></s:if>
									<s:elseif test="#configMetadata.mapYN">Map<%-- &nbsp;<span class="badge"><s:property value="#configMetadata.type"/></span> --%></s:elseif>
									<s:else><s:property value="#configMetadata.type"/></s:else>
								</td>
								<td class="text-center narrow">
									<span class="glyphicon <s:if test="#configMetadata.clusterYN">glyphicon-ok text-success</s:if>
										<s:else>glyphicon-remove text-danger</s:else>"/>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="./_ajaxLoader.jsp">
		<jsp:param value="JobConfig" name="innerId"/>
	</jsp:include>
	<div class="row">
		<div class="col-xs-12" id="jobConfEdit"></div>
	</div>
</s:if>
<s:else><span class="spacer-top"><s:text name="configMetadata.list.noResults"/></span></s:else>
