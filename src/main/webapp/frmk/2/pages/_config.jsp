<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String scope = request.getParameter("scope");
	if(scope == null) {
		scope = "";
	}
%>

	<table class="qtable qtable-hover" >
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th style="text-align: left;"><s:text name="config.code" /></th>
				<th style="text-align: left;"><s:text name="config.value" /></th>
				<th>&nbsp;</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="row4 in <%=scope %>resultConfig.list">
				<td style="vertical-align: middle;">
					<i-check id="selectItem" style="cursor:pointer;"  ng-model="row4.select" ng-click="addToExportList(row4)" >
						<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"></label>
					</i-check>
				</td>
				<td>{{row4.code}}
					<input type="hidden" id="{{row4.code}}" name="{{row4.code}}" ng-model="row4.code">
					<div ng-messages="forms.configForm[row4.code].$error" role="alert" class="qhas-error-config">
					  	<div ng-message="configNotFilled"><s:text name="error.config.noConfigPresent"></s:text></div>
					  	<div ng-message="config.clusterNotConfigured "><s:text name="error.config.clusterNotConfigured"></s:text></div>                 
						<div ng-message="config.duplicateConfig"><s:text name="error.config.duplicateConfig"></s:text></div>                      
						<div ng-message="config.duplicateConfigCluster"><s:text name="error.config.duplicateConfigCluster"></s:text></div>              
						<div ng-message="config.duplicateConfigClusterCompany "><s:text name="error.config.duplicateConfigClusterCompany"></s:text></div>        
						<div ng-message="config.duplicateConfigCompany"><s:text name="error.config.duplicateConfigCompany"></s:text></div>               
						<div ng-message="config.duplicateConfigMap"><s:text name="error.config.duplicateConfigMap"></s:text></div>                   
						<div ng-message="config.duplicateConfigMapCluster"><s:text name="error.config.duplicateConfigMapCluster"></s:text></div>            
						<div ng-message="config.duplicateConfigMapClusterCompany"><s:text name="error.config.duplicateConfigMapClusterCompany"></s:text></div>     
						<div ng-message="config.duplicateConfigMapCompany "><s:text name="error.config.duplicateConfigMapCompany"></s:text></div>            
						<div ng-message="config.duplicateConfigMultiple"><s:text name="error.config.duplicateConfigMultiple"></s:text></div>              
						<div ng-message="config.duplicateConfigMultipleCluster"><s:text name="error.config.duplicateConfigMultipleCluster"></s:text></div>       
						<div ng-message="config.duplicateConfigMultipleClusterCompany"><s:text name="error.config.duplicateConfigMultipleClusterCompany"></s:text></div>
						<div ng-message="config.duplicateConfigMultipleCompany"><s:text name="error.config.duplicateConfigMultipleCompany"></s:text></div>       
						<div ng-message="config.formatBoolean"><s:text name="error.config.formatBoolean"></s:text></div>                        
						<div ng-message="config.formatDate"><s:text name="error.config.formatDate"></s:text></div>                           
						<div ng-message="config.formatDateTime"><s:text name="error.config.formatDateTime"></s:text></div>                       
						<div ng-message="config.formatDecimal"><s:text name="error.config.formatDecimal"></s:text></div>                        
						<div ng-message="config.formatInteger"><s:text name="error.config.formatInteger"></s:text></div>                        
						<div ng-message="config.formatMail"><s:text name="error.config.formatMail"></s:text></div>                           
						<div ng-message="config.formatSysAttribute"><s:text name="error.config.formatSysAttribute"></s:text></div>                   
						<div ng-message="config.formatTime"><s:text name="error.config.formatTime"></s:text></div>                           
						<div ng-message="config.formatURL"><s:text name="error.config.formatURL"></s:text></div> 
						<div ng-message="ifDuplicate"><s:text name="error.ifDuplicate"></s:text></div>                                
						<div ng-message="ifDuplicateCompany"><s:text name="error.ifDuplicateCompany"></s:text></div>                         
						<div ng-message="ifDuplicateKeyMap"><s:text name="error.ifDuplicateKeyMap"></s:text></div>                          
						<div ng-message="ifDuplicateNodeName"><s:text name="error.ifDuplicateNodeName"></s:text></div>                        
						<div ng-message="ifMapYNInsertMapKey"><s:text name="error.ifMapYNInsertMapKey"></s:text></div>                        
						<div ng-message="ifMapYNNoPosition"><s:text name="error.ifMapYNNoPosition"></s:text></div>                          
						<div ng-message="ifMultipleNoMap"><s:text name="error.ifMultipleNoMap"></s:text></div>                            
						<div ng-message="ifMultipleYNInsertPosition"><s:text name="error.ifMultipleYNInsertPosition"></s:text></div>                 
						<div ng-message="ifMultipleYNNoMapKey"><s:text name="error.ifMultipleYNNoMapKey"></s:text></div>                       
						<div ng-message="ifNoMapYNNoMapKey"><s:text name="error.ifNoMapYNNoMapKey"></s:text></div>                          
						<div ng-message="ifNoMultipleYNNoPosition"><s:text name="error.ifNoMultipleYNNoPosition"></s:text></div>                   
						<div ng-message="ifNotClusterYNNoNodeName"><s:text name="error.ifNotClusterYNNoNodeName"></s:text></div> 
					</div>
				</td>
		
				<td>
					<div ng-show="row4.clusterYN" ng-repeat="cluster in scopeController.clusterList">
						<div style="font-weight:bold;">{{cluster}}:</div>
						<div ng-show="row4.companyYN" ng-repeat="company in scopeController.companyList">
							<div style="font-style:italic;">{{company}}:</div>
							<div ng-repeat="config in row4.configList | filter:{'company': company, 'nodeName': cluster}">
								<span ng-show="row4.multipleYN">
									{{config.position}}&nbsp;-
								</span>
								<span ng-show="row4.mapYN">
									{{config.mapKey}}&nbsp;-
								</span>
								{{config.value}}
							</div>
						</div>
						<div ng-hide="row4.companyYN" ng-repeat="config in row4.configList | filter:cluster ">
							<span ng-show="row4.multipleYN">
								{{config.position}}&nbsp;-
							</span>
							<span ng-show="row4.mapYN">
								{{config.mapKey}}&nbsp;-
							</span>
							{{config.value}}
						</div>
					</div>
					<div ng-hide="row4.clusterYN">
						<div ng-show="row4.companyYN" ng-repeat="company in scopeController.companyList">
							<div style="font-style:italic;">{{company}}:</div>
							<div ng-repeat="config in row4.configList | filter:{'company': company}">
								<span ng-show="row4.multipleYN">
									{{config.position}}&nbsp;-
								</span>
								<span ng-show="row4.mapYN">
									{{config.mapKey}}&nbsp;-
								</span>
								{{config.value}}
							</div>
						</div>
						<div ng-hide="row4.companyYN" ng-repeat="config in row4.configList">
							<span ng-show="row4.multipleYN">
								{{config.position}}&nbsp;-
							</span>
							<span ng-show="row4.mapYN">
								{{config.mapKey}}&nbsp;-
							</span>
							{{config.value}}
						</div>
					</div>
				</td>
		
				<td class="qtext-right">
					<div class="qbtn-group" ng-hide="scopeController.hideConfigAdvancedOperation">
	                     <button class="qbtn btn-framework-color" ng-click="editConfig(row4)" type="button"><i class="fa fa-list"></i>&nbsp;<s:text name="configMetadata.image.editValues" /></button>
	                     <button data-toggle="qdropdown" class="qbtn btn-framework-color qdropdown-toggle" type="button" aria-expanded="false">
	                       <span class="qcaret"></span>
	                       <span class="qsr-only"></span>
	                     </button>
	                     <ul role="qmenu" class="qdropdown-menu qdropdown-menu-right">
	                       	<li ng-click="edit(row4)"><a><i class="fa fa-pencil"></i>&nbsp;<s:text name="configMetadata.image.edit" /></a></li>
	                       	<li ng-click="deleteConfigMetadata(row4)"><a><i class="fa fa-times"></i>&nbsp;<s:text name="configMetadata.image.delete" /></a></li>
	                     </ul>
	              	</div>
	              	 <button ng-show="scopeController.hideConfigAdvancedOperation" class="qbtn btn-framework-color" ng-click="editConfig(row4)" type="button"><i class="fa fa-list"></i>&nbsp;<s:text name="configMetadata.image.editValues" /></button>
	                    
				</td>
			</tr>
		</tbody>
	</table>
