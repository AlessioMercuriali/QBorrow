<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
  	<head>
  		<jsp:include page="_head.jsp"></jsp:include>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxHomeController.js?_<jsp:include page='_version.jsp' />"></script>
  	</head>
  	<body ng-app="framework"> 
  		<div class="frameworkGlobalDiv"> 
  			<jsp:include page="_header.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  		<div class="frameworkRow"  >
		  		<div class="frameworkLeftMenuCell">
					<jsp:include page="_left.jsp">
						<jsp:param name="menuActive" value="Home"/>
					</jsp:include>
				</div>
  				<div class="frameworkMainCell" id="main2"  ng-controller="qxHomeController">
 
  						
				  	<div class="qcol-md-9">
				  		<div class="qcol-md-12 box box-framework">
						  	<div class="qcol-md-9" >
								<div class="box-header with-border home-box-header">
									<h3 class="qh3 box-title"><s:text name="home.thisContext"/> 
									</h3>
								</div>
								<div class="box-body" >
									 <div class="qcol-md-12">
									 
									 	<s:url id="configUrl" namespace="/framework" action="config" escapeAmp="false" includeParams="none">
											<s:param name="task">mainPage</s:param>
										</s:url>
									 	<div style="display: inline-block; overflow: hidden;"  ng-if="scopeController.configNumber != null">
									 	 	<a href="<s:property value="#configUrl" escape="false" />">
												<div class="widget info-bg p-lg text-center">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa fa-wrench fa-3x "></i>
							                            <h2 class="m-xs">{{scopeController.configNumber}}  Config</h2>
							                            <small>number</small>
							                        </div>
							                    </div>
						                    </a>
						                </div>
						                <s:url id="attributeUrl" namespace="/framework" action="attributeType" escapeAmp="false" includeParams="none">
											<s:param name="task">mainPage</s:param>
										</s:url>
						                <div style="display: inline-block; overflow: hidden;"  ng-if="scopeController.attributeNumber != null">
											<a href="<s:property value="#attributeUrl" escape="false" />">
												<div class="widget info-bg p-lg text-center">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa fa-list fa-3x "></i>
							                            <h2 class="m-xs" style="white-space: nowrap;">{{scopeController.attributeNumber}}  Attribute</h2>
							                            <small>number</small>
							                        </div>
							                    </div>
							               	</a>
						                </div>
						                <s:url id="jobUrl" namespace="/framework" action="job" escapeAmp="false" includeParams="none">
											<s:param name="task">mainPage</s:param>
										</s:url>
										<div style="display: inline-block; overflow: hidden;"  ng-if="scopeController.jobNumber != null">
											<a href="<s:property value="#jobUrl" escape="false" />">
												<div class="widget info-bg p-lg text-center">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa fa-cog fa-3x "></i>
							                            <h2 class="m-xs" style="white-space: nowrap;">{{scopeController.jobNumber}}  Job</h2>
							                            <small>number</small>
							                        </div>
							                    </div>
							                </a>
						                 </div>
									 	<s:url id="lockUrl" namespace="/framework" action="lock" escapeAmp="false" includeParams="none">
											<s:param name="task">mainPage</s:param>
										</s:url>
						                <div style="display: inline-block; overflow: hidden;"  ng-if="scopeController.lockNumber != null">
											<a href="<s:property value="#lockUrl" escape="false" />">
												<div class="widget info-bg p-lg text-center">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa fa-lock fa-3x "></i>
							                            <h2 class="m-xs" style="white-space: nowrap;">{{scopeController.lockNumber}}  Lock</h2>
							                            <small>number</small>
							                        </div>
							                    </div>
							               	</a>
						                 </div>
						                 <s:url id="labelUrl" namespace="/framework" action="label" escapeAmp="false" includeParams="none">
											<s:param name="task">mainPage</s:param>
										 </s:url>
						                 <div style="display: inline-block; overflow: hidden;"  ng-if="scopeController.labelNumber != null">
											<a href="<s:property value="#labelUrl" escape="false" />">
												<div class="widget info-bg p-lg text-center">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa fa-tag fa-3x "></i>
							                            <h2 class="m-xs" style="white-space: nowrap;">{{scopeController.labelNumber}}  Label</h2>
							                            <small>number</small>
							                        </div>
							                    </div>
							                </a>
						                 </div>
						                 <s:url id="exceptionUrl" namespace="/framework" action="exceptionLog" escapeAmp="false" includeParams="none">
											<s:param name="task">mainPage</s:param>
										 </s:url>
										<div style="display: inline-block; overflow: hidden;"  ng-if="scopeController.exceptionNumber != null">
											<a href="<s:property value="#exceptionUrl" escape="false" />">
												<div class="widget info-bg p-lg text-center">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa fa-times-circle fa-3x "></i>
							                            <h2 class="m-xs" style="white-space: nowrap;">{{scopeController.exceptionNumber}}  Exception</h2>
							                            <small>number</small>
							                        </div>
							                    </div>
							                </a>
						                 </div>
						                 <s:url id="jobNotificationUrl" namespace="/framework" action="jobNotification" escapeAmp="false" includeParams="none">
											<s:param name="task">mainPage</s:param>
										</s:url>
						                 <div style="display: inline-block; overflow: hidden;"  ng-if="scopeController.jobNotificationNumber != null">
											<a href="<s:property value="#jobNotificationUrl" escape="false" />">
												<div class="widget info-bg p-lg text-center">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa fa-bell fa-3x "></i>
							                            <h2 class="m-xs" style="white-space: nowrap;">{{scopeController.jobNotificationNumber}} Scheduled Notification</h2>
							                            <small>number</small>
							                        </div>
							                    </div>
							                </a>
						                 </div>
						                 <s:url id="templateUrl" namespace="/framework" action="template" escapeAmp="false" includeParams="none">
											<s:param name="task">mainPage</s:param>
										</s:url>
						                 <div style="display: inline-block; overflow: hidden;"  ng-if="scopeController.templateNumber != null">
											<a href="<s:property value="#templateUrl" escape="false" />">
												<div class="widget info-bg p-lg text-center">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa fa-envelope fa-3x "></i>
							                            <h2 class="m-xs" style="white-space: nowrap;">{{scopeController.templateNumber}} Template</h2>
							                            <small>number</small>
							                        </div>
							                    </div>
							                </a>
						                 </div>
						                 
						             </div>
							         <div class="qcol-md-12 ">
							                 <div style="display: inline-block; overflow: hidden;"  >
												<div class="widget  p-lg text-center" ng-class="{'active-bg':scopeController.schedulerActive,'inactive-bg':scopeController.schedulerActive!= true }">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa  fa-3x " ng-class="{'fa-lightbulb-o':scopeController.schedulerActive,'fa-power-off':scopeController.schedulerActive!= true }"></i><i ng-if="scopeController.schedulerActive" class="fa fa-cog fa-spin"></i>
							                            <h2 class="m-xs">Scheduler</h2>
							                            <small ng-if="scopeController.schedulerActive">active</small>
							                            <small ng-if="scopeController.schedulerActive != true">not active</small>
							                        </div>
							                    </div>
							                 </div>
							                 <div style="display: inline-block; overflow: hidden;" >
												<div class="widget  p-lg text-center" ng-class="{'active-bg':scopeController.jobActive,'inactive-bg':scopeController.jobActive!= true }">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa  fa-3x " ng-class="{'fa-lightbulb-o':scopeController.jobActive,'fa-power-off':scopeController.jobActive!= true }"></i><i ng-if="scopeController.jobActive" class="fa fa-cog fa-spin"></i>
							                            <h2 class="m-xs">Job Filter</h2>
							                            <small ng-if="scopeController.jobActive">active</small>
							                            <small ng-if="scopeController.jobActive != true">not active</small>
							                        </div>
							                    </div>
							                 </div>
							                  <div style="display: inline-block; overflow: hidden;"  >
												<div class="widget  p-lg text-center" ng-class="{'active-bg':scopeController.labelActive,'inactive-bg':scopeController.labelActive!= true }">
							                        <div class="m-b-md qtext-center">
							                            <i class="fa  fa-3x " ng-class="{'fa-lightbulb-o':scopeController.labelActive,'fa-power-off':scopeController.labelActive!= true }"></i><i ng-if="scopeController.labelActive" class="fa fa-cog fa-spin"></i>
							                            <h2 class="m-xs">Label</h2>
							                            <small ng-if="scopeController.labelActive">active</small>
							                            <small ng-if="scopeController.labelActive != true">not active</small>
							                        </div>
							                    </div>
							                 </div>
						              	</div>
						              	<div class="frmk-row">&nbsp;</div>
						              	<div class="qcol-md-12">
						              		<div class="qcol-md-2">
						              			<button class="qbtn btn-framework-color" type="button" ng-click="checkSystem()"><i class="fa fa-cogs" ng-class="{'fa-spin':scopeController.checkSystemSpin}"></i>&nbsp;Check System</button>
						              		</div>
						              	</div>
						              	<div class="qrow qtext-center" style="margin-top:20px;color:rgb(51, 51, 51);" ng-show="scopeController.checkSystemSpin">
				  							<i class="fa fa-2x fa-cogs fa-spin"></i>
				  						</div>
				  						<div class="frmk-row">&nbsp;</div>
						              	<div class="qcol-md-12">
						  					<div ng-repeat="msg in scopeController.warnMessage track by $index">
						  						<p class="qbg-warning text-warning framework-alert-box">
												  	<strong>
												  		<span class="fa-stack fa-lg">
												  			<i class="fa fa-exclamation-triangle fa-2x icon-warning"></i>
												  		</span><s:text name="info.msg.warn"></s:text>!&nbsp;
												  	 </strong>
												  	 {{msg.description}}
												</p>  
											</div>
											<div ng-repeat="msg in scopeController.errorMessage track by $index">
						  						<p class="qbg-danger qtext-danger framework-alert-box">
												  	<strong>
												  		<span class="fa-stack fa-lg">
														  	<i class="fa fa-circle fa-stack-2x"></i>
																	<i class="fa fa-times fa-stack-1x fa-inverse"></i>
														</span> <s:text name="info.msg.error"></s:text>!&nbsp;
													</strong>
													<span>{{msg.description}}
												</p>  
											</div>
						  				</div>
						              	
								</div>
							</div>
							<div class="qcol-md-3" style="margin-top: 28px;" ng-if="scopeController.databaseVersion!= null && scopeController.databaseVersion.length>0">
								<table class="qtable qtable-hover" >
									<thead>
										<tr>
											<th class="qtext-left">Script</th>
											<th class="qtext-left">Versione</th>
											<th class="qtext-center">&nbsp;</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="script in scopeController.databaseVersion track by $index">
											<td class="qtext-left">{{script.name}}</td>
											<td class="qtext-left">{{script.version}}</td>
											<td class="qtext-center"><i ng-click="getScriptList(script.beanName)" class="fa fa-database cursor text-grey"></i></td>
										</tr>
										<tr>{{script|json}}</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="qcol-md-3">
					  	<div class="box box-framework" >
							<div class="box-header with-border home-box-header">
								<h3 class="qh3 box-title"><s:text name="home.allContext"/> 
									
								</h3>
							</div>
							<div class="box-body" >
								<table class="qtable qtable-hover" >
									<thead>
										<tr>
											<th class="qtext-left">Script</th>
											<th class="qtext-left">Versione</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="info in scopeController.frameworkInfo">
											<td class="qtext-left">{{info.description}}</td>
											<td class="qtext-left">{{info.value}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<script type="text/ng-template" id="script.html">
      					<div class="qmodal-header" style="border-bottom: 0px;">
     					   <h3 class="qmodal-title">
							 <i class="fa fa-lg fa-database grey"></i>&nbsp;<s:text name="home.script.title" />
	  					  </h3>
     					 </div>
      					<div class="qmodal-body" style="padding: 0px 0px 10px 0px;">
							<div class="qtable-responsive"> 
 							 <table class="qtable qtable-bordered" style="width: 100%;">
	    						<tr>
	    							<th>&nbsp;</th>
	    							<th><s:text name="db.versionRank"/></th>
	    							<th><s:text name="db.installedRank"/></th>
	    							<th><s:text name="db.version"/></th>
	    							<th><s:text name="db.description"/></th>
	    							<th><s:text name="db.type"/></th>
	    							<th><s:text name="db.script"/></th>
	    							<th><s:text name="db.checksum"/></th>
	    							<th><s:text name="db.installedBy"/></th>
	    							<th><s:text name="db.installedOn"/></th>
	    							<th><s:text name="db.executionTime"/></th>
	    						</tr>
	    						<tr ng-repeat="db in scopeController.migrationInfo | pagination: (curPage - 1) * pageSize | limitTo: pageSize">
	    							<td class="qtext-center" style="vertical-align: middle;">
	    								<i class="fa fa-check fa-2x" ng-show="db.success && db.checksum==db.actualChecksum" style="color: green;"></i>
	    								<i class="fa fa-times fa-2x" ng-show="!db.success && db.checksum==db.actualChecksum" style="color: red;"></i>
	    								<i class="fa fa-refresh fa-2x" ng-show="db.checksum!=db.actualChecksum" style="color: orange; cursor: pointer;" ng-click="updateDbChecksum(db)"></i>
	    							</td>
	    							<td>{{db.versionRank}}</td>
	    							<td>{{db.installedRank}}</td>
	    							<td>{{db.version}}</td>
	    							<td>{{db.description}}</td>
	    							<td>{{db.type}}</td>
	    							<td>{{db.script}}</td>
	    							<td>{{db.checksum}}</td>
	    							<td>{{db.installedBy}}</td>
	    							<td>{{db.installedOn}}</td>
	    							<td>{{db.executionTime}}</td>
	    		
	    						</tr>
	    					 </table>	
							</div>
							<div class="qtext-center" style="margin-top: 0px; margin-bottom: 0px;">
    							<pagination ng-model="curPage" total-items="migrationInfo.length" items-per-page="pageSize" max-size="5" direction-links="false" boundary-links="true" first-text="«" last-text="»" rotate="false"/>				
							</div>
      					</div>
      					<div class="qmodal-footer">
							<button class="qbtn btn-framework-color" type="button" ng-click="closeModal()"><i class="fa fa-check"></i>&nbsp;<s:text name="button.ok" /></button>
      					</div>
					</script>
  				</div>
			</div>
   			<script type="text/ng-template" id="modalUpdateLabel.html"><jsp:include page="_modalUpdateLabel.jsp" /></script>
  		 	<jsp:include page="_footer.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  	</div>	
  	</body>
</html>
