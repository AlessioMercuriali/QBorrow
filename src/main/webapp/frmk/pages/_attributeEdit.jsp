<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="qf" uri="/quix-framework-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">

	$(function () {
	  $('[data-toggle="tooltip"]').tooltip();
	});
	
</script>

<style type="text/css">
	.tooltip-inverse .tooltip-inner {
	    color: #000;
	    background-color: #CCC;
	 }
</style>

<s:iterator id="atAttribute" value="attributeTypeAttributes" status="status">
	<s:if test="#atAttribute.visibileYN">
		<div class="form-group row control-group tooltip-inverse <qs2:inputErrorClass property="%{'attribute.attribute'+#status.count}"/>">
			<label for="" class="col-xs-12 col-sm-4 col-md-3"><s:property value="labelsAndHelpersAttributesForEditMap.get('ATT'+#status.count+'_LABEL')" /></label>
			<s:if test="#atAttribute.defaultValue != null && #atAttribute.defaultValue != ''">
				<span class="glyphicon glyphicon-pushpin" data-toggle="tooltip" data-placement="right" title="<s:text name="attribute.edit.defaultValueHelper"><s:param value="#atAttribute.defaultValue"/></s:text>"></span>
			</s:if>
			<div class="col-xs-12 col-sm-8 col-md-5">
				<s:if test="!#atAttribute.autogeneratoYN"><%--tag a seconda del tipo passato --%>
					<qf:attributeDisplayAttribute onlyActive="false" attributeMandatory="%{'attributeTypeAttributes['+#status.index+'].obbligatorioYN'}" 
					attributeType="%{'attributeTypeAttributes['+#status.index+'].tipo'}" attributeFullName="'attribute.attribute'+#status.count" 
					altroAttributeListName="'attribute'+#status.count+'AltriAttributeList'" />
				</s:if>
				<s:else>
					<s:if test="#status.count == 1"><s:property value="attribute.attribute1"/></s:if>
					<s:elseif test="#status.count == 2"><s:property value="attribute.attribute2"/></s:elseif>
					<s:elseif test="#status.count == 3"><s:property value="attribute.attribute3"/></s:elseif>
					<s:elseif test="#status.count == 4"><s:property value="attribute.attribute4"/></s:elseif>
					<s:elseif test="#status.count == 5"><s:property value="attribute.attribute5"/></s:elseif>
					<s:elseif test="#status.count == 6"><s:property value="attribute.attribute6"/></s:elseif>
					<s:elseif test="#status.count == 7"><s:property value="attribute.attribute7"/></s:elseif>
					<s:elseif test="#status.count == 8"><s:property value="attribute.attribute8"/></s:elseif>
					<s:elseif test="#status.count == 9"><s:property value="attribute.attribute9"/></s:elseif>
					<s:elseif test="#status.count == 10"><s:property value="attribute.attribute10"/></s:elseif>
				</s:else>
			</div>
			<div class="col-xs-12 col-md-4 help-block with-errors">
				<s:property value="labelsAndHelpersAttributesForEditMap.get('ATT'+#status.count+'_HELPER')"/>
				<qs2:errors property="%{'attribute.attribute'+#status.count}" />
			</div>
		</div>
	</s:if>
</s:iterator>