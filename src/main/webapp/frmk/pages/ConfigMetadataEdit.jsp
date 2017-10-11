<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:url id="cancelUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">list</s:param>
</s:url>

<s:url id="addConfigUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">addConfig</s:param>
</s:url>
<s:url id="copyConfigUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">copyConfig</s:param>
</s:url>
<s:url id="deleteConfigUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">deleteConfig</s:param>
</s:url>
<script type="text/javascript">
function validateForm(){
	$('#confMetaForm').validator('validate');
}
function getSectionFields(sel){
	var $sel = $(sel);
	if ($sel.val() == ''){
		$('#confFields').val('').children('[value=""]').siblings().remove();
		validateForm();
		return;
	}
	var params = [{name:'task',value:'refreshEdit2'},
		{name:'refreshType',value:'fieldsetList'},
		{name:$sel.attr('name'),value:$sel.val()}];
	$('#confFields').prop('disabled',true);
	qamCall($('#confMetaForm').prop('action'),params,manageSectionFields,'html','get');
}
function manageSectionFields(data){
	$('#confFields').replaceWith(data);
}
function toggleMandatory(check){
	var checked = $(check).prop('checked');
	$('#confCodeLeader').prop('disabled',!checked);
	if (!checked) $('#confCodeLeader').val('');
	validateForm();
}
function typeChange() {
	var form = $('#confMetaForm');
	var params = [{name:'task',value:'refreshEdit2'},
		{name:'refreshType',value:'typeInput'},
		{name:'configMetadata.type',value:form.find('select[name="configMetadata.type"]').val()}];
	qamCall(form.prop('action'),params,manageTypeChange,'html','get');
	$('#confTypeData').empty();
}
function manageTypeChange(data){
	$('#confTypeData').html(data);
	validateForm();
}
function saveConfigMeta(){
	$(modal.content).addClass('hidden');
	modal.load(true);
	var form = $('#confMetaForm');
	qamCall(form.prop('action'),form.serializeArray(),manageSaveConfigMeta,'json','post');
	return false;;
}
function manageSaveConfigMeta(data){
	$(modal.content).removeClass('hidden');
	modal.closeNsearch();
}
function setResetMultipleMap(multipleMap){
	if(multipleMap == 'multiple'){
		if($('#confMultiple').prop('checked')) $('#confMap').prop('checked',false);
	}else if(multipleMap == 'map'){
		if($('#confMap').prop('checked')) $('#confMultiple').prop('checked',false);
	}
}
$(function(){
	validateForm();
})
</script>
<s:form action="configMetadata" id="confMetaForm" cssClass="form-horizontal" role="form" onsubmit="return saveConfigMeta()" >
	<s:hidden name="task" value="save2"></s:hidden>
	<s:hidden name="configNumber" />
	<div class="form-group">
		<div class="control-group col-xs-12 col-sm-6 <qs2:inputErrorClass property="configMetadata.code" />">
			<label for="confCode"><s:text name="configMetadata.list.code"/></label>
			<s:if test="!readonly && !configMetadata.systemYN">
				<input type="text" id="confCode" name="configMetadata.code" value="<s:property value="configMetadata.code"/>"
					maxlength="200" required data-required-error="<s:text name="configMetadata.error.code"/>" class="form-control"/>
			</s:if>
			<s:else><p id="confCode" class="form-control-static"><s:property value="configMetadata.code" /></p></s:else>
			<div class="help-block with-errors"><qs2:errors property="configMetadata.code" /></div>
		</div>
		<div class="control-group col-xs-12 col-sm-6 <qs2:inputErrorClass property="configMetadata.application" />">
			<label for="confApp"><s:text name="configMetadata.list.application"/></label>
			<s:if test="!readonly && !configMetadata.systemYN">
				<qs2:attribute2Input id="confApp" name="configMetadata.application" emptyOption="true" onlyActive="true" required="true" data-required-error="configMetadata.error.application"
					cssClass="form-control" type="FR001_ConfigApplicationList"></qs2:attribute2Input>
			</s:if>
			<s:else><p id="confCode" class="form-control-static"><s:property value="configMetadata.application" /></p></s:else>
			<div class="help-block with-errors"><qs2:errors property="configMetadata.application" /></div>
		</div>
		<div class="clearfix hidden-sx"></div>
		<div class="control-group col-xs-12 col-sm-6 <qs2:inputErrorClass property="configMetadata.section" />">
			<label for="confSection"><s:text name="configMetadata.list.section"/></label>
			<s:if test="!readonly && !configMetadata.systemYN">
				<qs2:attribute2Input id="confSection" name="configMetadata.section" emptyOption="true" onlyActive="true" 
					type="FR002_ConfigSectionList" required="true" data-required-error="configMetadata.error.section" cssClass="form-control"
					onChange="getSectionFields(this);"></qs2:attribute2Input>
			</s:if>
			<s:else><p id="confSection" class="form-control-static"><s:property value="configMetadata.section" /></p></s:else>
			<div class="help-block with-errors"><qs2:errors property="configMetadata.section" /></div>
		</div>
		<div class="control-group col-xs-12 col-sm-6 <qs2:inputErrorClass property="configMetadata.fieldset" />">
			<label for="confFields"><s:text name="configMetadata.list.fieldset"/></label>
			<s:if test="!readonly && !configMetadata.systemYN">
				<s:if test="configMetadata.section != null && configMetadata.section != ''">
					<jsp:include page="./_configMetadataEditFieldset.jsp" flush="true"/>
				</s:if>
				<s:else><select id="confFields" name="configMetadata.fieldset" class="form-control"><option value=""></option></select></s:else>
			</s:if>
			<s:else><p id="confFields" class="form-control-static"><s:property value="configMetadata.fieldset" /></p></s:else>
			<div class="help-block with-errors"><qs2:errors property="configMetadata.fieldset" /></div>
		</div>
		<div class="clearfix hidden-sx"></div>
		<div class="col-xs-12 col-sm-6 col-md-4 <qs2:inputErrorClass property="configMetadata.label" />">
			<label for="confLabel"><s:text name="configMetadata.list.label"/></label>
			<s:if test="!readonly && !configMetadata.systemYN"><s:textfield id="confLabel" name="configMetadata.label" maxlength="50" cssClass="form-control"></s:textfield></s:if>
			<s:else><p id="confLabel" class="form-control-static"><s:property value="configMetadata.label" /></p></s:else>
			<div class="help-block"><qs2:errors property="configMetadata.label" /></div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-8 <qs2:inputErrorClass property="configMetadata.helper" />">
			<label for="confHelper"><s:text name="configMetadata.list.helper"/></label>
			<s:if test="!readonly && !configMetadata.systemYN"><s:textarea id="confHelper" cssClass="form-control" name="configMetadata.helper" rows="2"></s:textarea></s:if>
			<s:else><p id="confHelper" class="form-control-static"><s:property value="configMetadata.helper" /></p></s:else>
			<div class="help-block"><qs2:errors property="configMetadata.helper" /></div>
		</div>
		<div class="clearfix hidden-sx"></div>
		<div class="control-group col-xs-12 col-sm-6 col-md-4 <qs2:inputErrorClass property="configMetadata.type" />">
			<label for="confType"><s:text name="configMetadata.list.type"/></label>
			<s:if test="!readonly && !configMetadata.systemYN">
				<qs2:selectEnum emptyOption="true" name="configMetadata.type" required="true" id="confType"
					enumFullName="it.quix.framework.core.model.enumeration.ConfigTypeEnum" onchange="typeChange();" cssClass="form-control"></qs2:selectEnum>
			</s:if>
			<s:else><p id="confType" class="form-control-static"><s:property value="configMetadata.type" /></p></s:else>
			<div class="help-block with-errors"><qs2:errors property="configMetadata.type" /></div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-8">
			<div id="confTypeData" class="form-group">
				<jsp:include page="./_configMetadataEditType.jsp" flush="true"/>
			</div>
		</div>
		<div class="clearfix hidden-sx"></div>
		<div class="col-xs-12 col-sm-6 col-md-4 <qs2:inputErrorClass property="configMetadata.clusterYN" />">
			<label for="confCluster" class="checkbox">
				<s:if test="!readonly && !configMetadata.systemYN">
					<s:checkbox id="confCluster" name="configMetadata.clusterYN" />
				</s:if>
				<s:else>
					<p id="confCluster" class="form-control-static">
						<span class="glyphicon glyphicon-<s:if test="configMetadata.clusterYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
					</p>
				</s:else>
				<s:text name="configMetadata.list.clusterYN"/>
			</label>
			<div class="help-block"><qs2:errors property="configMetadata.clusterYN" /></div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-4 <qs2:inputErrorClass property="configMetadata.companyYN" />">
			<label for="confCompany" class="checkbox">
				<s:if test="!readonly && !configMetadata.systemYN">
					<s:checkbox id="confCompany" name="configMetadata.companyYN" />
				</s:if>
				<s:else>
					<p id="confCompany" class="form-control-static">
						<span class="glyphicon glyphicon-<s:if test="configMetadata.companyYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
					</p>
				</s:else>
				<s:text name="configMetadata.list.companyYN"/>
			</label>
			<div class="help-block"><qs2:errors property="configMetadata.companyYN" /></div>
		</div>
		<div class="clearfix visible-sm"></div>
		<div class="col-xs-12 col-sm-6 col-md-4 <qs2:inputErrorClass property="configMetadata.configurableValuesYN" />">
			<label for="confConfigurable" class="checkbox">
				<s:if test="!readonly && !configMetadata.systemYN">
					<s:checkbox id="confConfigurable" name="configMetadata.configurableValuesYN" />
				</s:if>
				<s:else>
					<p id="confConfigurable" class="form-control-static">
						<span class="glyphicon glyphicon-<s:if test="configMetadata.configurableValuesYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
					</p>
				</s:else>
				<s:text name="configMetadata.list.configurableValuesYN"/>
			</label>
			<div class="help-block"><qs2:errors property="configMetadata.configurableValuesYN" /></div>
		</div>
		<div class="clearfix hidden-sx hidden-sm"></div>
		<div class="col-xs-12 col-sm-6 col-md-4 <qs2:inputErrorClass property="configMetadata.mandatoryYN" />">
			<label for="confMandatory" class="checkbox">
				<s:if test="!readonly && !configMetadata.systemYN">
					<s:checkbox id="confMandatory" name="configMetadata.mandatoryYN" onchange="toggleMandatory(this);" />
				</s:if>
				<s:else>
					<p id="confMandatory" class="form-control-static">
						<span class="glyphicon glyphicon-<s:if test="configMetadata.mandatoryYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
					</p>
				</s:else>
				<s:text name="configMetadata.list.mandatoryYN"/>
			</label>
			<div class="help-block"><qs2:errors property="configMetadata.mandatoryYN" /></div>
		</div>
		<div class="clearfix visible-sm"></div>
		<div class="control-group col-xs-12 col-sm-6 <qs2:inputErrorClass property="configMetadata.code" />">
			<label for="confCodeLeader"><s:text name="configMetadata.list.mandatoryConfigCodeLeader"/></label>
			<s:if test="!readonly && !configMetadata.systemYN">
				<s:if test="configMetadata.mandatoryYN">
					<s:select id="confCodeLeader" emptyOption="true" list="configMetadataMandatoryLeadersCodeList"
						name="configMetadata.mandatoryConfigCodeLeader"  cssClass="form-control"></s:select>
				</s:if>
				<s:else>
					<s:select id="confCodeLeader" emptyOption="true" list="configMetadataMandatoryLeadersCodeList"
						name="configMetadata.mandatoryConfigCodeLeader" cssClass="form-control" disabled="true"></s:select>
				</s:else>
			</s:if>
			<s:else><p id="confCodeLeader" class="form-control-static"><s:property value="configMetadata.mandatoryConfigCodeLeader"/></p></s:else>
			<div class="help-block with-errors"><qs2:errors property="configMetadata.code" /></div>
		</div>
		
		<div class="control-group col-xs-12 col-sm-6">
			<label for="kind"><s:text name="configMetadata.edit.kind"/></label>
			<qs2:attribute2Input id="kind" name="configMetadata.kind" emptyOption="true" onlyActive="true"
					cssClass="form-control" type="FR005_KindConfigMetadata"></qs2:attribute2Input>
		</div>
		<div class="control-group col-xs-12 col-sm-6">
			<label for="defaultValue"><s:text name="configMetadata.edit.defaultValue"/></label>
				<input type="text" id="defaultValue" name="configMetadata.defaultValue" value="<s:property value="configMetadata.defaultValue"/>"
					maxlength="200" class="form-control"/>
		</div>
		<div class="control-group col-xs-12 col-sm-12">
			<label for="fromVersion"><s:text name="configMetadata.edit.fromVersion" /></label>
			<s:textarea name="configMetadata.fromVersion" id="fromVersion" cssClass="form-control" cols="4"></s:textarea>
		</div>
		
		
	</div>
	<div class="form-group">
		<div class="col-xs-12 text-center"><%-- Bottoni: salva e annulla --%>
			<s:if test="!readonly && !configMetadata.systemYN">
				<button type="submit" class="btn btn-primary"><s:text name="button.save" />&nbsp;<span class="glyphicon glyphicon-floppy-saved"></span></button>
			</s:if>
			<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.close"/></button>
		</div>
	</div>
</s:form>