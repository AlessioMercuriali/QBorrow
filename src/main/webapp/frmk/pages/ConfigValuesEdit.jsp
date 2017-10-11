<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<s:url id="addConfigUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">addConfig2</s:param>
</s:url>
<s:url id="copyConfigUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">copyConfig2</s:param>
</s:url>
<s:url id="deleteConfigUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">deleteConfig2</s:param>
</s:url>
<script type="text/javascript">
function validateForm(){
	$('#configValForm').validator('validate');
}
function configValueAdd(){
	qamCall('<s:property value="#addConfigUrl" escape="false"/>',[],addRow,'html','get');
	return false;
}
function configValueDelete(idx){
	var params =[{name:'configNumber', value:idx}];
	qamCall('<s:property value="#deleteConfigUrl" escape="false"/>',params,manageConfgiValueDelete,'json','post');
}
function manageConfgiValueDelete(data){
	$('tr#config_'+data.idx).remove();
	validateForm();
}
function configValueCopy(idx){
	var key = $('#configkey'+idx),value = $('#configvalue'+idx), cluster = $('#configCluster'+idx);
	var params = [{name:'configNumber', value:idx},
		{name:value.attr('name'), value:value.val()},
		{name:key.attr('name'),value:key.val()}];
	if(cluster.length > 0) params.push({name:cluster.attr('name'),value:cluster.val()});
	qamCall('<s:property value="#copyConfigUrl" escape="false"/>',params,addRow,'html','get');
}
function addRow(data){
	$('#configValuesTable').append(data);
	validateForm();
}
function saveConfigValues(){
	$(modal.content).addClass('hidden');
	modal.load(true);
	var form = $('#configValForm');
	qamCall(form.prop('action'),form.serializeArray(),manageSaveConfigValues,'json/html','post');
	return false;
	}
function manageSaveConfigValues(data){
	try{
		data = $.parseJSON(data);
		if(data.success){
			$(modal.content).removeClass('hidden');
			modal.closeNsearch();
			return;
		}
		console.log(data);
	}catch(e){
		modal.fill(data);
	}
}
$(function(){
	validateForm();
});
</script>
<s:form action="configMetadata" cssClass="form-horizontal" role="form" id="configValForm" onsubmit="return saveConfigValues()" >
	<s:hidden name="task" value="saveValues2"></s:hidden>
	<s:hidden name="errorListMode"/>
	<s:if test="errorListMode">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
				<label for="confCluster"><s:text name="configMetadata.list.clusterYN"/></label>
				<p id="confCluster" class="form-control-static">
					<span class="glyphicon glyphicon-<s:if test="configMetadata.clusterYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
				</p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
				<label for="confMandatory"><s:text name="configMetadata.list.mandatoryYN"/></label>
				<p id="confMandatory" class="form-control-static">
					<span class="glyphicon glyphicon-<s:if test="configMetadata.mandatoryYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
				</p>
				<s:if test="configMetadata.mandatoryYN">
					<label for="confCodeLeader"><s:text name="configMetadata.list.mandatoryConfigCodeLeader"/></label>
					<p id="confCodeLeader" class="form-control-static"><s:property value="configMetadata.mandatoryConfigCodeLeader"/></p>
				</s:if>
			</div>
			<div class="clearfix visible-sm"></div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
				<label for="confConfigurable"><s:text name="configMetadata.list.configurableValuesYN"/></label>
				<p id="confConfigurable" class="form-control-static">
					<span class="glyphicon glyphicon-<s:if test="configMetadata.configurableValuesYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
				</p>
			</div>
			<div class="clearfix visible-md"></div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
				<label for="confCompany"><s:text name="configMetadata.list.companyYN"/></label>
				<p id="confCompany" class="form-control-static">
					<span class="glyphicon glyphicon-<s:if test="configMetadata.companyYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
				</p>
			</div>
		</div>
	</s:if>
	<div id="configItemsDiv" class="form-group">
		<jsp:include page="./_configItems.jsp"></jsp:include>
	</div>
	<div class="form-group"><%-- Bottoni: salva e annulla --%>
		<div class="col-xs-12 text-center">
			<s:if test="!readonly && !configMetadata.systemYN">
				<button type="submit" class="btn btn-primary"><s:text name="button.save" />&nbsp;<span class="glyphicon glyphicon-floppy-saved"></span></button>
			</s:if>
			<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.close"/></button>
		</div>
	</div>
</s:form>