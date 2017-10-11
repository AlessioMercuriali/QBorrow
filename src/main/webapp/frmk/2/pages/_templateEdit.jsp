<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form name="forms.templateForm">
	<div class="box box-framework" >
		<div class="box-header with-border">
			<h3 class="qh3 box-title">
				<i class="fa fa-pencil-square-o"></i>
				<span ng-if="scopeController.selectedRow.templateId != null && scopeController.selectedRow.templateId != undefined && scopeController.selectedRow.templateId != ''">
					<i style="color:grey">{{ scopeController.selectedRow.name }}</i>
				</span>
				<span ng-if="!(scopeController.selectedRow.templateId != null && scopeController.selectedRow.templateId != undefined && scopeController.selectedRow.templateId != '')">
					<s:text name="template.edit.title.new"></s:text>&nbsp;
					<i style="color:grey">
						{{ scopeController.selectedRow.name }}
						<span ng-if="scopeController.selectedRow.name">.ftl</span>
					</i>
				</span>
			</h3>
		</div>
		<div class="box-body frmk-container">
			<div class="qrow">
				<!-- NAME -->
				<div class="qcol-xs-12 qcol-md-4" ng-class="{'qhas-error': forms.templateForm.name.$invalid}">
					<label for="name"><s:text name="template.edit.name"/></label>
					<input type="text" 
						ng-model="scopeController.selectedRow.name" 
						id="name" 
						name="name"
						class="qform-control" />
					<div ng-messages="forms.templateForm.name.$error" role="alert">
				  		<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>
				</div>
				<!-- HELPER -->
				<div class="qcol-xs-12 qcol-md-12">
					<span ng-if="!scopeController.selectedRow.name" style="color:grey"><i><s:text name="template.edit.name.helper"/></i></span>
				</div>
			</div>	
			<div class="frmk-row">&nbsp;</div>
			<div class="qrow">
				<!-- LANGUAGE -->
				<div class="qcol-xs-12 qcol-md-4" ng-class="{'qhas-error': forms.templateForm.language.$invalid}">
					<label for="language"><s:text name="template.edit.language"/></label>
					<input type="text" 
						ng-model="scopeController.selectedRow.language" 
						id="language" 
						name="language"
						class="qform-control" />
					<div ng-messages="forms.templateForm.language.$error" role="alert">
					  	<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>
				</div>
				
				<!-- APPLICATION -->
				<div class="qcol-xs-12 qcol-md-4" ng-class="{'qhas-error': forms.templateForm.application.$invalid}">
					<label for="application"><s:text name="template.edit.application"/></label>
					<input type="text" 
						ng-model="scopeController.selectedRow.application" 
						id="application" 
						name="application"
						class="qform-control" />
					<div ng-messages="forms.templateForm.application.$error" role="alert">
					  	<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>
				</div>
				
				<!-- ORGANIZATION -->
				<div class="qcol-xs-12 qcol-md-4" ng-class="{'qhas-error': forms.templateForm.organization.$invalid}">
					<label for="organization"><s:text name="template.edit.organization"/></label>
					<input type="text" 
						ng-model="scopeController.selectedRow.organization" 
						id="organization" 
						name="organization"
						class="qform-control" />
					<div ng-messages="forms.templateForm.organization.$error" role="alert">
					  	<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>
				</div>
				
			</div>	
			<div class="frmk-row">&nbsp;</div>
			<div class="qrow">
				<!-- FTL -->
				<div class="qcol-xs-12 qcol-md-12"  ng-class="{'qhas-error': forms.templateForm.ftl.$invalid}">
					<label for="ftl"><s:text name="template.edit.ftl"/></label>
					<textarea 	name="ftl" type="text" class="qform-control" id="ftl" ng-model="scopeController.selectedRow.ftl" style="height:400px" 
							ui-codemirror="getOptionForCodeMirror()" ></textarea>
					<div ng-messages="forms.templateForm.ftl.$error" role="alert">
					  	<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>
				</div>
			</div>			
		</div>
		<div class="box-footer qtext-center">
			<button class="qbtn btn-framework-color" ng-click="back()" type="button">
				<i class="fa fa-arrow-left cursor"></i>&nbsp;
				<s:text name="button.back"></s:text>
			</button>
		 	<button ng-click="save()" class="qbtn btn-framework-color">
		 		<i class="fa fa-floppy-o"></i>&nbsp;
		 		<s:text name="button.save"/>
		 	</button> 
		</div>
	</div>
</form>