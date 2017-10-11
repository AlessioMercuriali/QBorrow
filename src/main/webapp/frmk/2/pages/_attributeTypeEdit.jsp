<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form name="forms.attributeTypeForm">
<i class="fa fa-arrow-left text-framework cursor" ng-click="scopeController.selectedPage='list'"></i>
<i class="fa fa-floppy-o text-framework cursor" ng-click="saveAttributeType()"></i>
<span ng-click="scopeController.editAttributeTypeeditViewHelp=!scopeController.editAttributeTypeeditViewHelp"><i class="fa fa-info-circle text-framework cursor" ></i></span>
<div class="box box-framework " >
	<div class="box-header with-border">
		<h3 class="qh3 box-title"><i class="fa fa-pencil"></i>
			<s:text name="attribute.btn.edit"></s:text>&nbsp;{{scopeController.selectedAttributeType.tipo}}
		</h3>
	</div>
	<div class="box-body frmk-container" >
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				<label><s:text name="attribute.label.type"></s:text></label>
			</div>
			<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeTypeForm.tipo.$invalid}">
				<input type="text" name="tipo" class="qform-control" ng-model="scopeController.selectedAttributeType.tipo"></input>
				<div ng-messages="forms.attributeTypeForm.tipo.$error" role="alert">
					<div ng-message="notNull"><s:text name="error.notNull"/></div>
				</div>
			</div>
			<div class="qcol-md-2 qtext-right">
				<label><s:text name="attribute.label.typeDescr"></s:text></label>
			</div>
			<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeTypeForm.tipo_descrizione.$invalid}">
				<input type="text" name="tipo_descrizione" class="qform-control" ng-model="scopeController.selectedAttributeType.tipo_descrizione"></input>
				<div ng-messages="forms.attributeTypeForm.tipo_descrizione.$error" role="alert">
					<div ng-message="notNull"><s:text name="error.notNull"/></div>
				</div>
			</div>
			<div class="qcol-md-12  qsample-show-hide qcollapsing" collapse="scopeController.editAttributeTypeeditViewHelp!=true">
				<div class="qcol-md-4 qcol-md-offset-2 help-alert">
					<s:text name="attributeType.edit.type.help"></s:text>
				</div>
				<div class="qcol-md-4 qcol-md-offset-2 help-alert" >
					<s:text name="attributeType.edit.typedescr.help"></s:text>
				</div>
			</div>
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				<label><s:text name="attribute.label.use"></s:text></label>
			</div>
			<div class="qcol-md-4">
				<textarea name="dataViewDescr" type="text" class="qform-control" style="height: 50px;"  id="descr" rows="5" 
						  ng-model="scopeController.selectedAttributeType.usatoDa" >
				</textarea>
			</div>
			<div class="qcol-md-2 qtext-right">
				<label>
					<s:text name="attribute.label.version"></s:text>
				</label>
			</div>
			<div class="qcol-md-4">
				<textarea name="dataViewDescr" type="text" class="qform-control" style="height: 50px;"  id="descr" rows="5" 
						  ng-model="scopeController.selectedAttributeType.valuesVersion" >
				</textarea>
			</div>
			<div class="qcol-md-12"></div>
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				Opzioni
			</div>
			<div class="qcol-md-4">
				<div class="qcol-md-12">
					<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedAttributeType.multisocietaYN" >
						<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
							<s:text name="attribute.label.multiCompany"></s:text>
						</label>
					</i-check>
					<span class="help-alert" ng-if="scopeController.editAttributeTypeeditViewHelp" >
						<s:text name="attributeType.edit.MCYN.help"></s:text>
					</span>					
				</div>
				<div class="qcol-md-12">
					<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedAttributeType.ordinabileYN" >
						<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
							<s:text name="attribute.label.sortable"></s:text>
						</label>
					</i-check>
					<span class="help-alert" ng-if="scopeController.editAttributeTypeeditViewHelp" >
						<s:text name="attributeType.edit.sortable.help"></s:text>
					</span>
				</div>
				<div class="qcol-md-12" >
					<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedAttributeType.cachebleYN" >
						<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
							<s:text name="attribute.label.cacheble"></s:text>
						</label>
					</i-check>
					<span class="help-alert" ng-if="scopeController.editAttributeTypeeditViewHelp" >
						<s:text name="attributeType.edit.cacheble.help"></s:text>
					</span>	
				</div>
				<div class="qcol-md-12">
					<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedAttributeType.multilinguaYN" >
						<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
							<s:text name="attribute.label.multiLanguage"></s:text>
						</label>
					</i-check>
					<span class="help-alert" ng-if="scopeController.editAttributeTypeeditViewHelp" >
						<s:text name="attributeType.edit.MLYN.help"></s:text>
					</span>
				</div>
				<div class="qcol-md-12">
					<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.selectedAttributeType.cancellazioneFisicaYN" >
						<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
							<s:text name="attribute.label.cancellazioneFisica"></s:text>
						</label>
					</i-check>
					<span class="help-alert" ng-if="scopeController.editAttributeTypeeditViewHelp" >
						<s:text name="attributeType.edit.cancellazioneFisica.help"></s:text>
					</span>
				</div>
				
			</div>
			<span ng-if="scopeController.selectedAttributeType.multilinguaYN">
				<div class="qcol-md-2 qtext-right">
					<s:text name="attribute.label.defaultLanguage"></s:text>
				</div>
				<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeTypeForm.linguaDefault.$invalid}">	
					<s:select name="lingua" cssClass="qform-control" ng-model="scopeController.selectedAttributeType.linguaDefault" list="userContext.languages"></s:select>
					<div ng-messages="forms.attributeTypeForm.linguaDefault.$error" role="alert">
						<div ng-message="linguaDefaultIfMultilingua"><s:text name="error.linguaDefaultIfMultilingua"/></div>
					</div>
				</div>
			</span>
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow" >
			<div class="qcol-md-2 qtext-right"><label><s:text name="attribute.label.gen"></s:text></label></div>
			<div class="qcol-md-4">
				<qs2:attribute2Input onlyActive="true" ng-model="scopeController.selectedAttributeType.genere" cssClass="qform-control" type="FR004_GenereAttributeType" id="test" name="genere"/>
			</div>
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qpanel qpanel-frmk">
			<div class="qpanel-heading">
				<s:text name="attributeType.edit.section1.help"></s:text>
			</div>
			<div class="qpanel-body qpanel-body-frmk">
				<div class="help-alert">
					<s:text name="attribute.label.code"></s:text>:&nbsp;<span ng-show="scopeController.editAttributeTypeeditViewHelp==true"><s:text name="attributeType.edit.code.help"></s:text></span>
				</div>
				<div class="frmk-row">&nbsp;</div>
				<div class="qrow">
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.code.type"></s:text>
					</div>
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeTypeForm.attributeTypeAttributes_0__attributeTypeCode_tipo.$invalid}">
						<span class="qery-panel-btn dropdown" ng-init="scopeController.openCodeTypeMenu=false">
							<a class="cursor" ng-click="scopeController.openCodeTypeMenu = !scopeController.openCodeTypeMenu"  style="color: #000;">
								<span style="font-style:italic;font-weight: bold;" ng-if="scopeController.attributeTypeAttributeCode.tipo != null && scopeController.attributeTypeAttributeCode.tipo != undefined && scopeController.attributeTypeAttributeCode.tipo!=''">
									{{scopeController.attributeTypeAttributeCode.tipo}}
								</span>
								<span style="font-style:italic;" ng-if="scopeController.attributeTypeAttributeCode.tipo == null || scopeController.attributeTypeAttributeCode.tipo == undefined || scopeController.attributeTypeAttributeCode.tipo==''">
									<s:text name="attribute.label.type.selectTitle"></s:text>&nbsp;<s:text name="attribute.label.code.type"></s:text>
								</span>
								&nbsp;
								<i class="fa fa-lg fa-angle-down text-framework"></i>
							</a>
							<ul class="qdropdown-menu" ng-show="scopeController.openCodeTypeMenu" style="display: block;" ng-mouseleave="scopeController.openCodeTypeMenu=false" >
								<li style="padding: 10px;" class="cursor" ng-click="scopeController.attributeTypeAttributeCode.tipo= ''">
									&nbsp;
								</li>
								<li style="padding: 10px;" class="cursor" ng-click="scopeController.attributeTypeAttributeCode.tipo='Testo'">
									<s:text name="attribute.label.type.testo"></s:text>
								</li>
								<li style="padding: 10px;" class="cursor" ng-click="scopeController.attributeTypeAttributeCode.tipo= 'Intero'">
									<s:text name="attribute.label.type.intero"></s:text>
								</li>
							</ul>
							<input type="hidden" name="attributeTypeAttributes_0__attributeTypeCode_tipo" ng-model="attributeTypeAttributes_0__attributeTypeCode_tipo"></input>
							<div ng-messages="forms.attributeTypeForm.attributeTypeAttributes_0__attributeTypeCode_tipo.$error" role="alert">
								<div ng-message="notNull"><s:text name="error.notNull"/></div>
							</div>
						</span>
					</div>
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.code.length"></s:text>
					</div>
					<div class="qcol-md-1">
						<input type="number" class="qform-control" ng-model="scopeController.attributeTypeAttributeCode.precisionint"></input>
					</div>
					<div class="qcol-md-3"></div>
				</div>
				<div class="frmk-row">&nbsp;</div>
				<div class="qrow" ng-if="scopeController.selectedAttributeType.multilinguaYN != true">
					<div class="qcol-md-2 qtext-right" >
						<s:text name="attribute.label.code.label"></s:text>
					</div>
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeTypeForm.code_label.$invalid}">
						<input type="text" class="qform-control" name="code_label" ng-model="scopeController.codesLabelsAndHelpersMap._label" placeholder="{{scopeController.codesLabelsAndHelpersMap._label}}"></input>
						<div ng-messages="forms.attributeTypeForm.code_label.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
						</div>
					</div>
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.code.helper"></s:text>
					</div>
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeTypeForm.code_helper.$invalid}">
						<input type="text" class="qform-control" name="code_helper" ng-model="scopeController.codesLabelsAndHelpersMap._helper" placeholder="{{scopeController.codesLabelsAndHelpersMap._helper}}"></input>
						<div ng-messages="forms.attributeTypeForm.code_helper.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
						</div>
					</div>
				</div>
				<div ng-if="scopeController.selectedAttributeType.multilinguaYN == true">
					<table class="qtable qtable-hover">
						<tbody>
							<tr>
            	 				<th>&nbsp;</th>
            	 				<s:iterator id="language" status="status" value="languages">
            	 					<th><s:property value="#language"></s:property></th>
            	 				</s:iterator>
							</tr>
							<tr>
								<td class="attributeType_language_firstColumn"><s:text name="attribute.label.code.label"></s:text></td>
								<s:iterator id="language" status="status" value="languages">
									<td ng-class="{'qhas-error': forms.attributeTypeForm.<s:property value="#language"/>_code_label.$invalid}">
										<input type="text" class="qform-control" name="<s:property value="#language"/>_code_label" ng-model="scopeController.codesLabelsAndHelpersMap.<s:property value="#language"/>_label"></input>
										<div ng-messages="forms.attributeTypeForm.<s:property value="#language"/>_code_label.$error" role="alert">
											<div ng-message="notNull"><s:text name="error.notNull"/></div>
										</div>
									</td>
								</s:iterator>
							</tr>
							<tr>
								<td class="attributeType_language_firstColumn"><s:text name="attribute.label.code.helper"></s:text></td>
								<s:iterator id="language" status="status" value="languages">
									<td ng-class="{'qhas-error': forms.attributeTypeForm.<s:property value="#language"/>_code_helper.$invalid}">
										<input type="text" class="qform-control" name="<s:property value="#language"/>_code_helper" ng-model="scopeController.codesLabelsAndHelpersMap.<s:property value="#language"/>_helper"></input>
										<div ng-messages="forms.attributeTypeForm.<s:property value="#language"/>_code_helper.$error" role="alert">
											<div ng-message="notNull"><s:text name="error.notNull"/></div>
										</div>
									</td>
								</s:iterator>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="frmk-row">&nbsp;</div>
				<div class="qrow">
					<div class="qcol-md-2 qtext-right">
						Opzioni
					</div>
					<div class="qcol-md-4">
						<div class="qcol-md-12">
							<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.attributeTypeAttributeCode.ricercaYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="attribute.label.useForSearch"></s:text></label>
							</i-check>
						</div>
						<div class="qcol-md-12">
							<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.attributeTypeAttributeCode.autogeneratoYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="attribute.label.autogen"></s:text></label>
							</i-check>
						</div>
					</div>
					<span ng-if="scopeController.attributeTypeAttributeCode.autogeneratoYN">
						<div class="qcol-md-2 qtext-right" >
								<label><s:text name="attribute.label.autogenbeanname"></s:text></label>
						</div>
						<div class="qcol-md-4">
							<input type="text" class="qform-control" ng-model="scopeController.attributeTypeAttributeCode.autogenBeanName"></input>
						</div>
					</span>
				</div>
				
				<div class="frmk-row">&nbsp;</div>
				<div class="help-alert">
					<s:text name="attribute.label.descr"></s:text>:&nbsp;<span ng-show="scopeController.editAttributeTypeeditViewHelp==true"><s:text name="attributeType.edit.descr.help"></s:text></span>
				</div>
				<div class="frmk-row">&nbsp;</div>
				<div class="qrow" ng-if="scopeController.selectedAttributeType.multilinguaYN != true">
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.descr.label"></s:text>
					</div>
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeTypeForm.descr_label.$invalid}">
						<input type="text" class="qform-control" name="descr_label" placeholder="{{scopeController.descrsLabelsAndHelpersMap._label}}" ng-model="scopeController.descrsLabelsAndHelpersMap._label"></input>
						<div ng-messages="forms.attributeTypeForm.descr_label.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
						</div>
					</div>
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.descr.helper"></s:text>
					</div>
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeTypeForm.descr_helper.$invalid}">
						<input type="text" class="qform-control" name="descr_helper" placeholder="{{scopeController.descrsLabelsAndHelpersMap._helper}}" ng-model="scopeController.descrsLabelsAndHelpersMap._helper"></input>
						<div ng-messages="forms.attributeTypeForm.descr_helper.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
						</div>
					</div>
				</div>
				<div ng-if="scopeController.selectedAttributeType.multilinguaYN == true">
					<table class="qtable qtable-hover">
						<tbody>
							<tr>
           	 					<th>&nbsp;</th>
           	 					<s:iterator id="language" status="status" value="languages">
           	 						<th><s:property value="#language"></s:property></th>
           	 					</s:iterator>
							</tr>
							<tr>
								<td class="attributeType_language_firstColumn"><s:text name="attribute.label.descr.label"></s:text></td>
								<s:iterator id="language" status="status" value="languages">
									<td ng-class="{'qhas-error': forms.attributeTypeForm.<s:property value="#language"/>_descr_label.$invalid}">
										<input type="text" class="qform-control" name="<s:property value="#language"/>_descr_label"  ng-model="scopeController.descrsLabelsAndHelpersMap.<s:property value="#language"/>_label"></input>
										<div ng-messages="forms.attributeTypeForm.<s:property value="#language"/>_descr_label.$error" role="alert">
											<div ng-message="notNull"><s:text name="error.notNull"/></div>
										</div>
									</td>
								</s:iterator>
							</tr>
							<tr>
								<td class="attributeType_language_firstColumn"><s:text name="attribute.label.descr.helper"></s:text></td>
								<s:iterator id="language" status="status" value="languages">
									<td ng-class="{'qhas-error': forms.attributeTypeForm.<s:property value="#language"/>_descr_helper.$invalid}">
										<input type="text" class="qform-control" name="<s:property value="#language"/>_descr_helper" ng-model="scopeController.descrsLabelsAndHelpersMap.<s:property value="#language"/>_helper"></input>
										<div ng-messages="forms.attributeTypeForm.<s:property value="#language"/>_descr_helper.$error" role="alert">
											<div ng-message="notNull"><s:text name="error.notNull"/></div>
										</div>
									</td>
								</s:iterator>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="frmk-row">&nbsp;</div>
				<div class="qrow">
					<div class="qcol-md-2 qtext-right">
						Opzioni
					</div>
					<div class="qcol-md-4">
						<div class="qcol-md-12">
							<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.attributeTypeAttributeDescr.obbligatorioYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="attribute.label.descr.mandatory"></s:text></label>
							</i-check>
						</div>
						<div class="qcol-md-12">
							<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.attributeTypeAttributeDescr.ricercaYN" >
								<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="attribute.label.useForSearch"></s:text></label>
							</i-check>
						</div>
					</div>
					<span ng-if="scopeController.attributeTypeAttributeDescr.autogeneratoYN">
						<div class="qcol-md-2 qtext-right" >
							<label><s:text name="attribute.label.autogenbeanname"></s:text></label>
						</div>
						<div class="qcol-md-4">
							<input type="text" class="qform-control" ng-model="scopeController.attributeTypeAttributeDescr.autogenBeanName"></input>
						</div>
					</span>
				</div>
		</div>
	</div>
	<div class="qpanel qpanel-frmk">
		<div class="qpanel-heading">
			<s:text name="attributeType.edit.section2.help"></s:text>
		</div>
		<div class="qpanel-body qpanel-body-frmk">
			<div class="qrow qtext-center">
				<button class="qbtn btn-framework-color" ng-click="addNewAttribute()" type="button"><i class="fa fa-plus-circle"></i>&nbsp;<s:text name="attribute.btn.addAttribute"></s:text></button>
			</div>
			<div ng-if="scopeController.attributeList != null && scopeController.attributeList != undefined" ng-repeat="attribute in scopeController.attributeList track by $index">
				<div class="qcol-md-12">
					<div style="padding-left: 2px;">
						<i ng-if="attribute.visibileYN != 1" ng-click="attribute.visibileYN=1" class="fa fa-lg fa-circle text-grey cursor" ></i>
						<i ng-if="attribute.visibileYN == 1" ng-click="attribute.visibileYN=0" class="fa fa-lg fa-check-circle text-framework cursor" ></i>
					</div>
					<div class="qcol-md-12" ng-class="{'frmk-grey-box':attribute.visibileYN!=1,'frmk-box':attribute.visibileYN==1}">
						<div class="qrow" style="margin-left:10px;">
							<div class="qcol-md-12 qsample-show-hide qcollapsing help-alert" style="padding-left: 15px;" collapse="scopeController.editAttributeTypeeditViewHelp!=true">
									<s:text name="attributeType.edit.section2.help4"></s:text>
							</div>
							<div ng-if="scopeController.selectedAttributeType.multilinguaYN != true">
								<div class="qcol-md-2 qtext-right">
									<s:text name="attribute.label.attribute.label"></s:text>
								</div>
								<div class="qcol-md-3">
									<input type="text" class="qform-control" ng-model="scopeController.attributesLabelsMap['_'+($index+1)]"></input>
								</div>
								<div class="qcol-md-2 qtext-right">
									<s:text name="attribute.label.attribute.helper"></s:text>
								</div>
								<div class="qcol-md-3">
									<input type="text" class="qform-control" ng-model="scopeController.attributesHelpersMap['_'+($index+1)]"></input>
								</div>
								<div class="qcol-md-2"></div>
							</div>
							<div ng-if="scopeController.selectedAttributeType.multilinguaYN == true">
								<table class="qtable qtable-hover">
									<tbody>
										<tr>
		               	 					<th>&nbsp;</th>
		               	 					<s:iterator id="language" status="status" value="languages">
		               	 						<th><s:property value="#language" ></s:property></th>
		               	 					</s:iterator>
										</tr>
										<tr>
											<td class="attributeType_language_firstColumn"><s:text name="attribute.label.attribute.label"></s:text></td>
											<s:iterator id="language" status="status" value="languages">
												<td><input type="text" class="qform-control" ng-model="scopeController.attributesLabelsMap['<s:property value="#language"/>_'+($index+1)]"></input></td>
											</s:iterator>
										</tr>
										<tr>
											<td class="attributeType_language_firstColumn"><s:text name="attribute.label.attribute.helper"></s:text></td>
											<s:iterator id="language" status="status" value="languages">
												<td><input type="text" class="qform-control" ng-model="scopeController.attributesHelpersMap['<s:property value="#language"/>_'+($index+1)]"></input></td>
											</s:iterator>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="frmk-row">&nbsp;</div>
						<div class="qrow" style="margin-left:10px;">
							<div ng-if="scopeController.editAttributeTypeeditViewHelp==true">
								<div class="qcol-md-12 qsample-show-hide qcollapsing help-alert" style="padding-left:20px;" collapse="scopeController.editAttributeTypeeditViewHelp!=true">
									<s:text name="attributeType.edit.section2.help5"></s:text>
								</div>
							</div>
							<div class="qcol-md-12">
								<div class="qcol-md-2 qtext-right">
									<s:text name="attribute.label.attribute.default"></s:text>
								</div>
								<div class="qcol-md-3">
									<input type="text" class="qform-control" ng-model="attribute.defaultValue"></input>
								</div>
								<div class="qcol-md-7">
								</div>
							</div>
						</div>
						<div class="frmk-row">&nbsp;</div>
						<div class="qrow" style="margin-left:10px;">
							<div ng-if="scopeController.editAttributeTypeeditViewHelp==true">
								<div class="qcol-md-12 qsample-show-hide qcollapsing help-alert" style="padding-left: 15px;" collapse="scopeController.editAttributeTypeeditViewHelp!=true">
									<s:text name="attributeType.edit.section2.help3"></s:text>			
								</div>
							</div>
							<div class="qcol-md-2 qtext-right">
								<label><s:text name="attribute.label.code.type"></s:text></label>
							</div>
							<div class="qcol-md-3" style="margin-left: 30px; padding-left: 0px;">
								<span class="qery-panel-btn dropdown" ng-init="scopeController.openTypeMenu=false">
									<a class="cursor" ng-click="attribute.openTypeMenu = !attribute.openTypeMenu"  style="color: #000;">
										<span style="font-style:italic;font-weight: bold;" ng-if="attribute.tipo != null || attribute.tipo != undefined || attribute.tipo != ''">{{attribute.tipo}}</span>&nbsp;<i class="fa fa-lg fa-angle-down text-framework"></i>
										<span style="font-style:italic;" ng-if="attribute.tipo == null || attribute.tipo == undefined || attribute.tipo == ''">
											<s:text name="attribute.label.type.selectTitle"></s:text>&nbsp;<s:text name="attribute.label.code.type"></s:text>
										</span>
									</a>
									<ul class="qdropdown-menu" ng-show="attribute.openTypeMenu" style="display: block;" ng-mouseleave="attribute.openTypeMenu=false" >
										<li style="padding: 0px 10px;" class="cursor" ng-click="attribute.tipo=''">
											&nbsp;
										</li>
										<li style="padding: 0px 10px;" class="cursor" ng-click="attribute.tipo='Altro_Attribute'">
											<s:text name="attribute.label.type.altro"></s:text>
										</li>
										<li style="padding: 0px 10px;" class="cursor" ng-click="attribute.tipo='Color_Picker'">
											<s:text name="attribute.label.type.color"></s:text>
										</li>
										<li style="padding: 0px 10px;" class="cursor" ng-click="attribute.tipo='Data'">
											<s:text name="attribute.label.type.date"></s:text>
										</li>
										<li style="padding: 0px 10px;" class="cursor" ng-click="attribute.tipo='Decimale'">
											<s:text name="attribute.label.type.decimale"></s:text>
										</li>
										<li style="padding: 0px 10px;" class="cursor" ng-click="attribute.tipo='Intero'">
											<s:text name="attribute.label.type.intero"></s:text>
										</li>
										<li style="padding: 0px 10px;" class="cursor" ng-click="attribute.tipo='Testo'">
											<s:text name="attribute.label.type.testo"></s:text>
										</li>
										<li style="padding: 0px 10px;" class="cursor" ng-click="attribute.tipo='Testo_Multilingua'">
											<s:text name="attribute.label.type.testoml"></s:text>
										</li>
										<li style="padding: 0px 10px;" class="cursor" ng-click="attribute.tipo='Vero_Falso'">
											<s:text name="attribute.label.type.vf"></s:text>
										</li>
									</ul>
								</span>
							</div>
							<div ng-if="attribute.tipo == 'Altro_Attribute'">
								<div class="qcol-md-2 qtext-right">
									<label><s:text name="attribute.label.attribute.type"></s:text></label>
								</div>
								<div class="qcol-md-3">
										<span class="qery-panel-btn dropdown" ng-init="scopeController.openAttTypeMenu=false">
										<a class="cursor" ng-click="scopeController.openAttTypeMenu = !scopeController.openAttTypeMenu"  style="color: #000;">
											<span style="font-style:italic;font-weight: bold;" ng-if="attribute.tipoAttribute != null || attribute.tipoAttribute != undefined || attribute.tipoAttribute != ''">{{attribute.tipoAttribute}}</span>&nbsp;<i class="fa fa-lg fa-angle-down text-framework"></i>
											<span style="font-style:italic;" ng-if="attribute.tipoAttribute == null || attribute.tipoAttribute == undefined || attribute.tipoAttribute == ''">
												<s:text name="attribute.label.type.selectTitle"></s:text>&nbsp;<s:text name="attribute.label.attribute.type"></s:text>
											</span>
										</a>
										<ul class="qdropdown-menu" ng-show="scopeController.openAttTypeMenu" style="display: block;" ng-mouseleave="scopeController.openAttTypeMenu=false" >
											<li style="padding: 10px;" class="cursor" ng-click="attribute.tipo=''">
												&nbsp;
											</li>
											<li style="padding: 10px;" class="cursor" 
												ng-repeat="attType in scopeController.result"
												ng-click="attribute.tipoAttribute=attType.tipo">
												{{attType.tipo}}
											</li>
										</ul>
									</span>
								</div>
							</div>
						</div>
						<div class="frmk-row">&nbsp;</div>
						<div class="qrow" style="margin-left:10px;">
							<div ng-if="scopeController.editAttributeTypeeditViewHelp==true">
								<div class="qcol-md-12 qsample-show-hide qcollapsing help-alert" style="padding-left: 15px;" collapse="scopeController.editAttributeTypeeditViewHelp!=true">
										<s:text name="attributeType.edit.section2.help1"></s:text>
								</div>
							</div>
							<div class="qcol-md-2 qtext-right">
								Opzioni
							</div>
							<div class="qcol-md-4">
								<div class="qcol-md-12">
									<i-check id="selectItem" style="cursor:pointer;" ng-model="attribute.obbligatorioYN" >
										<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="attribute.label.descr.mandatory"></s:text></label>
									</i-check>
								</div>
								<div class="qcol-md-12">
									<i-check id="selectItem" style="cursor:pointer;" ng-model="attribute.ricercaYN" >
										<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="attribute.label.useForSearch"></s:text></label>
									</i-check>
								</div>
								<div class="qcol-md-12">
									<i-check id="selectItem" style="cursor:pointer;" ng-model="attribute.autogeneratoYN" >
										<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="attribute.label.autogen"></s:text></label>
									</i-check>
								</div>
							</div>
							<span ng-if="attribute.autogeneratoYN">
								<div class="qcol-md-2 qtext-right" >
									<label><s:text name="attribute.label.autogenbeanname"></s:text></label>
								</div>
								<div class="qcol-md-4">
									<input type="text" class="qform-control" ng-model="attribute.autogenBeanName"></input>
								</div>
							</span>
						</div>
						<div class="frmk-row">&nbsp;</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="qrow">
		<button class="qbtn btn-framework-color" ng-click="scopeController.selectedPage='list'" type="button">
			<i class="fa fa-arrow-left cursor"></i>&nbsp;
			<s:text name="attribute.btn.back"></s:text>
		</button>
		<button class="qbtn btn-framework-color" ng-click="saveAttributeType()" type="button">
			<i class="fa fa-floppy-o cursor"></i>&nbsp;
			<s:text name="attribute.btn.save"></s:text>
		</button>
	</div>
	<div class="frmk-row">&nbsp;</div>
</div>
<!-- {{scopeController.selectedAttributeType | json}} -->
</div>
</form>