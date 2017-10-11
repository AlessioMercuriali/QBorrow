<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<i class="fa fa-arrow-left text-framework cursor" ng-click="scopeController.selectedPage='list'"></i>
<div class="box box-framework" >
	<div class="box-header with-border">
		<h3 class="qh3 box-title"><i class="fa fa-search"></i>
			<s:text name="job.history.search"></s:text>
		</h3>
		<i class="fa  fa-undo text-framework cursor qpull-right" ng-click="scopeController.search={}"></i>
		<i class="fa fa-search text-framework cursor qpull-right" ng-click="history()"></i>
	</div>
	<div class="box-body" >
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow" >
			<div class="qcol-md-6 qcol-sm-12 qcol-xs-12">
				<label for="name"><s:text name="job.history.name"></s:text></label>
				<input type="text" class="qform-control" ng-model="scopeController.searchHistory.name"/>
			</div>
			<div class="qcol-md-6 qcol-sm-12 qcol-xs-12">
				<label for="context"><s:text name="job.history.context"></s:text></label>
				<input type="text" class="qform-control" ng-model="scopeController.searchHistory.context"/>
			</div>
		</div>
		<div class="qrow" >
			<div class="qcol-md-6 qcol-sm-12 qcol-xs-12">
				<label for="result"><s:text name="job.history.result"></s:text></label>
				<select class="qform-control" ng-model="scopeController.searchHistory.result">
					  <option value=""></option>
					  <option value="FAILURE">FAILURE</option>
					  <option value="SUCCESS">SUCCESS</option>
				</select>
			</div>
			<div class="qcol-md-3 qcol-sm-6 qcol-xs-6">
				<label for="start"><s:text name="job.history.start_from"></s:text></label>
				<span class="qinput-group-btn" style="vertical-align: top;" >
					<input type="date" name="dataPicker" 
								class="qform-control input-style force-font" 
								id="dp"  
								ng-model="scopeController.searchHistory.dateStartFrom"  
								style="height: 34px;border-radius: 4px;font-weight: bold;padding-top: 6px;padding-bottom: 6px;display: block;"
								placeholder="dd/MM/yyyy" 
								json-date="DD/MM/YYYY" 
								/>
			    </span>
			</div>
			<div class="qcol-md-3 qcol-sm-6 qcol-xs-6">
				<label for="start"><s:text name="job.history.start_to"></s:text></label>
			    <span class="qinput-group-btn" style="vertical-align: top;" >
			              
					<input type="date" name="dataPicker" 
								class="qform-control input-style force-font" 
								id="dp"  
								ng-model="scopeController.searchHistory.dateStartTo"  
								style="height: 34px;border-radius: 4px;font-weight: bold;padding-top: 6px;padding-bottom: 6px;display: block;"
								placeholder="dd/MM/yyyy" 
								json-date="DD/MM/YYYY" 
								/>
			    </span>
			</div>
		</div>
		<div class="box-footer qtext-center">
			<button ng-click="history()" class="qbtn btn-framework-color"><i class="fa fa-search"></i>&nbsp;<s:text name="button.search"/></button>
			<button ng-click="scopeController.searchHistory={}" class="qbtn btn-framework-color"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.reset"/></button>
		</div>
	</div>
</div>
<div class="box box-framework" >
<div class="box-header with-border">
		<h3 class="qh3 box-title"><i class="fa fa-clock-o"></i>
			<s:text name="job.history"></s:text>
		</h3>
	</div>
	<div class="box-body" >
		<div class="frmk-row">&nbsp;</div>
		<table class="qtable qtable-hover" ng-if="scopeController.jobHistoryList.length > 0">
			<thead>
				<tr>
					<th class="qtext-left">
						&nbsp;
					</th>
					<th class="qtext-left">
						<s:text name="job.history.name"></s:text>
					</th>
					<th class="qtext-left">
						<s:text name="job.history.context"></s:text>
					</th>
					<th class="qtext-left">
						<s:text name="job.history.startDate"></s:text>
					</th>
					<th class="qtext-left">
						<s:text name="job.history.duration"></s:text>
					</th>
					<th class="qtext-left">
						<s:text name="job.history.state"></s:text>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat-start="job in scopeController.jobHistoryList">
					<td class=" qtext-center"><i class="fa fa-lg fa-plus-circle cursor text-grey" ng-class="{'text-framework':job.showHideRow}" ng-click="job.showHideRow=!job.showHideRow"></i></td>
					<td class="qtext-left">	
						{{job.name}}
					</td>
					<td class="qtext-left">
						{{job.context}} 
					</td>
					<td class="qtext-left">
						{{job.dateStart | date:"<s:text name="format.date3" />"}}
					</td>
					<td class="qtext-left">
						{{job.duration | duration: '<s:text name="format.duration" />'}}
					</td>
					<td class="qtext-left">
						<i ng-if="job.state == 'SUCCESS'" class="fa fa-check text-green"></i>
						<i ng-if="job.state == 'ABORTED'" class="fa fa-check text-red"></i>
						<i ng-if="job.state == 'ERROR'" class="fa fa-ban text-red"></i>
						<i ng-if="job.state == 'INTERRUPTED'" class="fa fa-pause-circle-o text-yellow"></i>
						<i ng-if="job.state == 'STOPPED'" class="fa fa-stop-circle-o text-yellow"></i>
						&nbsp;
						{{job.state}}
					</td>
				</tr>
				<tr ng-repeat-end="" ng-if="job.showHideRow">
					<td colspan="1"></td>
					<td colspan="1">
						<s:text name="job.history.dateEnd"></s:text>:&nbsp;<b>{{job.dateEnd | date:"<s:text name="format.date3" />"}}</b><br>
						<s:text name="job.history.nodeName"></s:text>:&nbsp;<b>{{job.nodeName}}</b><br>
					</td>
					<td colspan="1">
						<s:text name="job.history.exNumber"></s:text>:&nbsp;<b>{{job.counter}}</b><br>
						<s:text name="job.history.result"></s:text>:&nbsp;<b>{{job.result}}</b><br>
						
					</td>
					<td colspan="3">
						<s:text name="job.history.threadName"></s:text>:&nbsp;<b>{{job.threadName}}</b><br>
						<s:text name="job.history.mex"></s:text>:&nbsp;<b>{{job.message}}</b><br>
					</td>
				</tr>
				
			</tbody>
		
		</table>
		<div class="qtext-center" ng-if="scopeController.jobHistoryList.length > 0">
     			<pagination 
					ng-model="scopeController.searchHistory.page" 
					total-items="scopeController.jobHistoryCount" 
					max-size="5" 
					direction-links="false" 
					boundary-links="true" 
					first-text="«" 
					last-text="»" 
					rotate="false" 
					ng-change="history()"
					style="margin: 0px;"
				/>
       	</div>
       	<div ng-if="scopeController.jobHistoryList.length == 0" class="qtext-center">
       		<s:text name="job.history.noresult"></s:text>
       	</div>
	</div>
</div>