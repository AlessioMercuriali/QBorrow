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
function validateJobConfigForm(){
	$('#jobConfigValForm').validator('validate');
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
	validateJobConfigForm
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
	validateJobConfigForm
}
function saveConfigJobValues(){;
	var form = $('#jobConfigValForm');
	form.addClass('hidden');
	$('#ajaxloaderJobConfig').removeClass('hidden');
	qamCall(form.prop('action'),form.serializeArray(),manageSaveJobConfigValues,'json/html','post');
	return false;
}
function manageSaveJobConfigValues(data) {
	try{
		data = $.parseJSON(data);
		if(data.success){
			closeJobConfigEdit();
			reloadJobConfigs();
			return;
		}
		console.log(data);
	}catch(e){
		manageEditJobConfig(data);
	}
}
$(function(){
	validateJobConfigForm()
});
</script>
<s:form action="configMetadata" role="form" id="jobConfigValForm" onsubmit="return saveConfigJobValues()" >
	<s:hidden name="task" value="saveJobValues"></s:hidden>
	<div id="configItemsDiv">
		<jsp:include page="./_configItems.jsp"></jsp:include>
	</div>
	<div class="row"><%-- Bottoni: salva e annulla --%>
		<div class="col-xs-12 text-center">
			<button type="submit" class="btn btn-primary"><s:text name="button.save" /></button>
			<button type="button" class="btn btn-default" onclick="closeJobConfigEdit()"><s:text name="button.cancel"/></button>
		</div>
	</div>
</s:form>