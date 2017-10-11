<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
  	<head>
  		<jsp:include page="_head.jsp"></jsp:include>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxJobNotificationController.js?_<jsp:include page='_version.jsp' />"></script>
  	</head>
  	  <body ng-app="framework"> 
  		<div class="frameworkGlobalDiv"> 
  			<jsp:include page="_header.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  		<div class="frameworkRow"  >
		  		<div class="frameworkLeftMenuCell">
					<jsp:include page="_left.jsp">
						<jsp:param name="menuActive" value="JobNotification"/>
					</jsp:include>
				</div>
  				<div class="frameworkMainCell" id="main2" ng-controller="qxJobNotificationController">
  					<form>
  						<!-- SEARCH FILTERS -->
	  					<div class="box box-framework">
	                		<div class="box-header with-border">
	                			<div class="qrow" style="margin: 1px 10px 10px 6px;display: inline-block;" ng-cloak>
									<label for="qt"  class="control-label text-yellow cursor" ng-click="filtriEspansi = !filtriEspansi">
										<span  class="fa fa-filter fa-lg collapse-plus text-framework">
											<i style="font-size: 12px;" ng-show="filtriEspansi != true" class="fa fa-lg fa-plus"></i>
											<i style="font-size: 12px;" ng-show="filtriEspansi == true" class="fa fa-lg fa-minus"></i>
										</span>
									</label>
								</div>
	                  			<h3 class="qh3 box-title">&nbsp;&nbsp;<s:text name="jobNotification.title"/></h3>
	                		</div>
	                		<div class="box-body" ng-show="!filtriEspansi" ng-cloak>
	                			<span class="filterDiv" ng-if="scopeController.jobNotificationSearch.name != null && scopeController.jobNotificationSearch.name != ''">
	                				<s:text name="jobNotification.search.name"/>: <b>{{scopeController.jobNotificationSearch.name}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('name')"></i>
	                			</span>
	                			<span class="filterDiv" ng-if="scopeController.jobNotificationSearch.description != null && scopeController.jobNotificationSearch.description != ''">
	                				<s:text name="jobNotification.search.description"/>: <b>{{scopeController.jobNotificationSearch.description}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('description')"></i>
	                			</span>
	                			<span class="filterDiv" ng-if="scopeController.jobNotificationSearch.datasource != null && scopeController.jobNotificationSearch.datasource != ''">
	                				<s:text name="jobNotification.search.datasource"/>: <b>{{scopeController.jobNotificationSearch.datasource}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('datasource')"></i>
	                			</span>
	                			<span class="filterDiv" ng-if="scopeController.jobNotificationSearch.enableYN != null && scopeController.jobNotificationSearch.enableYN != '' && scopeController.jobNotificationSearch.enableYN != 'A'">
	                				<s:text name="jobNotification.search.enableYN"/>: <b>{{scopeController.jobNotificationSearch.enableYN}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('enableYN')"></i>
	                			</span>
	                		</div>
	                		<div class="box-body qfade " ng-show="filtriEspansi" ng-cloak>
	              				<div class="qrow">
	              					<div class="qcol-xs-12 qcol-md-6">
										<label for="name"><s:text name="jobNotification.search.name"/>:</label>
										<s:textfield ng-model="scopeController.jobNotificationSearch.name" id="name" cssClass="qform-control"></s:textfield>
									</div>
									<div class="qcol-xs-12 qcol-md-6">
										<label for="description"><s:text name="jobNotification.search.description"/>:</label>
										<s:textfield ng-model="scopeController.jobNotificationSearch.description" id="description" cssClass="qform-control"></s:textfield>
									</div>
								</div>
								<div class="qrow">
	              					<div class="qcol-xs-12 qcol-md-6">
										<label for="datasource"><s:text name="jobNotification.search.datasource"/>:</label>
										<s:textfield ng-model="scopeController.jobNotificationSearch.datasource" id="datasource" cssClass="qform-control"></s:textfield>
									</div>
									<div class="qcol-xs-12 qcol-md-6">
										<label for="enableYN"><s:text name="jobNotification.search.enableYN"/>:</label><br>
										<form>
										  <input type="radio" ng-click="scopeController.jobNotificationSearch.enableYN='Y'" name="enableYN" value="Y" ng-checked="scopeController.jobNotificationSearch.enableYN=='Y'"> Si
										  <input type="radio" ng-click="scopeController.jobNotificationSearch.enableYN='N'" name="enableYN" value="N" ng-checked="scopeController.jobNotificationSearch.enableYN=='N'"> No
										  <input type="radio" ng-click="scopeController.jobNotificationSearch.enableYN='A'" name="enableYN" value="A" ng-checked="scopeController.jobNotificationSearch.enableYN=='A'"> Tutti
										</form>
									</div>
								</div>
							</div>
							<div class="box-footer qtext-center" ng-show="filtriEspansi">
								<button ng-click="filtriEspansi = false;search();" class="qbtn btn-framework-color"><i class="fa fa-search"></i>&nbsp;<s:text name="button.search"/></button>
								<button ng-click="resetSearch()" class="qbtn btn-framework-color"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.reset"/></button>
							</div>
	              		</div>
              		</form>
              		<!-- LIST RESULT -->
					<div class="box box-framework" >
						<div class="box-header"  ng-cloak>
							<span ng-if="scopeController.result.list!= null && scopeController.result.list.length > 0"><span class="qbadge bg-framework">{{ scopeController.result.count }}</span>&nbsp;<s:text name="jobNotification.list.resultFound"/></span>
							<div class="qpull-right">
					             <button class="qbtn btn-framework-color" ng-click="create()" type="button"><i class="fa fa-file-o"></i>&nbsp;<s:text name="jobNotification.create" /></button>
							</div>
						</div>
						<div class="box-body qtext-center" ng-if="!(scopeController.result.list!= null && scopeController.result.list.length > 0)" >
				    	  	<s:text name="jobNotification.list.noResults"></s:text>
				    	 </div>
						<div class="box-body" ng-if="scopeController.result.list!= null && scopeController.result.list.length > 0">
							<div class="frmk-row">&nbsp;</div>
							<table class="qtable qtable-hover">
								<thead>
									<tr>
										<th class="qtext-left">&nbsp;</th>
										<th class="qtext-left">
											<s:text name="jobNotification.nameExecNr" />
										</th>
										<th class="qtext-left">
											<s:text name="jobNotification.description" />
										</th>
										<th class="qtext-center">
											<s:text name="jobNotification.enabled" />
										</th>
										<th class="qtext-center">&nbsp;</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat-start="job in scopeController.result.list">
										<td nowrap class=" qtext-center">
											<i class="fa fa-lg fa-plus-circle cursor text-grey" ng-class="{'text-framework':job.showHideRow}" ng-click="job.showHideRow=!job.showHideRow"></i>&nbsp
										</td>
										<td class="qtext-left">	
											{{job.name}} ({{job.execOrder}})
										</td>
										<td class="qtext-left">	
											{{job.description}}
										</td>
										<td class="qtext-center">
											<i class="fa fa-lg fa-check" ng-if="job.enableYN.startsWith('Y')" style="color:green;"></i>
											<i class="fa fa-lg fa-times" ng-if="job.enableYN.startsWith('N')" style="color:red;"></i>
										</td>
										<td class="qtext-right">
											<div class="qbtn-group">
							                     <button class="qbtn btn-framework-color" ng-click="edit(job)" type="button"><i class="fa fa fa-pencil"></i>&nbsp;<s:text name="jobNotification.edit" /></button>
							                     <button data-toggle="qdropdown" class="qbtn btn-framework-color qdropdown-toggle" type="button" aria-expanded="false">
							                       <span class="qcaret"></span>
							                       <span class="qsr-only"></span>
							                     </button>
							                     <ul role="qmenu" class="qdropdown-menu qdropdown-menu-right">
							                       	<li ng-click="deleteJobNotification(job)"><a><i class="fa fa-times"></i>&nbsp;<s:text name="jobNotification.delete" /></a></li>
							                     </ul>
							              	</div>
										</td>
									</tr>
									<tr ng-repeat-end="" ng-if="job.showHideRow">
										<td colspan="1"></td>
										<td colspan="4">
											<table>
												<tr>
													<td class="text-grey"><s:text name="jobNotification.datasource" />:</td>
													<td><b>{{job.datasource}}</b></td>
												</tr>
												<tr>
													<td class="text-grey"><s:text name="jobNotification.querySql" />:</td>
													<td><b>{{job.querySql}}</b></td>
												</tr>
												<tr ng-if="job.postQuerySql != null && job.postQuerySql != ''">
													<td class="text-grey"><s:text name="jobNotification.postQuerySql" />:</td>
													<td><b>{{job.postQuerySql}}</b></td>
												</tr>
												<tr ng-if="job.querySqlAsRSYN != null && job.querySqlAsRSYN != ''">
													<td class="text-grey"><s:text name="jobNotification.querySqlAsRS" />:</td>
													<td>
														<i class="fa fa-lg fa-check" ng-if="job.querySqlAsRSYN.startsWith('Y')" style="color:green;"></i>
														<i class="fa fa-lg fa-times" ng-if="job.querySqlAsRSYN.startsWith('N')" style="color:red;"></i>
													</td>
												</tr>
												<tr ng-if="job.notifyYN != null && job.notifyYN != ''">
													<td class="text-grey"><s:text name="jobNotification.notify" />:</td>
													<td>
														<i class="fa fa-lg fa-check" ng-if="job.notifyYN.startsWith('Y')" style="color:green;"></i>
														<i class="fa fa-lg fa-times" ng-if="job.notifyYN.startsWith('N')" style="color:red;"></i>
													</td>
												</tr>
												<tr ng-if="job.notifyFromRSYN != null && job.notifyFromRSYN != ''">
													<td class="text-grey"><s:text name="jobNotification.notifyFromRS" />:</td>
													<td>
														<i class="fa fa-lg fa-check" ng-if="job.notifyFromRSYN.startsWith('Y')" style="color:green;"></i>
														<i class="fa fa-lg fa-times" ng-if="job.notifyFromRSYN.startsWith('N')" style="color:red;"></i>
													</td>
												</tr>
												<tr ng-if="job.notifyTo != null && job.notifyTo != ''">
													<td class="text-grey"><s:text name="jobNotification.notifyTo" />:</td>
													<td><b>{{job.notifyTo}}</b></td>
												</tr>
												<tr ng-if="job.notifyCc != null && job.notifyCc != ''">
													<td class="text-grey"><s:text name="jobNotification.notifyCc" />:</td>
													<td><b>{{job.notifyCc}}</b></td>
												</tr>
												<tr ng-if="job.notifyBcc != null && job.notifyBcc != ''">
													<td class="text-grey"><s:text name="jobNotification.notifyBcc" />:</td>
													<td><b>{{job.notifyBcc}}</b></td>
												</tr>
												<tr ng-if="job.notifySubject != null && job.notifySubject != ''">
													<td class="text-grey"><s:text name="jobNotification.notifySubject" />:</td>
													<td><b>{{job.notifySubject}}</b></td>
												</tr>
												<tr ng-if="job.notifyReplyTo != null && job.notifyReplyTo != ''">
													<td class="text-grey"><s:text name="jobNotification.notifyReplyTo" />:</td>
													<td><b>{{job.notifyReplyTo}}</b></td>
												</tr>
												<tr ng-if="job.templateFtl != null && job.templateFtl != ''">
													<td class="text-grey"><s:text name="jobNotification.templateFtl" />:</td>
													<td><b>{{job.templateFtl}}</b></td>
												</tr>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
<style>
	.qmodal-lg {
		width: 1200px;
	}
</style>
<script type="text/ng-template" id="editJobNotification.html">
       			<div class="qmodal-header" style="border-bottom: 0px;">
            		<h3 class="qmodal-title"><i class="fa fa-cog"></i>&nbsp;Modifica Job Notification:&nbsp;{{scopeController.jobNotification.name}}</h3>
        		</div>
        		<div class="qmodal-body" style="padding: 10px 10px 10px 10px;">
					<div ng-hide="scopeController.jobNotification.id != null && scopeController.jobNotification.id != ''" class="qrow">
						<div class="qcol-xs-12 qcol-md-6">
							<label for="execOrder"><s:text name="jobNotification.execNr"/></label>
							<s:textfield ng-model="scopeController.jobNotification.execOrder" id="execOrder" cssClass="qform-control qform-control-number"></s:textfield>
						</div>
						<div class="qcol-xs-12 qcol-md-6">
							<label for="name"><s:text name="jobNotification.name"/></label>
							<s:textfield ng-model="scopeController.jobNotification.name" id="name" cssClass="qform-control"></s:textfield>
						</div>
					</div>
					<div style="margin:10px;"></div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-12">
							<label for="name"><s:text name="jobNotification.description"/></label>
							<s:textfield ng-model="scopeController.jobNotification.description" id="description" cssClass="qform-control"></s:textfield>
						</div>
					</div>
					<div style="margin:10px;"></div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-12">
							<label for="datasource"><s:text name="jobNotification.datasource"/>&nbsp;(esempio: java:comp/env/jdbc/framework)</label>
							<s:textfield ng-model="scopeController.jobNotification.datasource" id="datasource" cssClass="qform-control"></s:textfield>
						</div>
					</div>
					<div style="margin:10px;"></div>
					<div class="qrow" >
						<div class="qcol-xs-12 qcol-md-6">
							<i-check id="selectItem" style="cursor:pointer;"  ng-model="scopeController.jobNotification.enableYN"  ynvalue>
								<label for="execOrder" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="jobNotification.enableYN"/>
								</label><br>
							</i-check>
							<i class="fa fa-info-circle" aria-hidden="true" ng-click="scopeController.notify=!scopeController.notify"></i>&nbsp;
							<span ng-show="scopeController.notify"><s:text name="jobNotification.help.notify"/></span>
						</div>
						<div class="qcol-xs-12 qcol-md-6">
							<i-check id="selectItem" style="cursor:pointer;"  ng-model="scopeController.jobNotification.querySqlAsRSYN" ynvalue >
								<label for="querySqlAsRSYN" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="jobNotification.querySqlAsRS"/>
								</label><br>
							</i-check>
							<i class="fa fa-info-circle" aria-hidden="true" ng-click="scopeController.querySqlAsRSYN=!scopeController.querySqlAsRSYN"></i>&nbsp;
							<span ng-show="scopeController.querySqlAsRSYN"><s:text name="jobNotification.help.querySqlAsRSYN"/></span>
						</div>
					</div>
					<div style="margin:10px;"></div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-12">
							<label for="querySql"><s:text name="jobNotification.querySql"/></label>
							<s:textarea ng-model="scopeController.jobNotification.querySql" id="querySql" cssClass="qform-control" style="height:200px;" ></s:textarea>
						</div>
					</div>
					<div style="margin:10px;"></div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-12">
							<label for="postQuerySql"><s:text name="jobNotification.postQuerySql"/>&nbsp;<i class="fa fa-info-circle" aria-hidden="true" ng-click="scopeController.queryPost=!scopeController.queryPost"></i>&nbsp;</label><br>
							<span ng-show="scopeController.queryPost"><s:text name="jobNotification.help.queryPost"/></span>
							<s:textarea ng-model="scopeController.jobNotification.postQuerySql" id="postQuerySql" cssClass="qform-control" style="height:200px;" ></s:textarea>
						</div>
					</div>
					<div style="margin:10px;"></div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-6">
							<i-check id="selectItem" style="cursor:pointer;"  ng-model="scopeController.jobNotification.notifyYN" ynvalue >
								<label for="notifyYN" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="jobNotification.notify"/>
								</label>
								<br>
							</i-check>
							<i class="fa fa-info-circle" aria-hidden="true" ng-click="scopeController.sendMail=!scopeController.sendMail"></i>&nbsp;
							<span ng-show="scopeController.sendMail"><s:text name="jobNotification.help.notify"/></span>
						</div>
						<div class="qcol-xs-12 qcol-md-6">
							<i-check id="selectItem" style="cursor:pointer;"  ng-model="scopeController.jobNotification.notifyFromRSYN"  ynvalue>
								<label for="notifyFromRSYN" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"><s:text name="jobNotification.notifyFromRS"/>
								</label><br>
							</i-check>
							<i class="fa fa-info-circle" aria-hidden="true" ng-click="scopeController.notifyFromRS=!scopeController.notifyFromRS"></i>&nbsp;
							<span ng-show="scopeController.notifyFromRS"><s:text name="jobNotification.help.notifyFromRS"/></span>
						</div>
					</div>
					<div style="margin:10px;"></div>
					<div ng-show="scopeController.jobNotification.notifyFromRSYN == null || scopeController.jobNotification.notifyFromRSYN == '' || scopeController.jobNotification.notifyFromRSYN == 'N'">
						<div class="qrow">
							<div class="qcol-xs-12 qcol-md-6">
								<label for="notifyTo"><s:text name="jobNotification.notifyTo"/></label>
								<s:textfield ng-model="scopeController.jobNotification.notifyTo" id="notifyTo" cssClass="qform-control"></s:textfield>
							</div>
							<div class="qcol-xs-12 qcol-md-6">
								<label for="notifyCc"><s:text name="jobNotification.notifyCc"/></label>
								<s:textfield ng-model="scopeController.jobNotification.notifyCc" id="notifyCc" cssClass="qform-control numberInput"></s:textfield>
							</div>
						</div>
						<div style="margin:10px;"></div>
						<div class="qrow">
							<div class="qcol-xs-12 qcol-md-6">
								<label for="notifyBcc"><s:text name="jobNotification.notifyBcc"/></label>
								<s:textfield ng-model="scopeController.jobNotification.notifyBcc" id="notifyBcc" cssClass="qform-control"></s:textfield>
							</div>
							<div class="qcol-xs-12 qcol-md-6">
								<label for="notifySubject"><s:text name="jobNotification.notifySubject"/></label>
								<s:textfield ng-model="scopeController.jobNotification.notifySubject" id="notifySubject" cssClass="qform-control numberInput"></s:textfield>
							</div>
						</div>
						<div style="margin:10px;"></div>
						<div class="qrow">
							<div class="qcol-xs-12 qcol-md-6">
								<label for="notifyReplyTo"><s:text name="jobNotification.notifyReplyTo"/></label>
								<s:textfield ng-model="scopeController.jobNotification.notifyReplyTo" id="notifyReplyTo" cssClass="qform-control"></s:textfield>
							</div>
							<div class="qcol-xs-12 qcol-md-6"></div>
						</div>
						<div style="margin:10px;"></div>
					</div>
					<div class="qrow">
						<div class="qcol-xs-12 qcol-md-12">
							<label for="templateFtl"><s:text name="jobNotification.templateFtl"/></label>
							<s:textarea ng-model="scopeController.jobNotification.templateFtl" id="templateFtl" cssClass="qform-control" style="height:200px;" ></s:textarea>
						</div>
					</div>
					<div style="margin:10px;"></div>
        		</div>
        		<div class="qmodal-footer">
					<button class="qbtn btn-framework-color" type="button" ng-click="save()"><i class="fa fa-floppy-o"></i>&nbsp;<s:text name="button.salve" /></button>
            		<button class="qbtn btn-framework-color" type="button" ng-click="cancel()"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.cancel" /></button>
        		</div>
</script>