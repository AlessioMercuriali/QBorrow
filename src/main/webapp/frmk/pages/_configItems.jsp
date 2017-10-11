<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<div class="col-xs-12">
	<s:if test="configMetadata.helper != null && configMetadata.helper != '' ">
		<h4 class="text-muted"><s:property value="configMetadata.helper"/></h4>
	</s:if>
	<s:if test="configMetadata.defaultValue != null && configMetadata.defaultValue != ''">
		<span class="text-muted"><s:text name="configMetadata.edit.defaultValueHelper"/></span><br>
		<span class="glyphicon glyphicon-pushpin text-muted"></span>
		<span class="text-muted"><s:text name="configMetadata.edit.defaultValue"/>:&nbsp;<b><s:property value="configMetadata.defaultValue"/></b></span>
	</s:if>
	<table class="table table-hover table-striped spacer-top">
		<thead>
			<tr>
				<th><s:text name="config.edit.company"/></th>
				<s:if test="configMetadata.clusterYN"><th><s:text name="config.edit.name"/></th></s:if>
				<s:if test="configMetadata.multipleYN || configMetadata.mapYN"><th><s:if test="configMetadata.multipleYN"><s:text name="config.edit.position"/></s:if><s:else><s:text name="config.edit.mapKey"/></s:else></th></s:if>
				<th><s:text name="config.edit.value"/></th>
				<s:if test="!readonly && configMetadata.configurableValuesYN">
					<th class="small">
						<s:if test="%{canAddValues(configMetadata)}">
							<ul class="group-list-icon small">
								<li onclick="configValueAdd();">
									<span class="glyphicon glyphicon-plus"></span><br>
									<span class="glyphicon-descr"><s:text name="config.edit.addConfig"/></span>
								</li>
							</ul>
						</s:if>
					</th>
				</s:if>
			</tr>
		</thead>
		<tbody id="configValuesTable">
			<s:iterator status="status" value="configList" id="config">
				<%@ include file="_configItemRow.jsp" %>
			</s:iterator>
		</tbody>
	</table>
</div>
