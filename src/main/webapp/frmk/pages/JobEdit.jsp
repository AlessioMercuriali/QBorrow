<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:url id="reloadConfig" action="scheduler" includeParams="none" escapeAmp="false">
	<s:param name="task">loadJobConfig</s:param>
	<s:param name="job"><s:property value="job.name"/></s:param>
</s:url>
<script type="text/javascript">
function saveJob(){
	$(modal.content).addClass('hidden');
	modal.load(true);
	var form = $('#jobCreateForm');
	qamCall(form.prop('action'),form.serializeArray(),manageSaveJob,'json/html','post');
	return false;
}
function manageSaveJob(data){
	try{
		data = $.parseJSON(data);
		if(data.success){
			$(modal.content).removeClass('hidden');
			modal.closeNsearch();
			return;
		}
		console.log(data);
	}catch(e){
		if (data.indexOf('jobTabs') > 0) {
			search();
		}
		modal.fill(data);
	}
}
<s:if test="!newJob">
function reloadJobConfigs(){
	$('#ajaxloaderJobConfigmetadata').removeClass('hidden');
	$('#jobConfigMetadataList').empty();
	qamCall('<s:property value="#reloadConfig" escape="false"/>', [], manageReloadJobConfigs, 'html', 'get');
}
function manageReloadJobConfigs(data){
	$('#jobConfig').html(data);
}
</s:if>
$(function(){
	$('#jobCrono').cronexpr();
	$('#jobCreateForm').validator('validate');
	<s:if test="!newJob">
	$('#jobTabs a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
	});
	</s:if>
});
</script>
<s:if test="!newJob">
<ul id="jobTabs" class="nav nav-tabs">
	<li class="active"><a href="#jobData" data-toggle="tab"><s:text name="scheduler.job.edit.tab.data"/></a></li>
	<li><a href="#jobConfig" data-toggle="tab"><s:text name="scheduler.job.edit.tab.config"/></a></li>
</ul>
<div class="tab-content">
	<div class="tab-pane active" id="jobData">
</s:if>
<s:form action="scheduler" id="jobCreateForm" cssClass="form-horizontal" onsubmit="return saveJob()" >
	<s:hidden name="task" value="save2"></s:hidden>
	<s:hidden name="newJob"/>
	<div class="form-group">
		<div class="col-xs-12 col-sm-6 control-group">
			<label for="jobName"><s:text name="scheduler.job.edit.name"/></label>
			<input type="text" class="form-control" name="job.name" id="jobName" value="<s:property value="job.name"/>" required data-required-error="<s:text name="scheduler.job.error.name"/>" maxlength="200" cslass="form-control"/>
			<div class="help-block with-errors"></div>
		</div>
		<div class="col-xs-12 col-sm-6 control-group">
			<label for="jobContext"><s:text name="scheduler.job.edit.context"/></label>
			<s:select id="jobContext" name="job.context" cssClass="form-control" list="allContextList" required="true"/>
			<div class="help-block with-errors"></div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-12 col-sm-6 control-group <qs2:inputErrorClass property="job.cronExpression" />">
			<label for="jobCrono"><s:text name="scheduler.job.edit.cronExpression"/></label>
			<input type="text" name="job.cronExpression" value="<s:property value="job.cronExpression"/>" maxlength="200" required
				class="form-control" id="jobCrono" data-required-error="<s:text name="scheduler.job.error.cronExpression"/>"/>
			<div class="help-block with-errors"><qs2:errors property="job.cronExpression" /></div>
		</div>
		<div class="col-xs-12 col-sm-6 control-group <qs2:inputErrorClass property="job.className" />">
			<label for="jobClass"><s:text name="scheduler.job.edit.className"/></label>
				<input type="text" name="job.className"  value="<s:property value="job.className"/>" maxlength="200" required
				class="form-control" id="jobClass" data-required-error="<s:text name="scheduler.job.error.className"/>"/>
			<div class="help-block with-errors"><qs2:errors property="job.className" /></div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-12 col-sm-6 col-md-3 col-md-offset-3">
			<label class="checkbox"><s:checkbox name="job.recoveryYN"/><s:text name="scheduler.job.edit.recovery"/></label>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-3">
			<label class="checkbox"><s:checkbox name="job.statefulYN"/><s:text name="scheduler.job.edit.stateful"/></label>
		</div>
	</div>
	<div class="form-group"><%-- Bottoni: salva e annulla --%>
		<div class="col-xs-12 text-center">
			<button type="submit" class="btn btn-primary"><s:text name="button.save" />&nbsp;<span class="glyphicon glyphicon-floppy-saved"></span></button>
			<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.cancel"/>&nbsp;<span class="glyphicon glyphicon-floppy-remove"></span></button>
		</div>
	</div>
</s:form>
<s:if test="!newJob">
	</div>
	<div class="tab-pane" id="jobConfig">
		<jsp:include page="./_jobConfigList.jsp" flush="true"/>
	</div>
</div>
</s:if>