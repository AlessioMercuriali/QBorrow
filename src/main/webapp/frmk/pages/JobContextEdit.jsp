<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<script type="text/javascript">
function saveJobContext(){
	$(modal.content).addClass('hidden');
	modal.load(true);
	var form = $('#jobContextCreateForm');
	qamCall(form.prop('action'),form.serializeArray(),manageSaveJobContext,'json/html','post');
	return false;
}
function manageSaveJobContext(data){
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
	$('#jobContextCreateForm').validator('validate');
});
</script>
<s:form action="scheduler" id="jobContextCreateForm" cssClass="form-horizontal" onsubmit="return saveJobContext()" >
	<s:hidden name="task" value="saveContext"></s:hidden>
	<div class="form-group">
		<div class="col-xs-12 col-sm-6 control-group <qs2:inputErrorClass property="jobContext.name"/>">
			<label for="contextName"><s:text name="scheduler.context.edit.name"/></label>
			<s:if test="jobContext.name != null"><p class="form-control-static"><s:property value="jobContext.name"/></p></s:if>
			<s:else><input type="text" class="form-control" name="jobContext.name" id="contextName" required data-required-error="<s:text name="scheduler.context.error.name"/>" maxlength="200"/></s:else>
			<div class="help-block with-errors"><qs2:errors property="jobContext.name"/></div>
		</div>
		<div class="col-xs-12 col-sm-6 control-group <qs2:inputErrorClass property="jobContext.url"/>">
			<label for="contextUrl"><s:text name="scheduler.context.edit.url"/></label>
			<input type="text" class="form-control" name="jobContext.url" id="contextUrl" value="<s:property value="jobContext.url"/>" required data-required-error="<s:text name="scheduler.context.error.url"/>" maxlength="200" cslass="form-control"/>
			<div class="help-block with-errors"><qs2:errors property="jobContext.url"/></div>
		</div>
	</div>
	<div class="form-group"><%-- Bottoni: salva e annulla --%>
		<div class="col-xs-12 text-center">
			<button type="submit" class="btn btn-primary"><s:text name="button.save" />&nbsp;<span class="glyphicon glyphicon-floppy-saved"></span></button>
			<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.cancel"/>&nbsp;<span class="glyphicon glyphicon-floppy-remove"></span></button>
		</div>
	</div>
</s:form>