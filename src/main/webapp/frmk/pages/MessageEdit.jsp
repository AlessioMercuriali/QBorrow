<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<script type="text/javascript">
function saveMessage(){
	$(modal.content).addClass('hidden');
	modal.load(true);
	var form = $('#messageForm');
	qamCall(form.prop('action'),form.serializeArray(),manageSaveMessage,'json/html','post');
	return false;
}
function manageSaveMessage(data){
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
	$('#msgExpirePicker').datetimepicker({language:'it',useSeconds:true}).on('dp.change dp.show',function(e){$('#messageForm').validator('validate');});
	$('#messageForm').validator('validate');
});
</script>
<s:form id="messageForm" cssClass="form-horizontal" role="form" action="message" onsubmit="return saveMessage();">
	<s:hidden name="task" value="save2"/>
	<s:hidden name="message.messageId" value="%{message.messageId}"/>
	<div class="form-group">
		<div class="control-group col-xs-12 col-sm-6 col-md-8 <qs2:inputErrorClass property="message.content"/>">
			<label for="msgContent"><s:text name="message.edit.content"/></label>
			<textarea id="msgContent" class="form-control" name="message.content" rows="5" cols="50" required data-required-error="<s:text name="message.error.content"/>"><s:property value="message.content"/></textarea>
			<div class="help-block with-errors"><qs2:errors property="message.content"/></div>
		</div>
		<div class="control-group col-xs-12 col-sm-6 col-md-4 <qs2:inputErrorClass property="message.expiration"/>">
			<label for="msgExpire"><s:text name="message.edit.expiration"/></label>
			<qs2:bootstrapDtPicker id="msgExpire" value="%{message.expiration}" name="message.expiration" date="DD/MM/YYYY HH:mm:ss" groupId="msgExpirePicker" required="true"></qs2:bootstrapDtPicker>
			<div class="help-block with-errors"><qs2:errors property="message.expiration"/></div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-12 text-center">
			<button type="submit" class="btn btn-primary"><s:text name="button.save" />&nbsp;<span class="glyphicon glyphicon-floppy-saved"></span></button>
			<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.cancel"/>&nbsp;<span class="glyphicon glyphicon-floppy-remove"></span></button>
		</div>
	</div>
</s:form>
