<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
function saveNewLog(){
	$(modal.content).addClass('hidden');
	modal.load(true);
	var form = $('#createForm');
	qamCall(form.prop('action'),form.serializeArray(),manageSaveNewLog,'json','post');
	return false;
}
function manageSaveNewLog(data){
	$(modal.content).removeClass('hidden');
	modal.closeNsearch();
}
$('#createForm').validator('validate');
</script>
<s:form id="createForm" cssClass="form-horizontal" action="logger" onsubmit="return saveNewLog();">
	<s:hidden name="task" value="newLog2"/>
	<div class="row">
		<div class="col-xs-12 help-block"><s:text name="logger.edit.help"/></div>
	</div>
	<div class="form-group spacer-top">
		<div class="control-group col-xs-12 col-sm-6 col-md-8">
			<label for="createName"><s:text name="logger.edit.name"/></label>
			<s:textfield id="createName" name="loggerName" cssClass="form-control" required="true"/>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-4">
			<label for="createLevel"><s:text name="logger.edit.level"/></label>
			<select id="createLevel" name="level" class="form-control">
					<option value="">&nbsp;</option>
					<option value="DEBUG">DEBUG</option>
					<option value="INFO">INFO</option>
					<option value="WARN">WARN</option>
					<option value="ERROR">ERROR</option>
					<option value="FATAL">FATAL</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-12 text-center">
			<button type="submit" class="btn btn-primary"><s:text name="button.save" />&nbsp;<span class="glyphicon glyphicon-floppy-saved"></span></button>
			<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.cancel"/>&nbsp;<span class="glyphicon glyphicon-floppy-remove"></span></button>
		</div>
	</div>
</s:form>