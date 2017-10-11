<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- JOB RUNNING -->
<div class="box box-framework" >
	<div class="box-header with-border">
		<div class="qrow" style="margin: 1px 10px 10px 6px;display: inline-block;" ng-cloak>
			<label for="qt"  class="control-label text-framework cursor" ng-click="listRunning()">
				<i class="fa fa-refresh"></i>
			</label>
		</div>
		<h3 class="qh3 box-title">&nbsp;&nbsp;<s:text name="job.running.title"/></h3>
		<span><span class="qbadge bg-framework">{{ scopeController.resultRunning.count }}</span>&nbsp;</span>
	</div>
	<div class="box-body" ng-if="scopeController.resultRunning.list!= null && scopeController.resultRunning.list.length>0" ng-cloak>
        <table class="qtable qtable-hover">
			<thead>
				<tr>
					<th style="text-align: left;"><s:text name="scheduler.job.list.name"/></th>
					<th style="text-align: right;"><s:text name="scheduler.job.counter"/></th>
					<th style="text-align: left;"><s:text name="scheduler.job.list.context"/></th>
					<th style="text-align: center;"><s:text name="scheduler.job.dateStart"/></th>
					<th style="text-align: center;"><s:text name="scheduler.job.progress"/></th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="row in scopeController.resultRunning.list">
					<td>{{ row.name }} ({{ row.nodeName }})</td>
					<td style="text-align: right;">{{ row.counter }}</td>
					<td>{{ row.context }}</td>
					<td style="text-align: center;">{{ row.creationDate | date:"<s:text name="format.date3" />"  }}</td>
					<td nowrap="nowrap">
						<div class="qprogress" style="min-width: 300px;">
							<div class="qprogress-bar qprogress-bar-striped qactive qprogress-bar-danger" role="progressbar" ng-style="getRunnableStyle(row)">
							    <!-- RUNNABLE Un job si trova in stato RUNNABLE se lo scheduler ha deciso di farlo partire, ma e' in attesa che una delle
								 	applicazioni lo prenda in carico. --> {{getRunnableText(row)}}
							</div>	
							<div class="qprogress-bar qprogress-bar-striped qactive qprogress-bar-warning" role="progressbar" ng-style="getStartingStyle(row)">
							    <!-- STARTING Un job si trova in stato STARTING se e' stato preso in carico da un filtro di un'applicazione di uno specifico
								 nodo, ma il job vero e proprio non e' ancora stato avviato nel suo thread dedicato. --> {{getStartingText(row)}}
							  </div>
							  <div class="qprogress-bar qprogress-bar-striped qactive qprogress-bar-info" role="progressbar" ng-style="getRunngingStyle(row)">
							    <!-- RUNNING Un job si trova in stato RUNNING se il job e' in esecuzione. --> {{getRunngingText(row)}}
							  </div>
							   <div class="qprogress-bar qprogress-bar-striped qactive qprogress-bar-success" role="progressbar" ng-style="getFinishedStyle(row)">
							    	<!-- FINISHED Un job si trova in stato FINISHED se il job vero e proprio e' finito, ed il record e' in attesa che lo scheduler
								 	si accorga della fine del job.--> {{getFinishedText(row)}}
								  </div>
						</div>
					</td>
					<td class="qtext-right">
						<button class="qbtn btn-framework-color" ng-click="stop(row)"><i class="fa fa-stop"></i>&nbsp;<s:text name="button.stop"/></button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>	


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
           		<h3 class="qh3 box-title">&nbsp;&nbsp;<s:text name="scheduler.job.search.configured"/></h3>
         	</div>
          	<div class="box-body" ng-show="!filtriEspansi" ng-cloak>
         			<span class="filterDiv" ng-if="scopeController.search.context != null && scopeController.search.context != ''">
         				<s:text name="scheduler.job.edit.context"/>: <b>{{scopeController.search.context}}</b>
         				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('context')"></i>
         			</span>
         			<span class="filterDiv" ng-if="scopeController.search.name != null && scopeController.search.name != ''">
         				<s:text name="scheduler.job.edit.name"/>: <b>{{scopeController.search.name}}</b>
         				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('name')"></i>
         			</span>
         	</div>
          	<div class="box-body qfade " ng-show="filtriEspansi" ng-cloak>
        			<div class="qrow">
        				<div class="qcol-xs-12 qcol-md-6">
							<label for="context"><s:text name="scheduler.job.edit.context"/>:</label>
							<s:textfield ng-model="scopeController.search.context" id="context" cssClass="qform-control"></s:textfield>
						</div>
						<div class="qcol-xs-12 qcol-md-6">
							<label for="name"><s:text name="scheduler.job.edit.name"/>:</label>
							<s:textfield ng-model="scopeController.search.name" id="name" cssClass="qform-control"></s:textfield>
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
    	  	<span><s:text name="scheduler.job.list.noResults"></s:text></span>
    	  	<div class="qpull-right">
			 	 <div class="qbtn-group">
	                  <button class="qbtn btn-framework-color" ng-click="create()" type="button"><i class="fa fa-file-o"></i>&nbsp;<s:text name="job.create" /></button>
	                  <button data-toggle="qdropdown" class="qbtn btn-framework-color qdropdown-toggle" type="button" aria-expanded="false">
	                    <span class="qcaret"></span>
	                    <span class="qsr-only"></span>
	                  </button>
	                  <ul role="qmenu" class="qdropdown-menu qdropdown-menu-right cursor">
	                    	<li ng-click="getContextList()"><a><i class="fa fa-list"></i>&nbsp;<s:text name="job.list" /></a></li>
	                	 	<li ng-click="history()"><a><i class="fa fa-clock-o"></i>&nbsp;<s:text name="job.history" /></a></li>
	                  </ul>
			     </div>
			</div>
    	 </div>
		<div class="box-header" ng-if="scopeController.result.list!= null && scopeController.result.list.length>0" ng-cloak>
			<span><span class="qbadge bg-framework">{{ scopeController.result.count }}</span>&nbsp;<s:text name="scheduler.job.list.resultFound"/></span>
			<div class="qpull-right">
			 	 <div class="qbtn-group">
	                  <button class="qbtn btn-framework-color" ng-click="create()" type="button"><i class="fa fa-file-o"></i>&nbsp;<s:text name="job.create" /></button>
	                  <button data-toggle="qdropdown" class="qbtn btn-framework-color qdropdown-toggle" type="button" aria-expanded="false">
	                    <span class="qcaret"></span>
	                    <span class="qsr-only"></span>
	                  </button>
	                  <ul role="qmenu" class="qdropdown-menu qdropdown-menu-right cursor">
	                    	<li ng-click="getContextList()"><a><i class="fa fa-list"></i>&nbsp;<s:text name="job.list" /></a></li>
	                	 	<li ng-click="history()"><a><i class="fa fa-clock-o"></i>&nbsp;<s:text name="job.history" /></a></li>
	                  </ul>
			     </div>
			</div>
		</div>
   		<div class="box-body" ng-if="scopeController.result.list!= null && scopeController.result.list.length>0" ng-cloak>
   			<table class="qtable qtable-hover">
				<thead>
					<tr>
						<th style="text-align: left;"><s:text name="scheduler.job.list.name"/></th>
						<th style="text-align: left;"><s:text name="scheduler.job.list.context"/></th>
						<th style="text-align: left;"><s:text name="scheduler.job.list.cronExpression"/></th>
						<th style="text-align: center;"><s:text name="scheduler.job.list.recovery"/></th>
						<th style="text-align: center;"><s:text name="scheduler.job.list.stateful"/></th>
						<th style="text-align: center;"><s:text name="scheduler.job.list.lastExecution"/></th>
						<th style="text-align: left;"><s:text name="scheduler.job.list.lastDuration"/></th>
						<th style="text-align: left;"><s:text name="scheduler.job.list.lastState"/></th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="row in scopeController.result.list">
						<td>{{ row.name }}</td>
						<td>{{ row.context_name }}</td>
						<td>{{ row.cronExpression }}</td>
						<td class="qtext-center" style="vertical-align: middle;">
							<i ng-if="row.recoveryYN" class="fa fa-check text-green"></i>
							<i ng-if="row.recoveryYN!=true" class="fa fa-times text-red"></i>
						</td>
						<td class="qtext-center" style="vertical-align: middle;">
							<i ng-if="row.statefulYN" class="fa fa-check text-green"></i>
							<i ng-if="row.statefulYN!=true" class="fa fa-times text-red"></i>
						</td>
						<td style="text-align: center;">{{ row.lastJobExecution.dateStart  | date:"<s:text name="format.date3" />" }}</td>
						<td>{{ row.lastJobExecution.duration | duration: '<s:text name="format.duration" />'}}</td>
						<td>
							<i ng-if="row.lastJobExecution.state == 'SUCCESS'" class="fa fa-check text-green"></i>
							<i ng-if="row.lastJobExecution.state == 'ABORTED'" class="fa fa-check text-red"></i>
							<i ng-if="row.lastJobExecution.state == 'ERROR'" class="fa fa-ban text-red"></i>
							<i ng-if="row.lastJobExecution.state == 'INTERRUPTED'" class="fa fa-pause-circle-o text-yellow"></i>
							<i ng-if="row.lastJobExecution.state == 'STOPPED'" class="fa fa-stop-circle-o text-yellow"></i>
							&nbsp;
							{{ row.lastJobExecution.state }}
						</td>
						
						<td class="qtext-right">
							<div class="qbtn-group">
			                     <button class="qbtn btn-framework-color" ng-click="play(row)" type="button"><i class="fa fa fa-play"></i>&nbsp;<s:text name="job.play" /></button>
			                     <button data-toggle="qdropdown" class="qbtn btn-framework-color qdropdown-toggle" type="button" aria-expanded="false">
			                       <span class="qcaret"></span>
			                       <span class="qsr-only"></span>
			                     </button>
			                     <ul role="qmenu" class="qdropdown-menu qdropdown-menu-right">
			                       	<li class="cursor" ng-click="edit(row)"><a><i class="fa fa-pencil"></i>&nbsp;<s:text name="job.edit" /></a></li>
			                       	<li class="cursor" ng-click="deleteJob(row)"><a><i class="fa fa-trash-o"></i>&nbsp;<s:text name="job.delete" /></a></li>
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
