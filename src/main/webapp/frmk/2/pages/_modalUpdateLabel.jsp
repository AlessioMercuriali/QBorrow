<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<div class="qmodal-header" style="border-bottom: 0px;">
	<h3 class="qmodal-title">
		<i class="fa fa-lg fa-pencil-square-o grey"></i>
		&nbsp;&nbsp;&nbsp;
		<s:text name="label.update.title" />
		&nbsp;&nbsp;&nbsp;
		<i>{{ scopeController.application }}&nbsp;/&nbsp;{{ scopeController.labelId }}</i>
	</h3>
	<button class="qbtn btn-framework-color" type="button" ng-click="createLabelToUpdate()"><i class="fa fa-plus"></i>&nbsp;<s:text name="button.new" /></button>
</div>
<div class="qmodal-body" >
	<!-- NEW LABEL -->
	<form name="forms.newLabelForm" ng-if="newLabel">
			<div class="qcol-xs-12 qcol-md-4" ng-class="{'qhas-error': forms.newLabelForm.language.$invalid}">
				<!-- LANGUAGE -->
				<label for="language"><s:text name="label.new.language"></s:text></label>
				<select class="drop-down qform-control" id="language" name="language" ng-change="setValidity(forms.newLabelForm.language, true)" ng-model="scopeController.newLabel.language">
					<option ng-repeat="language in scopeController.languageList" value="{{language}}" >{{ toUpper(language) }}</option>
	<!-- 				<option style="background-image: url('/framework/frmk/images/flags/{{language}}.png')" ng-repeat="language in scopeController.languageList" value="{{language}}">{{language}}</option> -->
				</select>
				<div ng-messages="forms.newLabelForm.language.$error" role="alert">
						<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>
			</div>
			<div class="qcol-xs-12 qcol-md-4" ng-class="{'qhas-error': forms.newLabelForm.organization.$invalid}">
				<!-- ORGANIZATION -->
				<label for="organization"><s:text name="label.new.organization"></s:text></label>
				<select class="drop-down qform-control" id="organization" name="organization" ng-change="setValidity(forms.newLabelForm.organization, true)" ng-model="scopeController.newLabel.organization">
					<option ng-repeat="organization in scopeController.organizationList" value="{{organization}}" >{{ organization }}</option>
				</select>
				<div ng-messages="forms.newLabelForm.organization.$error" role="alert">
						<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>	
			</div>
			<!-- TRANSLATION -->
			<div class="qcol-xs-12 qcol-md-12" ng-class="{'qhas-error': forms.newLabelForm.translation.$invalid}">
				<label for="translation"><s:text name="label.new.translation"></s:text></label>
				<span ng-if="scopeController.mode != 'html' && scopeController.mode != 'ftl'">
					<input type="text" 
						ng-model="scopeController.newLabel.translation" 
						ng-change="setValidity(forms.newLabelForm.translation, true)"
						id="translation" 
						name="translation"
						class="qform-control"
						>
				</span>
				<span ng-if="scopeController.mode == 'ftl'">
					<textarea 	name="translation" 
								type="text" 
								class="qform-control" 
								id="translation" 
								ng-model="scopeController.newLabel.translation" 
								ng-change="setValidity(forms.newLabelForm.translation, true)"
								style="height:200px" 
								ui-codemirror="getOptionForCodeMirror()" ></textarea>
				</span>
				<span ng-if="scopeController.mode == 'html'">
						<summernote ng-model="scopeController.newLabel.translation" ng-change="setValidity(forms.newLabelForm.translation, true)" id="translation" name="translation"></summernote>
<!-- 					<wysiwyg-edit content="scopeController.newLabel.translation" config="configForEditor"></wysiwyg-edit> -->
				</span>	
				<div ng-messages="forms.newLabelForm.translation.$error" role="alert">
					<div ng-message="notNull"><s:text name="error.notNull"/></div>
				</div>	
			</div>	
			<div class="qrow">&nbsp;</div>
			<div class="qcol-xs-12 qcol-md-12">
				<button class="qbtn btn-framework-color" type="button" ng-click="addLabelToUpdateList()"><i class="fa fa-floppy-o"></i>&nbsp;<s:text name="button.add" /></button>
				<button class="qbtn btn-framework-color" type="button" ng-click="annullaInsert()"><i class="fa fa-arrow-left"></i>&nbsp;<s:text name="button.delete" /></button>
			</div>
	</form>
	<div class="qcol-xs-12 qcol-md-12" ng-if="notValid">
		<span class="qhas-error"> 
			<i class="fa fa-exclamation fa-2x "></i>&nbsp;<s:text name="label.new.error"/>
		</span>
	</div>
	<form name="forms.listLabelForm">
		<div ng-repeat="row in scopeController.viewList">
			<div ng-repeat="language in getKeys(row)">
				<div class="qcol-xs-12 qcol-md-12" ng-class="{'qhas-error': forms.listLabelForm.translation.$invalid}">
					<label>
						<span ng-if="language != 'DEFAULT'"><img ng-attr-src="/framework/frmk/images/flags/{{ toLowerCase(language) }}.png" style="width: 25px;"></span>
						<span ng-if="language == 'DEFAULT'">{{ language }}</span>
						<span ng-if="row.labelKey.organization != null && row.labelKey.organization != undefined && row.labelKey.organization != ''">&nbsp;({{ row.labelKey.organization }})</span> 
					</label>
					<span ng-if="scopeController.mode != 'html' && scopeController.mode != 'ftl'" >
						<input type="text" 
							ng-model="row.translationMap[language]" 
							id="translation" 
							name="translation"
							class="qform-control"
							>
					</span>
					<span ng-if="scopeController.mode == 'ftl'">
						<textarea 	name="translation" 
									type="text" 
									class="qform-control" 
									id="translation" 
									ng-model="row.translationMap[language]" 
									style="height:200px" 
									ui-codemirror="getOptionForCodeMirror()" ></textarea>
					</span>
					<span ng-if="scopeController.mode == 'html'">
						<summernote ng-model="row.translationMap[language]" ></summernote>
					</span>	
					<div ng-messages="forms.listLabelForm.translation.$error" role="alert">
						<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>				
				</div>
				<div class="qcol-xs-12 qcol-md-12">&nbsp;</div>
			</div>
			<div class="qrow">&nbsp;</div>
		</div>
	</form>
</div>
<div class="qrow">&nbsp;</div>
<div class="qmodal-footer">
	<button class="qbtn btn-framework-color" type="button" ng-click="saveLabelToUpdateList()"><i class="fa fa-floppy-o"></i>&nbsp;<s:text name="button.save" /></button>
	<button class="qbtn btn-framework-color" type="button" ng-click="closeLabelToUpdate()"><i class="fa fa-arrow-left"></i>&nbsp;<s:text name="button.cancel" /></button>
</div>
