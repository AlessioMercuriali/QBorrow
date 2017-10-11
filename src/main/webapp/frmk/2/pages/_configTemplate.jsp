<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<qs2:attributeMapAngularFilter type="FR001_ConfigApplicationList" />
<qs2:attributeMapAngularFilter type="FR002_ConfigSectionList" />
<qs2:attributeMapAngularFilter type="FR003_ConfigFieldsetList" />
<qs2:attributeMapAngularFilter type="FR005_KindConfigMetadata" />


<script type="text/ng-template" id="editConfigContent.html">
	<div class="qmodal-header" style="border-bottom: 0px;">
     	<h3 class="qmodal-title"><i class="fa fa-wrench"></i>&nbsp;{{scopeController.selectedConfig.code}}</h3>
   	</div>
  	<div class="qmodal-body" style="padding: 0px 0px 10px 0px;">
		<div class="help-style">
			{{scopeController.selectedConfig.helper}}<br>
			<span ng-if="scopeController.selectedConfig.defaultValue != null">
			Default: {{scopeController.selectedConfig.defaultValue}}
			</span>
		</div>
		<table class="qtable qtable-hover">
			<thead>
				<tr>
					<td ng-show="scopeController.selectedConfig.clusterYN"><s:text name="config.edit.name" /></td>
					<td><s:text name="config.edit.company" /></td>
					<td ng-show="scopeController.selectedConfig.multipleYN"><s:text name="config.edit.position" /></td>
					<td ng-show="scopeController.selectedConfig.mapYN"><s:text name="config.edit.mapKey" /></td>
					<td><s:text name="config.value" /></td>
					<td>
						<span ng-if="scopeController.selectedConfig.configList.length < 1 || scopeController.selectedConfig.clusterYN || scopeController.selectedConfig.companyYN || scopeController.selectedConfig.multipleYN || scopeController.selectedConfig.mapYN">
							<button class="qbtn btn-framework-color qpull-right" ng-click="addConfig()" type="button">
								<i class="fa fa-plus"></i>&nbsp;<s:text name="config.edit.addConfig"></s:text>
							</button>
						</span>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="config in scopeController.selectedConfig.configList">
					<td ng-show="scopeController.selectedConfig.clusterYN">
						<s:select name="nodeName" cssClass="qform-control" list="clusterList" ng-model="config.nodeName" />
					</td>
					<td ng-show="scopeController.selectedConfig.companyYN">
						<s:select name="company" cssClass="qform-control" list="companyList" ng-model="config.company" />
					</td>
					<td ng-hide="scopeController.selectedConfig.companyYN">
						{{config.company}}
					</td>
					<td ng-show="scopeController.selectedConfig.multipleYN">
						<input type="text" class="qform-control" ng-model="config.position" />
					</td>
					<td ng-show="scopeController.selectedConfig.mapYN">
						<input type="text" class="qform-control" ng-model="config.mapKey" />
					</td>
					<td>
						<span ng-if="scopeController.selectedConfig.type == 'String'">
							<input type="text" class="qform-control" ng-model="config.value" />
						</span>
						<span ng-if="scopeController.selectedConfig.type == 'Integer'">
							<input type="text" class="qform-control qform-control-number" ng-model="config.value" />
						</span>
						<span ng-if="scopeController.selectedConfig.type == 'Decimal'">
							<input type="text" class="qform-control qform-control-number" ng-model="config.value" />
						</span>
						<span ng-if="scopeController.selectedConfig.type == 'URL'">
							<input type="text" class="qform-control" ng-model="config.value" />
						</span>
						<span ng-if="scopeController.selectedConfig.type == 'Email'">
							<input type="text" class="qform-control" ng-model="config.value" />
						</span>
						<span ng-if="scopeController.selectedConfig.type == 'Date'">
							<input type="text" class="qform-control" ng-model="config.value" /> (yyyy-MM-dd)
						</span>
						<span ng-if="scopeController.selectedConfig.type == 'DateTime'">
							<input type="text" class="qform-control" ng-model="config.value" /> (yyyy-MM-dd HH:mm:ss)
						</span>
						<span ng-if="scopeController.selectedConfig.type == 'Time'">
							<input type="text" class="qform-control" ng-model="config.value" /> (HH:mm:ss)
						</span>
						<div class="btn-group" data-toggle="buttons" ng-if="scopeController.selectedConfig.type == 'Boolean'">
                			<label class="btn btn-default">
                    			<input type="radio" value="true" ng-model="config.value"  /> True
               			 	</label> 
                			<label class="btn btn-default">
                    			<input type="radio" value="false" ng-model="config.value"  /> False
                			</label>
						</div> 	
						<span ng-if="scopeController.selectedConfig.type == 'SysAttribute'">
							<select class="qform-control" ng-model="config.value" >
								<option ng-repeat="op in scopeController.attributeValuesList" value="{{op.code}}">{{op.description}}</option>
							</select>
						</span>

					</td>
					<td>
						<div title="<s:text name="configMetadata.image.delete" />" class="fa fa-2x fa-times cursor qpull-right" ng-click="removeConfig(config)" />
					</td>
				</tr>
			</tbody>
		</table>
 	</div>
   	<div class="qmodal-footer">
		<button class="qbtn btn-framework-color" type="button" ng-click="saveConfig()"><i class="fa fa-floppy-o"></i>&nbsp;<s:text name="button.salve" /></button>
    	<button class="qbtn btn-framework-color" type="button" ng-click="cancelConfig()"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.cancel" /></button>
  	</div>
