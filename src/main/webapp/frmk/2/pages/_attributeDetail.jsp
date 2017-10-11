<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<i class="fa fa-arrow-left text-framework cursor" ng-click="scopeController.selectedPage='attribute'"></i>
<div class="box box-framework" >
	<div class="box-header with-border">
		<h3 class="qh3 box-title"><i class="fa fa-search"></i>
			{{scopeController.selectedAttribute.code}}
		</h3>
		<div class="help-alert" style="font-style:italic">{{scopeController.selectedAttribute.description}}</div>
	</div>
	<div class="box-body">
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				{{scopeController.labelsAndHelpersAttributes.CODE_LABEL}}
			</div>
			<div class="qcol-md-4">
				<b>{{scopeController.selectedAttribute.code}}</b>
			</div>
			<div class="qcol-md-4">
				{{scopeController.labelsAndHelpersAttributes.CODE_HELPER}}
			</div>
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				{{scopeController.labelsAndHelpersAttributes.DESCR_LABEL}}
			</div>
			<div class="qcol-md-4">
				<b>{{scopeController.selectedAttribute.description}}</b>
			</div>
			<div class="qcol-md-4">
				{{scopeController.labelsAndHelpersAttributes.DESCR_HELPER}}
			</div>
		</div>
		<div class="frmk-row">&nbsp;</div>
		
		<div  ng-if="scopeController.selectedAttributeType.multilinguaYN!=true">
			<div class="qrow">
				<div class="qcol-md-2 qtext-right">
					<label><s:text name="attribute.label.descr"></s:text></label>
				</div>
				<div class="qcol-md-4">
					<b>{{scopeController.selectedAttribute.description}}</b>
				</div>
			</div>
			<div class="frmk-row">&nbsp;</div>
		</div>
		
		<div  ng-if="scopeController.selectedAttributeType.ordinabileYN">
			<div class="qrow">
				<div class="qcol-md-2 qtext-right" >
					<s:text name="attribute.label.sort"></s:text>
				</div>
				<div class="qcol-md-4">
					<b>{{scopeController.selectedAttribute.ordinamento}}</b>
				</div>
			</div>
			<div class="frmk-row">&nbsp;</div>
		</div>
		<!--  -->
		
		<div ng-if="scopeController.selectedAttributeType.multisocietaYN"> 
			<div class="qrow">
				<div class="qcol-md-2 qtext-right">
					<s:text name="attribute.label.company"></s:text>
				</div>
				<div class="qcol-md-4">
					<b>{{scopeController.selectedAttribute.organization.code}}</b>
				</div>
			</div>
			<div class="frmk-row">&nbsp;</div>
		</div>
		
		<div class="qrow" ng-repeat="attrTypeAttr in scopeController.attributeTypeAttributes">
			<div class="qcol-md-2 qtext-right">
				{{scopeController.labelsAndHelpersAttributes['ATT'+($index+1)+'_LABEL']}}&nbsp;
			</div>
			<div  ng-if="attrTypeAttr.tipo != 'Vero_Falso' && attrTypeAttr.tipo != 'Color_Picker'">
				<div class="qcol-md-4">
					<b>{{scopeController.selectedAttribute['attribute'+($index+1)]}}</b>
				</div>
			</div>
			<div ng-if="attrTypeAttr.tipo == 'Vero_Falso'">
				<div class="qcol-md-4">
					<i class="fa fa-lg fa-check-square text-framework" ng-if="scopeController.selectedAttribute['attribute'+($index+1)]" ></i>
					<i class="fa fa-lg fa-square text-framework" ng-if="scopeController.selectedAttribute['attribute'+($index+1)]!=true" ></i>
				</div>
			</div>
			<div ng-if="attrTypeAttr.tipo == 'Color_Picker'">
				<div class="qcol-md-4">
					<span class="fa fa-paint-brush" style="background-color:{{scopeController.selectedAttribute['attribute'+($index+1)]}}"></span>
				</div>
			</div>
			<div class="qcol-md-4">
				{{scopeController.labelsAndHelpersAttributes['ATT'+($index+1)+'_HELPER']}}
			</div>
		</div>
		
		
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow" ng-if="scopeController.selectedAttributeType.multilinguaYN">
			<table class="qtable qtable-hover">
				<tbody>
					<tr>
       	 				<th class="qcol-md-2 qtext-center">&nbsp;</th>
       	 				<s:iterator id="language" status="status" value="languages">
       	 					<th class="qcol-md-2 qtext-center"><s:property value="#language"></s:property></th>
       	 				</s:iterator>
					</tr>
					<tr>
						<td class="qcol-md-2 qtext-center">&nbsp;<s:text name="attribute.label.descr"></s:text></td>
						<s:iterator id="language" status="status" value="languages">
							<td class="qcol-md-2 qtext-center"><b>{{scopeController.descriptionInLanguage.<s:property value="#language"/>}}</b></td>
						</s:iterator>
					</tr>
				
				</tbody>
			</table>
		</div>
		<div class="frmk-row">&nbsp;</div>
	</div>
</div>