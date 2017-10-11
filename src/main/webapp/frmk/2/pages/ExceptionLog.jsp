<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
  	<head>
  		<jsp:include page="_head.jsp"></jsp:include>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxExceptionLogController.js?_<jsp:include page='_version.jsp' />"></script>
  	</head>
  	<body ng-app="framework"> 
  		<div class="frameworkGlobalDiv"> 
  			<jsp:include page="_header.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  		<div class="frameworkRow"  >
		  		<div class="frameworkLeftMenuCell">
					<jsp:include page="_left.jsp">
						<jsp:param name="menuActive" value="Exception"/>
					</jsp:include>
				</div>
  				<div class="frameworkMainCell" id="main2" ng-controller="qxExceptionLogController">
  		
  					<form>
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
	                  			<h3 class="qh3 box-title">&nbsp;&nbsp;<s:text name="exceptionLogList.title"/></h3>
	                		</div>
	                		<div class="box-body" ng-show="!filtriEspansi" ng-cloak>
	                			<span class="filterDiv" ng-if="scopeController.search.contextName != null && scopeController.search.contextName != ''">
	                				<s:text name="exceptionLogList.search.contextName"/>: <b>{{scopeController.search.contextName}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('contextName')"></i>
	                			</span>
	                			<span class="filterDiv" ng-if="scopeController.search.progressive != null && scopeController.search.progressive != ''">
	                				<s:text name="exceptionLogList.search.progressive"/>: <b>{{scopeController.search.progressive}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('progressive')"></i>
	                			</span>
	                			<span class="filterDiv" ng-if="scopeController.search.dateAndTimeFrom != null && scopeController.search.dateAndTimeFrom != ''">
	                				<s:text name="exceptionLogList.search.dateAndTimeFrom"/>: <b>{{scopeController.search.dateAndTimeFrom | date:"<s:text name="format.date4" />"}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('dateAndTimeFrom')"></i>
	                			</span>
	                			<span class="filterDiv" ng-if="scopeController.search.dateAndTimeTo != null && scopeController.search.dateAndTimeTo != ''">
	                				<s:text name="exceptionLogList.search.dateAndTimeTo"/>: <b>{{scopeController.search.dateAndTimeTo | date:"<s:text name="format.date4" />"}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('dateAndTimeTo')"></i>
	                			</span>
	                			<span class="filterDiv" ng-if="scopeController.search.message != null && scopeController.search.message != ''">
	                				<s:text name="exceptionLogList.search.message"/>: <b>{{scopeController.search.message}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('message')"></i>
	                			</span>
	                			<span class="filterDiv" ng-if="scopeController.search.applicationUser != null && scopeController.search.applicationUser != ''">
	                				<s:text name="exceptionLogList.search.applicationUser"/>: <b>{{scopeController.search.applicationUser}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('applicationUser')"></i>
	                			</span>
	                		</div>
	                		<div class="box-body qfade " ng-show="filtriEspansi" ng-cloak>
	                		
	                			
	              				<div class="qrow">
	              					<div class="qcol-xs-12 qcol-md-6">
										<label for="contextName"><s:text name="exceptionLogList.search.contextName"/>:</label>
										<s:textfield ng-model="scopeController.search.contextName" id="contextName" cssClass="qform-control"></s:textfield>
									</div>
									<div class="qcol-xs-12 qcol-md-6">
										<label for="progressive"><s:text name="exceptionLogList.search.progressive"/>:</label>
										<s:textfield ng-model="scopeController.search.progressive" id="progressive" cssClass="qform-control qform-control-number"></s:textfield>
									</div>
									
								</div>
								<div class="qrow">
									<div class="qcol-xs-6 qcol-md-3">
										<label for="dateAndTimeFrom"><s:text name="exceptionLogList.search.dateAndTimeFrom"/>:</label>
										<div class="qinput-group">
							              <input type="text" class="qform-control" datepicker-popup="dd/MM/yyyy" 
											ng-model="scopeController.search.dateAndTimeFrom" 
											is-open="dateAndTimeFrom.opened" datepicker-options="dateOptions" close-text="Close" />
							              <span class="qinput-group-btn">
							                <button type="button" class="qbtn qbtn-default" ng-click="openCalendar(dateAndTimeFrom, $event)"><i class="qglyphicon qglyphicon-calendar"></i></button>
							              </span>
							            </div>
									</div>
									<div class="qcol-xs-6 qcol-md-3">
										<label for="dateAndTimeTo"><s:text name="exceptionLogList.search.dateAndTimeTo"/>:</label>
										<div class="qinput-group">
							              <input type="text" class="qform-control" datepicker-popup="dd/MM/yyyy" 
											ng-model="scopeController.search.dateAndTimeTo" 
											is-open="dateAndTimeTo.opened" datepicker-options="dateOptions" close-text="Close" />
							              <span class="qinput-group-btn">
							                <button type="button" class="qbtn qbtn-default" ng-click="openCalendar(dateAndTimeTo, $event)"><i class="qglyphicon qglyphicon-calendar"></i></button>
							              </span>
							            </div>
									</div>
									<div class="qcol-xs-12 qcol-md-6">
										<label for="message"><s:text name="exceptionLogList.search.message"/></label>
										<s:textfield ng-model="scopeController.search.message" id="message" cssClass="qform-control"></s:textfield>
									</div>
								</div>
								<div class="qrow">
									<div class="qcol-xs-12 qcol-md-6">
										<label for="applicationUser"><s:text name="exceptionLogList.search.applicationUser"/></label>
										<s:textfield ng-model="scopeController.search.applicationUser" id="applicationUser" cssClass="qform-control"></s:textfield>
									</div>
								</div>
							</div>
							<div class="box-footer qtext-center" ng-show="filtriEspansi">
								<button ng-click="filtriEspansi = false;search();" class="qbtn btn-framework-color"><i class="fa fa-search"></i>&nbsp;<s:text name="button.search"/></button>
								<button ng-click="resetSearch()" class="qbtn btn-framework-color"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.reset"/></button>
							</div>
	              		</div>
              		</form>
			    	<div class="box box-framework" >
			    		<div class="box-body qtext-center" ng-if="!(scopeController.result.list!= null && scopeController.result.list.length>0)" >
           	  				<s:text name="exceptionLogList.noResult"></s:text>
           	 			</div>
	  			 		<div class="box-header" ng-if="scopeController.result.list!= null && scopeController.result.list.length>0" ng-cloak>
	  			 			<span><span class="qbadge bg-framework">{{ scopeController.result.count }}</span>&nbsp;<s:text name="exceptionLogList.resultFound"/></span>
							<div class="qpull-right">
								 <span class="dropdown" style="display:table-cell;height:40px;width:40px;text-align: center; vertical-align: middle; margin: 2px;">
										<a class="action-icon" ng-click="openOrderMenu = !openOrderMenu" style="color: #000;">
											<i class="fa fa-sort fa-2x" ng-class="{'active-order-icon':scopeController.search.order > 0}"></i>
										</a>
										<ul class="qdropdown-menu qdropdown-menu-right" ng-show="openOrderMenu" style="display: block;">
											
											<li style="padding: 10px;">
												<s:text name="exceptionLogList.order.contextName"/>
												<span class="pull-right">
													<i class="fa fa-sort-amount-asc" style="cursor: pointer;" ng-class="{'active-order-icon': scopeController.search.order == 1}" ng-click="orderBy(1); openOrderMenu = false;"></i>
													<i class="fa fa-sort-amount-desc" style="cursor: pointer;" ng-class="{'active-order-icon': scopeController.search.order == 2}" ng-click="orderBy(2); openOrderMenu = false;"></i>
												</span>
											</li>
											<li style="padding: 10px;">
												<s:text name="exceptionLogList.order.progressive"/>
												<span class="pull-right">
													<i class="fa fa-sort-amount-asc" style="cursor: pointer;" ng-class="{'active-order-icon': scopeController.search.order == 3}" ng-click="orderBy(3); openOrderMenu = false;"></i>
													<i class="fa fa-sort-amount-desc" style="cursor: pointer;" ng-class="{'active-order-icon': scopeController.search.order == 4}" ng-click="orderBy(4); openOrderMenu = false;"></i>
												</span>
											</li>	
											<li style="padding: 10px;">
												<s:text name="exceptionLogList.order.dateAndTime"/>
												<span class="pull-right">
													<i class="fa fa-sort-amount-asc" style="cursor: pointer;" ng-class="{'active-order-icon': scopeController.search.order == 5}" ng-click="orderBy(5); openOrderMenu = false;"></i>
													<i class="fa fa-sort-amount-desc" style="cursor: pointer;" ng-class="{'active-order-icon': scopeController.search.order == 6}" ng-click="orderBy(6); openOrderMenu = false;"></i>
												</span>
											</li>
										</ul>
								 </span>
							 	 <span ng-if="scopeController.data != null" ng-repeat="action in scopeController.data.globalActionList" class="qery-panel-btn" style="display:table-cell;height:40px;width:40px;text-align: center; vertical-align: middle; margin: 2px;">
				                    <img ng-attr-src="{{getImageSrc(scopeController, 'icon', action.image)}}" class="action-icon" ng-click="performAction(action, null, scopeController)"/> 
				                </span>
			                </div>
						 </div>
               			<div class="box-body" ng-if="scopeController.result.list!= null && scopeController.result.list.length>0" ng-cloak>
               				<table class="qtable qtable-hover">
								<thead>
									<tr>
										<th><s:text name="exceptionLogList.list.contextName"/></th>
										<th><s:text name="exceptionLogList.list.progressive"/></th>
										<th><s:text name="exceptionLogList.list.dateAndUser"/></th>
										<th><s:text name="exceptionLogList.list.message"/></th>
										<th>&nbsp;</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="row in scopeController.result.list">
										<td>{{ row.contextName }}</td>
										<td>{{ row.progressive }}</td>
										<td nowrap="nowrap">
											{{ row.dateAndTime  | date:"<s:text name="format.date3" />" }}
											<span ng-if="row.applicationUser != null && row.applicationUser != undefined && row.applicationUser != ''">
												<s:text name="label.by" />&nbsp;<span class="text-framework">{{ row.applicationUser  }}</span>
											</span>
										</td>
										<td>{{ row.message }}</td>
										<td class="qtext-right">
											<div class="qbtn-group">
							                     <button class="qbtn btn-framework-color" ng-click="detail(row)" type="button"><i class="fa fa-search"></i>&nbsp;<s:text name="exceptionLogList.detail" /></button>
							                     <button data-toggle="qdropdown" class="qbtn btn-framework-color qdropdown-toggle" type="button" aria-expanded="false">
							                       <span class="qcaret"></span>
							                       <span class="qsr-only"></span>
							                     </button>
							                     <ul role="qmenu" class="qdropdown-menu qdropdown-menu-right">
							                       	<li ng-click="addData(row)"><a><i class="fa fa-info-circle"></i>&nbsp;<s:text name="exceptionLogList.additionalData" /></a></li>
							                       	<li ng-click="userData(row)"><a><i class="fa fa-user"></i>&nbsp;<s:text name="exceptionLogList.userData" /></a></li>
							                     </ul>
							              	</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="qtext-center">
	               				<pagination 
										ng-model="scopeController.search.page" 
										total-items="scopeController.result.count" 
										max-size="5" 
										direction-links="false" 
										boundary-links="true" 
										first-text="«" 
										last-text="»" 
										rotate="false" 
										ng-change="list()"
										style="margin: 0px;"
									/>
	               			</div>
               			</div>
               			
	  			 	</div>
  		
  				</div>
			</div>
  		 	<jsp:include page="_footer.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  	</div>	
  	</body>
  	<script type="text/ng-template" id="detailModalContent.html">
        <div class="qmodal-header">
            <h3 class="qmodal-title"><i class="fa fa-search"></i>&nbsp;<s:text name="exceptionLogList.detail" /></h3>
        </div>
        <div class="qmodal-body">
            <pre style="font-size: 12px; overflow: auto; max-height: 500px;">{{selectedRow.stackTrace | trim}}</pre>
        </div>
        <div class="qmodal-footer">
            <button class="qbtn btn-framework-color" type="button" ng-click="cancel()"><s:text name="button.cancel" /></button>
        </div>
    </script>
    <script type="text/ng-template" id="addDataModalContent.html">
        <div class="qmodal-header">
            <h3 class="qmodal-title"><i class="fa fa-info-circle"></i>&nbsp;<s:text name="exceptionLogList.additionalData" /></h3>
        </div>
        <div class="qmodal-body">
            <pre style="font-size: 12px; overflow: auto; max-height: 500px;">{{selectedRow.addData | json}}</pre>
        </div>
        <div class="qmodal-footer">
            <button class="qbtn btn-framework-color" type="button" ng-click="cancel()"><s:text name="button.cancel" /></button>
        </div>
    </script>
    <script type="text/ng-template" id="userModalContent.html">
        <div class="qmodal-header">
            <h3 class="qmodal-title"><i class="fa fa-user"></i>&nbsp;<s:text name="exceptionLogList.userData" /></h3>
        </div>
        <div class="qmodal-body">
            <pre style="font-size: 12px; overflow: auto; max-height: 500px;">{{selectedRow.userData | json}}</pre>
        </div>
        <div class="qmodal-footer">
            <button class="qbtn btn-framework-color" type="button" ng-click="cancel()"><s:text name="button.cancel" /></button>
        </div>
    </script>
</html>
