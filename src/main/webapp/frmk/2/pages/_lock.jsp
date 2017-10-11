<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<div class="box box-framework" >
	<div class="box-header with-border">
		<h3 class="qh3 box-title">
			<s:text name="lock.title.search"></s:text>
		</h3>
		<i class="fa  fa-undo text-framework cursor qpull-right" ng-click="scopeController.search={}"></i>
		<i class="fa fa-search text-framework cursor qpull-right" ng-click="list()"></i>
	</div>
	<div class="box-body" style="margin-right: 100px;">
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				<s:text name="lock.label.locknr"></s:text>:
			</div>
			<div class="qcol-md-4 qtext-left">
				<input type="number" class="qform-control" ng-model="scopeController.search.numLock"></input>
			</div>
			<div class="qcol-md-2 qtext-right">
				<s:text name="lock.label.userLockName"></s:text>:
			</div>
			<div class="qcol-md-4 qtext-left">
				<input type="text" class="qform-control" ng-model="scopeController.search.lockUser"></input>
			</div>
		</div>
		<div class="frmk-row">&nbsp;</div>
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				Data e ora lock:	
			</div>
			<div class="qcol-md-4 qtext-left">
				<span class="qinput-group-btn" style="vertical-align: top;" >
			              
					<input type="date" name="dataPicker" 
								class="qform-control input-style force-font" 
								id="dp"  
								ng-model="scopeController.search.lockTimeFrom"  
								style="height: 34px;border-radius: 4px;font-weight: bold;padding-top: 6px;padding-bottom: 6px;display: block;"
								placeholder="dd/MM/yyyy" 
								json-date="DD/MM/YYYY" 
								/>
			    </span>
			    
			    <span class="qinput-group-btn" style="vertical-align: top;" >
			              
					<input type="date" name="dataPicker" 
								class="qform-control input-style force-font" 
								id="dp"  
								ng-model="scopeController.search.lockTimeTo"  
								style="height: 34px;border-radius: 4px;font-weight: bold;padding-top: 6px;padding-bottom: 6px;display: block;"
								placeholder="dd/MM/yyyy" 
								json-date="DD/MM/YYYY" 
								/>
			    </span>
			
			</div>
			<div class="qcol-md-2 qtext-right">
				Date ora ultimo check: 
			</div>
			<div class="qcol-md-4 qtext-left">
				<span class="qinput-group-btn" style="vertical-align: top;" >
			            
					<input type="date" name="dataPicker" 
								class="qform-control input-style force-font" 
								id="dp"  
								ng-model="scopeController.search.checkTimeFrom"  
								style="height: 34px;border-radius: 4px;font-weight: bold;padding-top: 6px;padding-bottom: 6px;display: block;"
								placeholder="dd/MM/yyyy" 
								json-date="DD/MM/YYYY" 
								/>
			    </span>
			    
			    <span class="qinput-group-btn" style="vertical-align: top;" >
			              
					<input type="date" name="dataPicker" 
								class="qform-control input-style force-font" 
								id="dp"  
								ng-model="scopeController.search.checkTimeTo"  
								style="height: 34px;border-radius: 4px;font-weight: bold;padding-top: 6px;padding-bottom: 6px;display: block;"
								placeholder="dd/MM/yyyy" 
								json-date="DD/MM/YYYY" 
								/>
			    </span>
			
			</div>
		</div> 
		<div class="frmk-row">&nbsp;</div> 
		<div class="qrow">
			<div class="qcol-md-2 qtext-right">
				<s:text name="lock.label.machineName"></s:text>:
			</div>
			<div class="qcol-md-4 qtext-left">
				<input type="text" class="qform-control" ng-model="scopeController.search.machineName"></input>
			</div>
			<div class="qcol-md-2 qtext-right">
				<s:text name="lock.label.system"></s:text>:
			</div>
			<div class="qcol-md-4 qtext-left">
				<form>
				  <input type="radio" ng-click="scopeController.search.system='Si'" name="system" value="yes"> Si
				  <input type="radio" ng-click="scopeController.search.system='No'" name="system" value="no"> No
				  <input type="radio" ng-click="scopeController.search.system='Tutti'" name="system" value="all" checked> Tutti
				</form>
				<!-- <i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.search.systemYES" >
					<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
						Si
					</label>
				</i-check>
				<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.search.systemNO" >
					<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
						No
					</label>
				</i-check>
				<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.search.systemALL" >
					<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;">
						Tutti
					</label>
				</i-check> -->
			</div>
		
		</div>
		<div class="frmk-row">&nbsp;</div>
	</div>
</div>
<div class="box box-framework" >
	<div class="box-header with-border">
		<h3 class="qh3 box-title">
			<s:text name="lock.title"></s:text>
		</h3>
	</div>
	<div class="frmk-row">&nbsp;</div>
	<div class="box-body" >
		<table class="qtable qtable-hover" >
			<thead>
				<tr>
					<th class="">&nbsp;</th>
					<th class="  qtext-left"><s:text name="lock.label.locknr"></s:text></th>
					<th class="  qtext-left"><s:text name="lock.label.lockTime"></s:text></th>
					<th class=" qtext-left"><s:text name="lock.label.checkTime"></s:text></th>
					<th class=" qtext-left"><s:text name="lock.label.userLockName"></s:text></th>
					<th class=" qtext-left"><s:text name="lock.label.machineName"></s:text></th></th>
					<th class=" qtext-center"><s:text name="lock.label.system"></s:text></th></th>
					<th class=" qtext-center">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat-start="row in scopeController.lockList" ng-init="row.showHideRow=false">
					<td class=" qtext-center"><i class="fa fa-lg fa-plus-circle cursor text-grey" ng-class="{'text-framework':row.showHideRow}" ng-click="row.showHideRow=!row.showHideRow"></i></td>
					<td class=" qtext-left">{{row.numLock}}</td>
					<td class=" qtext-left">{{row.lockTime | date:"<s:text name="format.date3" />"}}</td>
					<td class=" qtext-left">{{row.checkTime | date:"<s:text name="format.date3" />"}}</td>
					<td class=" qtext-left">{{row.lockUser}}</td>
					<td class=" qtext-left">{{row.machineName}}</td>
					<td class=" qtext-center">
						<i ng-if="row.system!= true" class="fa fa-lg fa-times text-red"></i>
						<i ng-if="row.system" class="fa fa-lg fa-check text-green"></i>
					</td>
					<td class=" qtext-center"><i class="fa fa-lg fa-unlock cursor text-grey" ng-click="unlockJson(row)"></i></td>
				</tr>
				<tr ng-repeat-end="" ng-if="row.showHideRow">
					<td class="" colspan="8">
						<table class="qtable qtable-hover">
							<thead>
								<th class="qcol-md-3 qtext-left"><s:text name="lock.label.itemName"></s:text></th>
								<th class="qcol-md-4 qtext-left"><s:text name="lock.label.itemDescr"></s:text></th>
							</thead>
							<tbody>
								<tr ng-repeat="expRow in scopeController.lockItemMap[row.id]">
									<td class="qcol-md-3 qtext-left">{{expRow.name}}</td>
									<td class="qcol-md-4 qtext-left">{{expRow.description}}</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>