</script>
<script type="text/ng-template" id="editConfigMetadata.html">
		<div class="qmodal-header" style="border-bottom: 0px;">
            <h3 class="qmodal-title"><i class="fa fa-wrench"></i>&nbsp;<s:text name="configMetadata.detail.title" /></h3>
        </div>
        <div class="qmodal-body" style="padding: 0px 0px 10px 0px;">
            <form name="forms.configMetadataForm">
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.configMetadataForm.code.$invalid}">
							<label for="code"><s:text name="configMetadata.edit.code"/>:</label>
							<input type="text" ng-model="scopeController.selectedRow.code" name="code" class="qform-control" />
							<div ng-messages="forms.configMetadataForm.code.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
						<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.configMetadataForm.application.$invalid}">
							<label for="application"><s:text name="configMetadata.edit.application"/>:</label>
							<select name="application" class="qform-control"
								ng-model="scopeController.selectedRow.application" >
								<option ng-repeat="op in FR001_ConfigApplicationList()" value="{{op.code}}">{{op.description}}</option>
							</select>
							<div ng-messages="forms.configMetadataForm.application.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
					</div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.configMetadataForm.section.$invalid}">
							<label for="section"><s:text name="configMetadata.edit.section"/>:</label>
							<select name="section" class="qform-control"
								ng-model="scopeController.selectedRow.section" >
								<option ng-repeat="op in FR002_ConfigSectionList()" value="{{op.code}}">{{op.description}}</option>
							</select>
							<div ng-messages="forms.configMetadataForm.section.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
						<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.configMetadataForm.fieldset.$invalid}">
							<label for="fieldset"><s:text name="configMetadata.edit.fieldset"/>:</label>
							<select name="fieldset" class="qform-control"
								ng-model="scopeController.selectedRow.fieldset" >
								<option ng-repeat="op in FR003_ConfigFieldsetList()" value="{{op.code}}">{{op.description}}</option>
							</select>
							<div ng-messages="forms.configMetadataForm.fieldset.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
					</div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.configMetadataForm.type.$invalid}">
							<label for="type"><s:text name="configMetadata.edit.type"/>:</label>
							<select name="type" class="qform-control" ng-model="scopeController.selectedRow.type" >
								<option value="String">String</option>
								<option value="Integer">Integer</option>
								<option value="Decimal">Decimal</option>
								<option value="Boolean">Boolean</option>
								<option value="Date">Date</option>
								<option value="DateTime">DateTime</option>
								<option value="Time">Time</option>
								<option value="SysAttribute">SysAttribute</option>
								<option value="URL">URL</option>
								<option value="Email">Email</option>
							</select>
							<div ng-messages="forms.configMetadataForm.type.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
						<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.configMetadataForm.typeDomain.$invalid}" ng-if="scopeController.selectedRow.type == 'SysAttribute'">
							<label for="typeDomain"><s:text name="configMetadata.edit.typeDomain"/>:</label>
							<select name="typeDomain" class="qform-control" ng-model="scopeController.selectedRow.typeDomain" >
								<option ng-repeat="op in scopeController.allAttributeType" value="{{op.tipo}}">{{op.tipo}}</option>
							</select>
							<div ng-messages="forms.configMetadataForm.typeDomain.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>

					</div>
					<div class="qrow" style="margin-top: 20px; margin-bottom: 20px;">
						<div class="qcol-xs-12 qcol-md-6">
							<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedRow.mandatoryYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
									<s:text name="configMetadata.edit.mandatoryYN"></s:text>
								</label>
							</i-check>
							<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedRow.multipleYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
									<s:text name="configMetadata.edit.multipleYN"></s:text>
								</label>
							</i-check>
							<div ng-messages="forms.configMetadataForm.mapYN.$error" role="alert" class="qhas-error">
								<div ng-message="ifMultipleNoMap"><s:text name="error.configMetadata.ifMultipleNoMap"/></div>
							</div>
							<i-check id="selectItem" style="cursor:pointer;" name="mapYN" ng-model="scopeController.selectedRow.mapYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
									<s:text name="configMetadata.edit.mapYN"></s:text>
								</label>
							</i-check>
							<div ng-messages="forms.configMetadataForm.mapYN.$error" role="alert" class="qhas-error">
								<div ng-message="configMetadata.mapNoStringType"><s:text name="error.configMetadata.mapNoStringType"/></div>
								<div ng-message="ifMultipleNoMap"><s:text name="error.configMetadata.ifMultipleNoMap"/></div>
							</div>
						</div>
						<div class="qcol-xs-12 qcol-md-6">
							<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedRow.clusterYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
									<s:text name="configMetadata.edit.clusterYN"></s:text>
								</label>
							</i-check>
							<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedRow.companyYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
									<s:text name="configMetadata.edit.companyYN"></s:text>
								</label>
							</i-check>
							<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedRow.configurableValuesYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
									<s:text name="configMetadata.edit.configurableValuesYN"></s:text>
								</label>
							</i-check>
						</div>
					</div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-12" ng-class="{'qhas-error': forms.configMetadataForm.mandatoryConfigCodeLeader.$invalid}" ng-if="scopeController.selectedRow.mandatoryYN == true">
							<label for="mandatoryConfigCodeLeader"><s:text name="configMetadata.edit.mandatoryConfigCodeLeader"/>:</label>
							<select name="type" class="qform-control" ng-model="scopeController.selectedRow.mandatoryConfigCodeLeader" >
								<option value=""></option>
								<option ng-repeat="op in scopeController.result.list" value="{{op.code}}">{{op.code}}</option>
							</select>
							<div ng-messages="forms.configMetadataForm.mandatoryConfigCodeLeader.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
					</div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-12" ng-class="{'qhas-error': forms.configMetadataForm.label.$invalid}">
							<label for="label"><s:text name="configMetadata.edit.label"/>:</label>
							<input type="text" ng-model="scopeController.selectedRow.label" name="label" class="qform-control" />
							<div ng-messages="forms.configMetadataForm.label.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
					</div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-12" ng-class="{'qhas-error': forms.configMetadataForm.helper.$invalid}">
							<label for="helper"><s:text name="configMetadata.edit.helper"/>:</label>
							<textarea ng-model="scopeController.selectedRow.helper" name="helper" class="qform-control" rows="3"/>
							<div ng-messages="forms.configMetadataForm.helper.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
					</div>
 					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.configMetadataForm.defaultValue.$invalid}">
							<label for="defaultValue"><s:text name="configMetadata.edit.defaultValue"/>:</label>
							<input type="text" ng-model="scopeController.selectedRow.defaultValue" name=defaultValue" class="qform-control" />
							<div ng-messages="forms.configMetadataForm.defaultValue.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
						<div class="qcol-xs-12 qcol-md-6" ng-class="{'qhas-error': forms.configMetadataForm.kind.$invalid}">
							<label for="kind"><s:text name="configMetadata.edit.kind"/>:</label>
							<select name="kind" class="qform-control"
								ng-model="scopeController.selectedRow.kind" >
								<option ng-repeat="op in FR005_KindConfigMetadata()" value="{{op.code}}">{{op.description}}</option>
							</select>
							<div ng-messages="forms.configMetadataForm.kind.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
					</div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-12" ng-class="{'qhas-error': forms.configMetadataForm.fromVersion.$invalid}">
							<label for="fromVersion"><s:text name="configMetadata.edit.fromVersion"/>:</label>
							<input type="text" ng-model="scopeController.selectedRow.fromVersion" name="fromVersion" class="qform-control" />
							<div ng-messages="forms.configMetadataForm.fromVersion.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</div>
					</div>
			</form>	
        </div>
        <div class="qmodal-footer">
			<button class="qbtn btn-framework-color" type="button" ng-click="saveConfigMetadata()"><i class="fa fa-floppy-o"></i>&nbsp;<s:text name="button.salve" /></button>
            <button class="qbtn btn-framework-color" type="button" ng-click="cancelEditConfigMetadata()"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.cancel" /></button>
        </div>
</script>