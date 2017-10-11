<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="org.apache.struts2.views.jsp.TagUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="qf2" uri="/quix-framework-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="col-xs-12">
	<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-condensed">
				<div class="row">
					<div class="col-xs-3 text-left">
						<b><s:text name="configMetadata.list.numRecord"/>&nbsp;<span class="label label-info"><s:property value="configMetadataSearch.getTotal()"/></span></b>
					</div>
					<div class="col-xs-9 text-right">
						<s:if test="!popUp">
							<ul class="group-list-icon">
								<%-- <s:if test="getConfigAsBoolean('Framework','DEFAULT','FRMK031_EnableSysConfigGenerateScriptsButton')"> --%>
									<li onclick="checkAndGenerateScripts();">
										<span class="filetype sql with-tooltip" data-title="<s:text name="configMetadata.image.generateScripts"/>"></span><br/>
										<span class="glyphicon-descr"><s:text name="configMetadata.image.generateScripts"/></span>
									</li>
								<%-- </s:if> --%>
								<s:url action="configMetadata" id="errorListUrl" escapeAmp="false" includeParams="none">
									<s:param name="task">errorList</s:param>
								</s:url>
								<li onclick="createExcel();">
									<span class="filetype xls with-tooltip" data-title="Complete Excel"></span><br/>
									<span class="glyphicon-descr"><s:text name="configMetadata.image.completeExcel"/></span>
								</li>
								<li onclick="document.location.href='<s:property value="#errorListUrl" escape="false"/>';">
									<span class="glyphicon glyphicon-warning-sign with-tooltip" data-title="<s:text name="configMetadata.image.errorList"/>"></span><br/>
									<span class="glyphicon-descr"><s:text name="configMetadata.image.errorList"/></span>
								</li>
								<li onclick="emptyCache();">
									<span class="glyphicon glyphicon-trash with-tooltip" data-title="<s:text name="configMetadata.image.emptyAllCache"/>"></span><br/>
									<span class="glyphicon-descr"><s:text name="configMetadata.image.emptyAllCache"/></span>
								</li>
								<li onclick="createPage()">
									<span class="glyphicon glyphicon-plus-sign with-tooltip" data-title="<s:text name="button.createConfigMetadata"/>"></span><br/>
									<span class="glyphicon-descr"><s:text name="button.createConfigMetadata"/></span>
								</li>
							</ul>
						</s:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="configMetadataList != null && configMetadataList.size() > 0" >
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table class="table table-hover table-striped table-bottom-border table-sectioned">
						<thead>
							<tr>
								<th class="narrow">
									<img id="totalCheckLoader" src="<qs2:imagesPath framework="true" nome="/mini-ajax-loader.gif"/>" class="hidden">
									<input id="selectAllCheck" type="checkbox" onclick="selectAllRows();"/>
								</th>
								<th class="narrow">&nbsp;</th>
								<th class="narrow">&nbsp;</th>
								<s:if test="configMetadataSearch.section == null || configMetadataSearch.section == ''">
									<th><s:text name="configMetadata.list.section"/></th>
								</s:if>
								<th><s:text name="configMetadata.title.code"/></th>
		 						<th><s:text name="configMetadata.title.value"/></th>
								<th><s:text name="configMetadata.title.type"/></th>
								<th><s:text name="configMetadata.title.clusterYN"/></th>
							</tr>
						</thead>
						<s:iterator value="fieldsetConfigMetadataTreeMap.keySet()" id="fieldset" status="fieldStatus">
							<tbody>
								<tr class="active"><th colspan="<s:if test="configMetadataSearch.section == null || configMetadataSearch.section == ''">10</s:if><s:else>9</s:else>"><s:property value="#fieldset"/></th></tr>
								<s:set var="fieldsetConfigMetadataList" value="%{fieldsetConfigMetadataTreeMap.get(#fieldset.toString())}"></s:set>
								<s:iterator value="#fieldsetConfigMetadataList" id="configMetadata" status="status">
									<tr id="configDesc<s:property value="%{#fieldStatus.index+'_'+#status.index}"/>">
										<td class="narrow">
											<img id="checkLoader<s:property value="%{#fieldStatus.index+'_'+#status.index}"/>" src="<qs2:imagesPath framework="true" nome="/mini-ajax-loader.gif"/>" class="hidden row-loader">
											<input id="select<s:property value="%{#fieldStatus.index+'_'+#status.index}"/>Check" class="row-check" type="checkbox" onclick="selectDeselectRow(this,'<s:property value="%{#configMetadata.configMetadataId}"/>','<s:property value="%{#fieldStatus.index+'_'+#status.index}"/>');"/>
										</td>
										<td class="narrow">
											<span id="configToggle<s:property value="%{#fieldStatus.index+'_'+#status.index}"/>"
												onclick="toggleRow('configDetail<s:property value="%{#fieldStatus.index+'_'+#status.index}"/>','configToggle<s:property value="%{#fieldStatus.index+'_'+#status.index}"/>');"
												class="glyphicon glyphicon-plus clickable"></span>
										</td>
										<td class="narrow">
											<s:url id="editValUrl" action="configMetadata" includeParams="none" escapeAmp="false">
												<s:param name="task">editValues</s:param>
												<s:param name="reset">true</s:param>
												<s:param name="codeConfigMetadata" value="%{#configMetadata.code}"></s:param>
												<s:param name="applicationName" value="%{#configMetadata.application}"></s:param>
												<s:param name="jobConfig">false</s:param>
											</s:url>
											<span class="glyphicon glyphicon-th-list clickable with-tooltip" data-title="<s:text name="configMetadata.image.editValues"/>" onclick="editConfigValues('<s:property value="#configMetadata.code" />','<s:property value="#editValUrl" escape="false"/>');"></span>
										</td>
										<s:if test="configMetadataSearch.section == null || configMetadataSearch.section == ''">
											<td><s:property value="#configMetadata.section" /></td>
										</s:if>
										<td><s:property value="#configMetadata.code" /></td>
										<td><%-- VALORI --%>
											<qf2:configMetadataDisplayConfig value="#configMetadata" max="3"/>
										</td>
										<td>
											<s:if test="#configMetadata.multipleYN">List<%-- &nbsp;<span class="badge"><s:property value="#configMetadata.type"/></span> --%></s:if>
											<s:elseif test="#configMetadata.mapYN">Map<%-- &nbsp;<span class="badge"><s:property value="#configMetadata.type"/></span> --%></s:elseif>
											<s:else><s:property value="#configMetadata.type"/></s:else>
										</td>
										<td class="narrow text-center">
											<span class="glyphicon <s:if test="#configMetadata.clusterYN">glyphicon-ok text-success</s:if>
												<s:else>glyphicon-remove text-danger</s:else>"/>
										</td>
									</tr>
									<tr id="configDetail<s:property value="%{#fieldStatus.index+'_'+#status.index}"/>" class="hidden togglable">
										<td colspan="<s:if test="configMetadataSearch.section == null || configMetadataSearch.section == ''">8</s:if><s:else>7</s:else>">
											<ul class="list-icon"><%-- AZIONI --%>
												<s:url id="editUrl" action="configMetadata" includeParams="none" escapeAmp="false">
													<s:param name="task">edit</s:param>
													<s:param name="reset">true</s:param>
													<s:param name="codeConfigMetadata" value="%{#configMetadata.code}"></s:param>
													<s:param name="applicationName" value="%{#configMetadata.application}"></s:param>
												</s:url>
												<li onclick="editConfigMetadata('<s:property value="#editUrl" escape="false"/>');">
													<span class="glyphicon glyphicon-pencil with-tooltip" data-title="<s:text name="configMetadata.image.edit"/>"></span>
													<br/><span class="glyphicon-descr"><s:text name="configMetadata.image.edit"/></span>
												</li>
												<s:url id="emptyCacheByTypeUrl" action="configMetadata" includeParams="none" escapeAmp="false">
													<s:param name="task">emptyCacheByType</s:param>
													<s:param name="emptyCacheType" value="#configMetadata.type" />
												</s:url>
												<li onclick="emptyCacheByType('<s:property value="#emptyCacheByTypeUrl" escape="false"/>', '<s:property value="#configMetadata.code" />');">
													<span id="emptyCache<s:property value="%{#fieldStatus.index+'_'+#status.index}"/>" class="glyphicon glyphicon-trash with-tooltip" data-title="<s:text name="configMetadata.image.emptyCache"/>"></span>
													<br/><span class="glyphicon-descr"><s:text name="configMetadata.image.emptyCache"/></span>
												</li>
											</ul>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</s:iterator>
					</table>
				</div>
			</div>
		</div>
	</s:if>
	<s:else><s:text name="configMetadata.list.noResults"/></s:else>
</div>
