<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
              		
<div class="box box-framework" cg-busy="{promise: scopeController.promise}" ng-cloak>
	<div class="box-body qtext-center" ng-if="!(scopeController.result.count!= null && scopeController.result.count>0)" >
		<s:text name="label.noResult"></s:text>
	</div>
	<div class="box-header" ng-if="scopeController.result.count!= null && scopeController.result.count>0" >
		<span>
			<span class="qbadge bg-framework">{{ scopeController.result.count }}</span>&nbsp;
			<s:text name="label.resultFound"/>
		</span>
	</div>
	<div class="box-header">
		<!-- aggiungere un if nel caso in cui si decida di non utilizzarlo per nascondere i pulsanti ? -->
		<div class="qpull-right">
			<button class="qbtn btn-framework-color qpull-right" ng-click="createLabel()" type="button">
				<i class="fa fa-plus"></i>&nbsp;<s:text name="label.btn.new"></s:text>
			</button>
			&nbsp;<span class="fa fa-lg fa-download text-grey cursor qpull-right" title="Export Excel" ng-click="createExcel()" style="margin-top: 10px;margin-right:5px;"></span>
			&nbsp;<span class="fa fa-lg fa-upload text-grey cursor qpull-right" ng-click="openPopupImportExcel()" title="Import Excel" style="margin-top: 10px;margin-right:5px;"></span>
			&nbsp;<span title="<s:text name="label.image.emptyAllCache" />" ng-click="resetLabelCache()" class="fa fa-lg fa-history text-grey cursor qpull-right" style="margin-top: 10px;margin-right:5px;"></span>
		</div>
	</div>
	<form name="forms.labelForm">
		<div class="box-body" id="labelTab" ng-cloak>
				<!-- SEZIONE TAB APPLICATIONS-->
				<tabset >
					<tab ng-repeat="application in scopeController.applicationList" ng-click="listOrganization(application.applicationName);">
					 	<tab-heading>
					     	{{ application.applicationName }}&nbsp;
					     	<span class="qbadge bg-framework">{{ application.countLabel }}</span>
					    </tab-heading>  
					    <!-- SEZIONE TAB ORGANIZATIONS-->
					    <tabset >
							<tab ng-repeat="organization in scopeController.organizationList" ng-click="listLabel(application.applicationName, organization.organizationName);">
							 	<tab-heading>
							     	{{ organization.organizationName }}&nbsp;
							     	<span class="qbadge bg-framework">{{ organization.countLabel }}</span>
							    </tab-heading>  
							    <!-- SEZIONE LISTA LABEL-->
							    <div class="scheduler-border">
							    	<jsp:include page="_labelList.jsp"></jsp:include>
							    </div>
							</tab>
						</tabset>
					</tab>
					
				</tabset>
		</div>
		<div class="box-footer qtext-center" ng-if="scopeController.result.count!= null && scopeController.result.count>0">
		 	<button ng-click="saveLabelList()" class="qbtn btn-framework-color"><i class="fa fa-floppy-o"></i>&nbsp;<s:text name="button.save"/></button> 
		</div>
	</form>
</div>		
			    		
  				