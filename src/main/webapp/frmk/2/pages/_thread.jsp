<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="box box-framework" style="margin-top:25px;">
	<div class="box-header with-border qtext-right">
	</div>
	<div class="box-body" cg-busy="scopeController.promise">
		<table class="qtable qtable-hover">
			<thead>
		 		<tr>
		 			<th class="qtext-left" nowrap>#</th>
		 			<th class="qtext-left" nowrap>Group Name</th>
		 			<th class="qtext-left" nowrap>Thread Name</th>
		 			<th class="qtext-left" nowrap>Execution Percent (in 10s interval)</th>
		 			<th class="qtext-left" nowrap>Total Cpu Time (User Time)</th>
		 			<th class="qtext-left" nowrap>State</th>
		 			<th class="qtext-left" nowrap>StackTrace</th>
		 		</tr>
		 	</thead>
		 	<tbody>
				<tr ng-repeat="thread in scopeController.threadList">
					<td>{{$index + 1}}</td>
					<td>{{thread.threadGroupName}}</td>
					<td>{{thread.threadName}}</td>
					<td nowrap>{{thread.executionTime/100}}%</td>
					<td nowrap>{{thread.cpuTime/1000}}s ({{thread.userTime/1000}}s)</td>
					<td>{{thread.threadState}}</td>
					<td>
						<div ng-repeat="stackTraceElement in thread.stackTraceList track by $index">
							{{stackTraceElement}}
						</div>	
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>