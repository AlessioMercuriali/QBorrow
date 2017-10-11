<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="qf" uri="/quix-framework-tags"%>
<tr id="config_<s:property value="#status.index"/>">
	<td>
		<s:if test="!readonly && configMetadata.companyYN && configMetadata.configurableValuesYN">	
			<s:select list="companyList"
				name="%{'configList['+#status.index+'].company'}"
				cssClass="form-control"
				required="true"
				emptyOption="false">
			</s:select>
			<qs2:errors property="%{'configMetadata.company' + #status.index}" />
		</s:if>
		<s:else>
			<p class="text-muted"><s:property value="#config.company" /></p>
		</s:else>
	</td>
	<s:if test="configMetadata.clusterYN">
		<td class="control-group">
			<s:if test="!readonly && configMetadata.configurableValuesYN">
				<s:select id="%{'configCluster'+#status.index}" list="clusterList" name="%{'configList['+#status.index+'].nodeName'}" cssClass="form-control" required="true"></s:select>
			</s:if>
			<s:else><p class="text-muted"><s:property value="#config.nodeName" /></p></s:else>
		</td>
	</s:if>
	<s:if test="configMetadata.multipleYN || configMetadata.mapYN">
		<td class="control-group <s:if test="configMetadata.multipleYN"><qs2:inputErrorClass property="%{'configMetadata.position' + #status.index}" /></s:if><s:else><qs2:inputErrorClass property="%{'configMetadata.mapKey' + #status.index}" /></s:else>">
			<s:if test="!readonly && configMetadata.configurableValuesYN">
				<input id="configkey<s:property value="#status.index"/>" type="text" <s:if test="configMetadata.multipleYN">name="configList[<s:property value="#status.index"/>].position" data-number="1" value="<s:property value="#config.position"/>"</s:if>
				<s:else>name="configList[<s:property value="#status.index"/>].mapKey" value="<s:property value="#config.mapKey"/>"</s:else> class="form-control" required/>
			</s:if>
			<s:else>
				<s:if test="configMetadata.multipleYN"><s:property value="#config.position"/></s:if>
				<s:else><s:property value="#config.mapKey"/></s:else>
			</s:else>
			<div class="help-block with-errors">
				<s:if test="configMetadata.multipleYN"><qs2:errors property="%{'configMetadata.position' + #status.index}" /></s:if>
				<s:else><qs2:errors property="%{'configMetadata.mapKey' + #status.index}" /></s:else>
			</div>
		</td>
	</s:if>
	<td class="control-group <qs2:inputErrorClass property="%{'configMetadata.value' + #status.index}"/>">
		<s:if test="!readonly && configMetadata.configurableValuesYN">
<%-- 			<s:textfield id="%{'configvalue'+#status.index}" name="%{'configList['+#status.index+'].value'}" cssClass="form-control" value="%{#config.value}" required="true"></s:textfield> --%>
				<qf:configMetadataConfig2Input name="%{'configList['+#status.index+'].value'}" id="%{'configvalue'+#status.index}" required="true" metadata="configMetadata"/>
		</s:if>
		<s:else><s:property value="#config.value"/></s:else>
		<div class="help-block with-errors"><qs2:errors property="%{'configMetadata.value' + #status.index}"/></div>
	</td>
	<s:if test="!readonly && configMetadata.configurableValuesYN">
		<td>
			<s:if test="%{canDeleteValues(configMetadata)}">
				<ul class="list-icon">
					<li onclick="configValueDelete(<s:property value="#status.index"/>);">
						<span class="glyphicon glyphicon-trash"></span><br>
						<span class="glyphicon-descr"><s:text name="config.edit.deleteConfig"/></span>
					</li>
	<%-- 				<li onclick="configValueCopy(<s:property value="#status.index"/>);">
						<span class="glyphicon glyphicon-file "></span><br>
						<span class="glyphicon-descr"><s:text name="config.edit.copyConfig"/></span>
					</li>--%>
				</ul>
			</s:if>
		</td>
	</s:if>
</tr>