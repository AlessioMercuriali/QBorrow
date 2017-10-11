<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<s:form action="attributeType" id="importForm" role="form" cssClass="form-horizontal" onsubmit="return sendFileAsinc();" enctype="multipart/form-data">
	<s:hidden name="task" value="importFromXml"></s:hidden>
	<div class="form-group">
		<div class="col-xs-12 col-sm-offset-2 col-sm-8 control-group">
			<s:file name="file" cssClass="form-control" required="true" accept="application/xml,application/x-xml,text/xml"></s:file>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-12 text-center">
			<s:submit cssClass="btn btn-primary" key="button.importXml"/>
			<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.cancel"/></button>
		</div>
	</div>
</s:form>
<script type="text/javascript">
$('#importForm').validator('validate');
function sendFileAsinc(){
	var form = $('#importForm');
	var data = new FormData(), file = form.find('input:file')[0].files[0];
	data.append('file',file);
	data.append('task','importFromXml');
	qamCall(form.prop('action'),data,modal.fill,'html','post',true);
	modal.clearNload();
	return false;
}
</script>