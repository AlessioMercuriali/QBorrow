<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<i class="fa fa-arrow-left text-framework cursor" ng-click="scopeController.selectedPage='list'"></i>
<div class="box box-framework " >
	<div class="box-header with-border">
		<h3 class="qh3 box-title"><i class="fa fa-search"></i>
			{{scopeController.selectedAttributeType.tipo}}
		</h3>
	</div>
	<div class="box-body frmk-container" >
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				<label><s:text name="attribute.label.type"></s:text></label>
			</div>
			<div class="qcol-md-3">
				<b>{{scopeController.selectedAttributeType.tipo}}</b>
			</div>
			<div class="qcol-md-1"></div>
			<div class="qcol-md-2 qtext-right">
				<label><s:text name="attribute.label.typeDescr"></s:text></label>
			</div>
			<div class="qcol-md-3">
				<b>{{scopeController.selectedAttributeType.tipo_descrizione}}</b>
			</div>
			<div class="qcol-md-1"></div>
			
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				<label><s:text name="attribute.label.use"></s:text></label>
			</div>
			<div class="qcol-md-4">
				<b>{{scopeController.selectedAttributeType.usatoDa}}</b>
			</div>
			<div class="qcol-md-2 qtext-right"><label><s:text name="attribute.label.version"></s:text></label></div>
			<div class="qcol-md-4">
				<b>{{scopeController.selectedAttributeType.valuesVersion}}</b>
			</div>
			<div class="qcol-md-12"></div>
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right"><label><s:text name="attribute.label.gen"></s:text></label></div>
			<div class="qcol-md-4">
				<b>{{scopeController.selectedAttributeType.genere | sysattribute:'FR004_GenereAttributeType'}}</b>
			</div>
			<div class="qcol-md-6"></div>
			<div class="qcol-md-12"></div>
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				Opzioni
			</div>
			<div class="qcol-md-10">
				<div class="qcol-md-12">
					<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.selectedAttributeType.multisocietaYN" ></i>
					<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.selectedAttributeType.multisocietaYN!=true" ></i>
					<s:text name="attribute.label.multiCompany"></s:text>
				</div>
				<div class="qcol-md-12">
					<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.selectedAttributeType.ordinabileYN" ></i>
					<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.selectedAttributeType.ordinabileYN!=true" ></i>
					<s:text name="attribute.label.sortable"></s:text>
				</div>
				<div class="qcol-md-12" >
					<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.selectedAttributeType.cachebleYN" ></i>
					<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.selectedAttributeType.cachebleYN!=true" ></i>
					<s:text name="attribute.label.cacheble"></s:text>
				</div>
				<div class="qcol-md-12">
					<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.selectedAttributeType.multilinguaYN" ></i>
					<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.selectedAttributeType.multilinguaYN!=true" ></i>
					<s:text name="attribute.label.multiLanguage"></s:text>
					<span  ng-if="scopeController.selectedAttributeType.multilinguaYN && scopeController.selectedAttributeType.linguadefault != null">
					(<b>{{scopeController.selectedAttributeType.linguadefault}}</b>)
				</span>
				</div>
			</div>
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qpanel qpanel-frmk">
			<div class="qpanel-heading">
				<s:text name="attributeType.edit.section1.help"></s:text>
			</div>
			<div class="qpanel-body qpanel-body-frmk">
				<div class="frmk-row">&nbsp;</div>
				<div class="qrow">
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.code.type"></s:text>
					</div>
					<div class="qcol-md-4">
						<b>{{scopeController.attributeTypeAttributeCode.tipo}}</b>
					</div>
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.code.length"></s:text>
					</div>
					<div class="qcol-md-1">
						<b>{{scopeController.attributeTypeAttributeCode.precisionint}}</b>
					</div>
					<div class="qcol-md-3"></div>
				</div>
				<div class="frmk-row">&nbsp;</div>
				<div class="qrow" ng-if="scopeController.selectedAttributeType.multilinguaYN != true">
					<div class="qcol-md-2 qtext-right"  >
						<s:text name="attribute.label.code.label"></s:text>
					</div>
					<div class="qcol-md-4">
						<b>{{scopeController.codesLabelsAndHelpersMap._label}}</b>
					</div>
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.code.helper"></s:text>
					</div>
					<div class="qcol-md-4">
						<b>{{scopeController.codesLabelsAndHelpersMap._helper}}</b>
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
								<td><s:text name="attribute.label.code.label"></s:text></td>
								<s:iterator id="language" status="status" value="languages">
									<td><b>{{scopeController.codesLabelsAndHelpersMap.<s:property value="#language"/>_label}}</b></td>
								</s:iterator>
							</tr>
							<tr>
								<td><s:text name="attribute.label.code.helper"></s:text></td>
								<s:iterator id="language" status="status" value="languages">
									<td><b>{{scopeController.codesLabelsAndHelpersMap.<s:property value="#language"/>_helper}}</b></td>
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
					<div class="qcol-md-10">
						<div class="qcol-md-12">
							<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.attributeTypeAttributeCode.ricercaYN" ></i>
							<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.attributeTypeAttributeCode.ricercaYN!=true" ></i>
							<s:text name="attribute.label.useForSearch"></s:text>
						</div>
						<div class="qcol-md-12">
							<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.attributeTypeAttributeCode.autogeneratoYN" ></i>
							<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.attributeTypeAttributeCode.autogeneratoYN!=true" ></i>
							<s:text name="attribute.label.autogen"></s:text>
							<span ng-if="scopeController.attributeTypeAttributeCode.autogenBeanName != null">(<b>{{scopeController.attributeTypeAttributeCode.autogenBeanName}}</b>)</span>
						</div>
					</div>
				</div>
				<div class="frmk-row">&nbsp;</div>
				<div class="frmk-row">&nbsp;</div>
				<div class="qrow" ng-if="scopeController.selectedAttributeType.multilinguaYN != true">
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.descr.label"></s:text>
					</div>
					<div class="qcol-md-4">
						<b>{{scopeController.descrsLabelsAndHelpersMap._label}}</b>
					</div>
					<div class="qcol-md-2 qtext-right">
						<s:text name="attribute.label.descr.helper"></s:text>
					</div>
					<div class="qcol-md-4">
						<b>{{scopeController.descrsLabelsAndHelpersMap._helper}}</b>
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
								<td><s:text name="attribute.label.descr.label"></s:text></td>
								<s:iterator id="language" status="status" value="languages">
									<td><b>{{scopeController.descrsLabelsAndHelpersMap.<s:property value="#language"/>_label}}</b></td>
								</s:iterator>
							</tr>
							<tr>
								<td><s:text name="attribute.label.descr.helper"></s:text></td>
								<s:iterator id="language" status="status" value="languages">
									<td><b>{{scopeController.descrsLabelsAndHelpersMap.<s:property value="#language"/>_helper}}</b></td>
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
					<div class="qcol-md-10">
						<div class="qcol-md-12">
							<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.attributeTypeAttributeDescr.obbligatorioYN" ></i>
							<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.attributeTypeAttributeDescr.obbligatorioYN!=true" ></i>
							<s:text name="attribute.label.descr.mandatory"></s:text>
						</div>
						<div class="qcol-md-12">
							<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.attributeTypeAttributeDescr.ricercaYN" ></i>
							<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.attributeTypeAttributeDescr.ricercaYN!=true" ></i>
							<s:text name="attribute.label.useForSearch"></s:text>
						</div>
						<div class="qcol-md-12">
							<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.attributeTypeAttributeDescr.autogeneratoYN" ></i>
							<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.attributeTypeAttributeDescr.autogeneratoYN!=true" ></i>
							<s:text name="attribute.label.autogen"></s:text>
							<span ng-if="scopeController.attributeTypeAttributeDescr.autogenBeanName != null">(<b>{{scopeController.attributeTypeAttributeDescr.autogenBeanName}}</b>)</span>
						</div>
				</div>
		</div>
	</div>
	<div class="qpanel qpanel-frmk" ng-if="scopeController.attributeList != null && scopeController.attributeList != undefined && scopeController.attributeList.length>0">
		<div class="qpanel-heading">
			<s:text name="attributeType.edit.section2.help"></s:text>
		</div>
		<div class="qpanel-body qpanel-body-frmk">
			<div ng-repeat="attribute in scopeController.attributeList track by $index">
				<div class="qcol-md-12">
					<div class="qcol-md-1" style="padding-left: 2px;">
						<i ng-if="attribute.visibileYN != 1" ng-click="attribute.visibileYN=1" class="fa fa-lg fa-circle text-grey cursor" ></i>
						<i ng-if="attribute.visibileYN == 1" ng-click="attribute.visibileYN=0" class="fa fa-lg fa-check-circle text-framework cursor" ></i>
					</div>
					<div class="qcol-md-11" ng-class="{'frmk-grey-box':attribute.visibileYN!=1,'frmk-box':attribute.visibileYN==1}">
						<div class="qrow" style="margin-left:10px;">
							<div class="frmk-row">&nbsp;</div>
							<div class="qcol-md-2 qtext-right">
								Opzioni
							</div>
							<div class="qcol-md-10">
								<div class="qcol-md-12">
									<i class="fa fa-lg fa-check-square text-framework" ng-if="attribute.obbligatorioYN" ></i>
									<i class="fa fa-lg fa-square text-framework" ng-if="attribute.obbligatorioYN!=true" ></i>
									<s:text name="attribute.label.descr.mandatory"></s:text>
								</div>
								<div class="qcol-md-12">
									<i class="fa fa-lg fa-check-square text-framework" ng-if="attribute.ricercaYN" ></i>
									<i class="fa fa-lg fa-square text-framework" ng-if="attribute.ricercaYN!=true" ></i>
									<s:text name="attribute.label.useForSearch"></s:text>
								</div>
								<div class="qcol-md-12">
									<i class="fa fa-lg fa-check-square text-framework" ng-if="attribute.autogeneratoYN" ></i>
									<i class="fa fa-lg fa-square text-framework" ng-if="attribute.autogeneratoYN!=true" ></i>
									<s:text name="attribute.label.autogen"></s:text>
									<span ng-if="attribute.autogenBeanName!=null">(<b>{{attribute.autogenBeanName}}</b>)</span>
								</div>
							</div>
						</div>
						<div class="frmk-row">&nbsp;</div>
						<div class="qrow" style="margin-left:10px;">
							<div class="qcol-md-2 qtext-right">
								<label><s:text name="attribute.label.code.type"></s:text></label>
							</div>
							<div class="qcol-md-3">
								<b>{{attribute.tipo}}</b>
							</div>
							<div ng-if="attribute.tipo == 'Altro_Attribute'">
								<div class="qcol-md-2">
									<label><s:text name="attribute.label.attribute.type"></s:text></label>
								</div>
								<div class="qcol-md-3">
									<b>{{attribute.tipoattribute}}</b>
								</div>
							</div>
						</div>
						<div class="frmk-row">&nbsp;</div>
						<div class="qrow" style="margin-left:10px;">
							<div class="frmk-row">&nbsp;</div>
							<div ng-if="scopeController.selectedAttributeType.multilinguaYN != true">
								<div class="qcol-md-2 qtext-right">
									<s:text name="attribute.label.attribute.label"></s:text>
								</div>
								<div class="qcol-md-3">
									<b>{{attribute.label}}</b>
								</div>
								<div class="qcol-md-2 qtext-right">
									<s:text name="attribute.label.attribute.helper"></s:text>
								</div>
								<div class="qcol-md-3">
									<b>{{attribute.description}}</b>
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
											<td><s:text name="attribute.label.attribute.label"></s:text></td>
											<s:iterator id="language" status="status" value="languages">
												<td><b>{{scopeController.attributesLabelsMap['<s:property value="#language"/>_'+($index+1)]}}</b></td>
											</s:iterator>
										</tr>
										<tr>
											<td><s:text name="attribute.label.attribute.helper"></s:text></td>
											<s:iterator id="language" status="status" value="languages">
												<td><b>{{scopeController.attributesHelpersMap['<s:property value="#language"/>_'+($index+1)]}}</b></td>
											</s:iterator>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="frmk-row">&nbsp;</div>
						</div>
						<div class="qrow" style="margin-left:10px;">
							<div class="frmk-row">&nbsp;</div>
							<div class="qcol-md-12">
								<div class="qcol-md-2 qtext-right">
									<s:text name="attribute.label.attribute.default"></s:text>
								</div>
								<div class="qcol-md-3">
									<b>{{attribute.defaultValue}}</b>
								</div>
								<div class="qcol-md-7">
								</div>
							</div>
							<div class="frmk-row">&nbsp;</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- {{scopeController.selectedAttributeType | json}} -->
</div>
