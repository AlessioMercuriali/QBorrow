<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="qmodal-header" style="border-bottom: 0px;">
	<h3 class="qmodal-title" ><i class="fa fa-cog"></i>&nbsp;
		<span ng-if="!scopeController.selectedRow.create">	
			<s:text name="job.edit.title.modifica" />
		</span>	
		<span ng-if="scopeController.selectedRow.create">	
			<s:text name="job.edit.title.create" />
		</span>	
	</h3>
</div>
<div class="qmodal-body" style="padding: 0px 0px 10px 0px;" cg-busy="scopeController.promise">
 	<tabset>
		<tab>
			<tab-heading>
				<i class="fa fa-pencil-square-o"></i>&nbsp;
					<span ng-if="!scopeController.selectedRow.create">	
						<s:text name="job.edit.modifica" />
					</span>	
					<span ng-if="scopeController.selectedRow.create">	
						<s:text name="job.edit.create" />
					</span>			     
			</tab-heading>
			<form name="forms.editJobForm">
				<div class="qrow">
					<div class="qcol-xs-12 qcol-md-6"  ng-class="{'qhas-error': forms.editJobForm.name.$invalid}">
						<label for="name"><s:text name="job.edit.name"/>:</label>
						<s:textfield ng-model="scopeController.selectedRow.name" id="name" name="name" cssClass="qform-control"></s:textfield>
						<div ng-messages="forms.editJobForm.name.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="job.requiredCronExpression"><s:text name="job.requiredCronExpression"/></div>
							<div ng-message="job.required"><s:text name="job.required"/></div>
						</div>
					</div>
					<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.editJobForm.context.$invalid}">
						<label for="context"><s:text name="job.edit.context_name"/>:</label>
						<select ng-model="scopeController.selectedRow.context_name"  name="context" id="context"
							ng-options="item.name as item.name for item in scopeController.resultContext.list" class="qform-control">
						</select>
						<div ng-messages="forms.editJobForm.context.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="job.requiredCronExpression"><s:text name="job.requiredCronExpression"/></div>
							<div ng-message="job.required"><s:text name="job.required"/></div>
						</div>
					</div>
				</div>
				<div class="qrow">
					<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.editJobForm.cronExpression.$invalid}">
						<label for="cronExpression">
							<span class="cursor" ng-click="scopeController.openHelp = !scopeController.openHelp">
								<i class="fa fa-info-circle" aria-hidden="true" title="cliccare per visualizzare la spiegazione delle cron exspression"></i>&nbsp;&nbsp;
							</span>
							<s:text name="job.edit.cronExpression"/>:
						</label>
						<s:textfield ng-model="scopeController.selectedRow.cronExpression" id="cronExpression" name="cronExpression" cssClass="qform-control"></s:textfield>
						<div ng-messages="forms.editJobForm.cronExpression.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="job.requiredCronExpression"><s:text name="job.requiredCronExpression"/></div>
							<div ng-message="job.required"><s:text name="job.required"/></div>
							<div ng-message="job.invalidCronExpression"><s:text name="error.job.invalidCronExpression"></s:text></div>
						</div>
					</div>
					<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.editJobForm.className.$invalid}">
						<label for="className"><s:text name="job.edit.className"/>:</label>
						<s:textfield ng-model="scopeController.selectedRow.className" id="className" name="className" cssClass="qform-control"></s:textfield>
						<div ng-messages="forms.editJobForm.className.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="job.requiredCronExpression"><s:text name="job.requiredCronExpression"/></div>
							<div ng-message="job.required"><s:text name="job.required"/></div>
						</div>
					</div>
				</div>
				<div class="qrow">
					<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.editJobForm.recoveryYN.$invalid}">
						<input type="checkbox" ng-model="scopeController.selectedRow.recoveryYN" id="recoveryYN" name="recoveryYN"/>
						<label for="recoveryYN"><s:text name="job.edit.recoveryYN"/></label>
						<div ng-messages="forms.editJobForm.recoveryYN.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="job.requiredCronExpression"><s:text name="job.requiredCronExpression"/></div>
							<div ng-message="job.required"><s:text name="job.required"/></div>
						</div>
					</div>
					<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.editJobForm.statefulYN.$invalid}">
						<input type="checkbox" ng-model="scopeController.selectedRow.statefulYN" id="statefulYN" name="statefulYN" />
						<label for="statefulYN"><s:text name="job.edit.statefulYN"/></label>
						<div ng-messages="forms.editJobForm.statefulYN.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="job.requiredCronExpression"><s:text name="job.requiredCronExpression"/></div>
							<div ng-message="job.required"><s:text name="job.required"/></div>
						</div>
					</div>
				</div>
			</form>
		</tab>
		<tab ng-hide="scopeController.selectedRow.create == true" select="loadJobConfig(forms.configForm)">
			<tab-heading>
				<i class="fa fa-check-square-o"></i>&nbsp;<s:text name="job.edit.config" />
			</tab-heading>
			<div class="qrow">
				<div class="qcol-xs-12 qtext-right">
					<button class="qbtn btn-framework-color" type="button" ng-click="emptyCacheJson()">
						<i class="fa fa-history"></i>&nbsp;<s:text name="configMetadata.image.emptyAllCache" />
					</button>
				</div>
			</div>
			<div class="control-group">
				<form name="forms.configForm">
					<jsp:include page="_config.jsp?scope=scopeController."/>
				</form>
			</div>
		</tab>
	</tabset>
</div>
<div class="qmodal-body" style="padding: 0px 0px 10px 0px;" ng-if="scopeController.openHelp">
	<jsp:include page="_cronExpressionHelp.jsp"/>
</div>
<div class="qmodal-footer">
	<button class="qbtn btn-framework-color" type="button" ng-click="save()"><i class="fa fa-floppy-o"></i>&nbsp;<s:text name="button.save" /></button>
    <button class="qbtn btn-framework-color" type="button" ng-click="cancel()"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.cancel" /></button>
</div>