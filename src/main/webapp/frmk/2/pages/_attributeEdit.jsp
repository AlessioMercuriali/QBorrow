<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form name="forms.attributeForm">
	<i class="fa fa-arrow-left text-framework cursor" ng-click="scopeController.selectedPage='attribute'"></i>
	<i class="fa fa-floppy-o text-framework cursor" ng-click="saveAttribute()"></i>
	<div class="box box-framework" >
		<div class="box-header with-border">
			<h3 class="qh3 box-title"><i class="fa fa-find"></i>
				<s:text name="attribute.btn.edit"></s:text>&nbsp;{{scopeController.selectedAttribute.code}}
			</h3>
			<div class="help-alert" style="font-style:italic">{{scopeController.selectedAttribute.description}}</div>
		</div>
		<div class="box-body frmk-container">
			
	<!-- CODE -->
			<div class="frmk-row">&nbsp;</div>
			<div class="qrow">
				<div class="qcol-md-2">
					{{scopeController.labelsAndHelpersAttributes.CODE_LABEL}}
				</div>
				<div class="qcol-md-4" ng-if="scopeController.selectedAttribute.id != null || scopeController.attributeTypeCode.autogeneratoYN">
					<b>{{scopeController.selectedAttribute.code}}</b>
				</div>
				<div class="qcol-md-4" ng-if="scopeController.selectedAttribute.id == null && !scopeController.attributeTypeCode.autogeneratoYN" ng-class="{'qhas-error': forms.attributeForm.code.$invalid}">
					<input type="text" name="code" class="qform-control" ng-model="scopeController.selectedAttribute.code"/>
					<div ng-messages="forms.attributeForm.code.$error" role="alert">
						<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>
				</div>
				<div class="qcol-md-4">
					{{scopeController.labelsAndHelpersAttributes.CODE_HELPER}}
				</div>
			</div>
	
	<!--  DESCRIPTION -->
			<div class="frmk-row">&nbsp;</div>
			<div class="qrow" ng-if="scopeController.selectedAttributeType.multilinguaYN!=true">
				<div class="qcol-md-2">
					{{scopeController.labelsAndHelpersAttributes.DESCR_LABEL}}
				</div>
				<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeForm.description.$invalid}">
					<input type="text" name="description" class="qform-control" ng-model="scopeController.selectedAttribute.description"/>
					<div ng-messages="forms.attributeForm.description.$error" role="alert">
						<div ng-message="notNull"><s:text name="error.notNull"/></div>
					</div>
				</div>
				<div class="qcol-md-4">
					{{scopeController.labelsAndHelpersAttributes.DESCR_HELPER}}
				</div>
			</div>
			<div class="qrow" ng-if="scopeController.selectedAttributeType.multilinguaYN">
				<table class="qtable qtable-hover">
					<tbody>
						<tr>
	       	 				<th>&nbsp;</th>
	       	 				<s:iterator id="language" status="status" value="languages">
	       	 					<th><s:property value="#language"></s:property></th>
	       	 				</s:iterator>
						</tr>
						<tr>
							<td class="attributeType_language_firstColumn">&nbsp;{{scopeController.labelsAndHelpersAttributes.DESCR_LABEL}}</td>
							<s:iterator id="language" status="status" value="languages">
								<td>
									<div ng-class="{'qhas-error': forms.attributeForm.description_<s:property value="#language"/>.$invalid}">
										<input type="text" class="qform-control" name="description_<s:property value="#language"/>" ng-model="scopeController.descriptionInLanguage.<s:property value="#language"/>"></input>
										<div ng-messages="forms.attributeForm.description_<s:property value="#language"/>.$error" role="alert">
											<div ng-message="notNull"><s:text name="error.notNull"/></div>
											<div ng-message="length"><s:text name="error.length"/></div>
											<div ng-message="notNumeric"><s:text name="error.notNumeric"/></div>
										</div>
									</div>
								</td>
							</s:iterator>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="qrow" ng-if="scopeController.selectedAttributeType.multilinguaYN">
				<div class="qcol-md-12">
					{{scopeController.labelsAndHelpersAttributes.DESCR_HELPER}}
				</div>
			</div>
			
	<!--  SORTING  -->		
			<div class="frmk-row">&nbsp;</div>
			<div  ng-if="scopeController.selectedAttributeType.ordinabileYN">
				<div class="qrow">
					<div class="qcol-md-2" >
						<s:text name="attribute.label.sort"></s:text>
					</div>
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeForm.ordinamento.$invalid}">
						<input type="number" name="ordinamento" class="qform-control" ng-model="scopeController.selectedAttribute.ordinamento"></input>
						<div ng-messages="forms.attributeForm.ordinamento.$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
						</div>
					</div>
				</div>
			</div>
			
	<!--  COMPANY -->		
			<div ng-if="scopeController.selectedAttributeType.multisocietaYN"> 
				<div class="frmk-row">&nbsp;</div>
				<div class="qrow">
					<div class="qcol-md-2">
						<s:text name="attribute.label.company"></s:text>
					</div>
					<div class="qcol-md-4">
						<span class="qery-panel-btn dropdown" ng-init="scopeController.openCodeTypeMenu=false">
							<a class="cursor" ng-click="scopeController.openCompanyMenu = !scopeController.openCompanyMenu"  style="color: #000;">
								<span style="font-style:italic;font-weight: bold;" ng-if="scopeController.selectedAttribute.organization != null && scopeController.selectedAttribute.organization != undefined && scopeController.selectedAttribute.organization!=''">
									{{scopeController.selectedAttribute.organization}}
								</span>
								<span style="font-style:italic;" ng-if="scopeController.selectedAttribute.organization == null || scopeController.selectedAttribute.organization == undefined || scopeController.selectedAttribute.organization==''">
									<s:text name="attribute.label.type.selectTitle"></s:text>&nbsp;organizzazione
								</span>
								&nbsp;
								<i class="fa fa-lg fa-angle-down text-framework"></i>
							</a>
							<ul class="qdropdown-menu" ng-show="scopeController.openCompanyMenu" style="display: block;" ng-mouseleave="scopeController.openCompanyMenu=false" >
								<li style="padding: 10px;" class="cursor" ng-click="scopeController.selectedAttribute.organization= ''">
									&nbsp;
								</li>
								<li style="padding: 10px;" class="cursor" ng-repeat="company in scopeController.companyList" ng-click="scopeController.selectedAttribute.organization=company">
									{{company}}
								</li>
							</ul>
						</span>
					</div>
				</div>
			</div>
			
	<!--  ATTRIBUTI ESTESI  -->		
			<div class="frmk-row" style="border-bottom: 1px solid #eeeeee;">&nbsp;</div>
			<div class="qrow" ng-repeat="attrTypeAttr in scopeController.attributeTypeAttributes" style="border-bottom: 1px solid #eeeeee; padding-top: 10px; padding-bottom: 10px;">
				<div class="qcol-md-3 qtext-right">
					{{scopeController.labelsAndHelpersAttributes['ATT'+($index+1)+'_LABEL']}}&nbsp;
				</div>
				<div  ng-if="attrTypeAttr.tipo == 'Testo' || (attrTypeAttr.tipo == 'Testo_Multilingua' && !scopeController.selectedAttributeType.multilinguaYN)">
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeForm['attribute'+($index+1)].$invalid}">
						<input type="text" name="attribute{{$index+1}}" class="qform-control" ng-model="scopeController.selectedAttribute['attribute'+($index+1)]"></input>
						<div ng-messages="forms.attributeForm['attribute'+($index+1)].$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="length"><s:text name="error.length"/></div>
							<div ng-message="notNumeric"><s:text name="error.notNumeric"/></div>
						</div>
					</div>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Intero'">
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeForm['attribute'+($index+1)].$invalid}">
						<input type="number" name="attribute{{$index+1}}" class="qform-control" ng-model="scopeController.selectedAttribute['attribute'+($index+1)]" string-to-int></input>
						<div ng-messages="forms.attributeForm['attribute'+($index+1)].$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="length"><s:text name="error.length"/></div>
							<div ng-message="notNumeric"><s:text name="error.notNumeric"/></div>
						</div>
					</div>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Decimale'">
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeForm['attribute'+($index+1)].$invalid}">
						<input type="number" name="attribute{{$index+1}}" class="qform-control" ng-model="scopeController.selectedAttribute['attribute'+($index+1)]" string-to-decimal></input>
						<div ng-messages="forms.attributeForm['attribute'+($index+1)].$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="length"><s:text name="error.length"/></div>
							<div ng-message="notNumeric"><s:text name="error.notNumeric"/></div>
						</div>
					</div>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Vero_Falso'">
					<div class="qcol-md-4">
						<div class="btn-group" data-toggle="buttons">
                			<label class="btn btn-default">
                    			<input type="radio" value="true" ng-model="scopeController.selectedAttribute['attribute'+($index+1)]"  /> True
               			 	</label> 
                			<label class="btn btn-default">
                    			<input type="radio" value="false" ng-model="scopeController.selectedAttribute['attribute'+($index+1)]"  /> False
                			</label>
						</div>
					</div>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Altro_Attribute'">
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeForm['attribute'+($index+1)].$invalid}">
						<span class="qery-panel-btn dropdown" ng-init="initAttribute(attrTypeAttr.tipoAttribute, $index)">
							<a class="cursor" ng-click="scopeController.openAttrValueMenu[$index] = !scopeController.openAttrValueMenu[$index]"  style="color: #000;">
								<span style="font-style:italic;font-weight: bold;" ng-if="scopeController.selectedAttribute['attribute'+($index+1)] != null && scopeController.selectedAttribute['attribute'+($index+1)] != undefined && scopeController.selectedAttribute['attribute'+($index+1)]!=''">
									{{scopeController.selectedAttribute['attribute'+($index+1)]}}
								</span>
								<span style="font-style:italic;" ng-if="scopeController.selectedAttribute['attribute'+($index+1)] == null || scopeController.selectedAttribute['attribute'+($index+1)] == undefined || scopeController.selectedAttribute['attribute'+($index+1)] ==''">
									<s:text name="attribute.label.type.selectTitle"></s:text>&nbsp;valore
								</span>
								&nbsp;
								<i class="fa fa-lg fa-angle-down text-framework"></i>
								<input type="hidden" name="attribute{{$index+1}}" class="qform-control" ng-model="scopeController.selectedAttribute['attribute'+($index+1)]" />
							</a>
							<ul class="qdropdown-menu" ng-show="scopeController.openAttrValueMenu[$index]" style="display: block;" ng-mouseleave="scopeController.openAttrValueMenu[$index]=false" >
								<li style="padding: 10px;" class="cursor" ng-click="scopeController.selectedAttribute['attribute'+($index+1)]= ''">
									&nbsp;
								</li>
								<li style="padding: 10px;" class="cursor" ng-repeat="attrValue in scopeController.attributeValuesList[$index]" ng-click="scopeController.selectedAttribute['attribute'+($parent.$index+1)] = attrValue.code">
									{{attrValue.description}}
								</li>
							</ul>
						</span>
						<div ng-messages="forms.attributeForm['attribute'+($index+1)].$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="length"><s:text name="error.length"/></div>
							<div ng-message="notNumeric"><s:text name="error.notNumeric"/></div>
						</div>
					</div>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Data'">
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeForm['attribute'+($index+1)].$invalid}">
						<div class="qinput-group" style="vertical-align: top;" >
							<input type="text" name="attribute{{$index+1}}" 
									class="qform-control" 
									id="attribute{{$index+1}}"
									ng-model="scopeController.calendar['attribute'+($index+1)].date"
									ng-change="convertDate('attribute'+($index+1))"  
									datepicker-popup="<s:text name='format.date' />" 
									is-open="scopeController.calendar['attribute'+($index+1)].opened"
									datepicker-options="dateOptions" 
									close-text="Close"
									/>
							<span class="qinput-group-btn">
						   		<button type="button" class="qbtn qbtn-default" ng-click="openCalendar('attribute'+($index+1), $event)"
					                	style="padding: 6px 12px;"><i class="fa fa-calendar"></i></button>
					        </span>
				    	</div>
				    	<div ng-messages="forms.attributeForm['attribute'+($index+1)].$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="length"><s:text name="error.length"/></div>
							<div ng-message="notNumeric"><s:text name="error.notNumeric"/></div>
						</div>
				   </div>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Testo_Multilingua' && scopeController.selectedAttributeType.multilinguaYN">
					<div class="qcol-md-4">
						<table>
							<tbody>
								<tr>
			       	 				<s:iterator id="language" status="status" value="languages">
			       	 					<th><s:property value="#language"></s:property></th>
			       	 				</s:iterator>
								</tr>
								<tr>
									<s:iterator id="language" status="status" value="languages">
										<td>
											<div ng-class="{'qhas-error': forms.attributeForm['attribute_<s:property value="#language"/>_'+($index+1)].$invalid}">
												<input type="text" class="qform-control" name="attribute_<s:property value="#language"/>_{{$index+1}}" ng-model="scopeController.attributeInLanguage['attribute'+($index+1)+'_<s:property value="#language"/>']"></input>
												<div ng-messages="forms.attributeForm['attribute_<s:property value="#language"/>_'+($index+1)].$error" role="alert">
													<div ng-message="notNull"><s:text name="error.notNull"/></div>
													<div ng-message="length"><s:text name="error.length"/></div>
													<div ng-message="notNumeric"><s:text name="error.notNumeric"/></div>
												</div>
											</div>
										</td>
									</s:iterator>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Color_Picker'">
					<div class="qcol-md-4" ng-class="{'qhas-error': forms.attributeForm['attribute'+($index+1)].$invalid}">
						<button type="qbutton" class="qbtn" name="attribute{{$index+1}}" colorpicker ng-model="scopeController.selectedAttribute['attribute'+($index+1)]" style="background-color:{{scopeController.selectedAttribute['attribute'+($index+1)]}}" >
							<span class="fa fa-paint-brush"></span>
						</button>
						<div ng-messages="forms.attributeForm['attribute'+($index+1)].$error" role="alert">
							<div ng-message="notNull"><s:text name="error.notNull"/></div>
							<div ng-message="length"><s:text name="error.length"/></div>
							<div ng-message="notNumeric"><s:text name="error.notNumeric"/></div>
						</div>
					</div>
				</div>
				<div class="qcol-md-5">
					{{scopeController.labelsAndHelpersAttributes['ATT'+($index+1)+'_HELPER']}}
				</div>
			</div>
			<div class="frmk-row">&nbsp;</div>
			<div class="qrow">
				<button class="qbtn btn-framework-color" ng-click="scopeController.selectedPage='attribute'" type="button">
					<i class="fa fa-arrow-left cursor"></i>&nbsp;
					<s:text name="attribute.btn.back"></s:text>
				</button>
				<button class="qbtn btn-framework-color" ng-click="saveAttribute()" type="button">
					<i class="fa fa-floppy-o cursor"></i>&nbsp;
					<s:text name="attribute.btn.save"></s:text>
				</button>
			</div>
			<div class="frmk-row">&nbsp;</div>
		</div>
	</div>
</form>