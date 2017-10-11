<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="box box-framework" style="margin-top:25px;">
	<div class="box-header with-border qtext-right">
	</div>
	<div class="box-body" >
	 	<table class="qtable qtable-hover">
		 	<thead>
		 		<tr>
		 			<th class="qtext-right">Name</th>
		 			<th class="qtext-right">Init</th>
		 			<th class="qtext-right">Used</th>
		 			<th class="qtext-right">Committed</th>
		 			<th class="qtext-right">Max</th>
		 		</tr>
		 	</thead>
		 	<tbody>
		 		<tr>
		 			<td class="qtext-right">
		 				Heap Memory Usage
		 			</td>
		 			<td class="qtext-right">
		 				{{scopeController.heapMemory.init}}
		 			</td>
		 			<td class="qtext-right">
		 				{{scopeController.heapMemory.used}}
		 			</td>
		 			<td class="qtext-right">
		 				{{scopeController.heapMemory.committed}}
		 			</td>
		 			<td class="qtext-right">
		 				{{scopeController.heapMemory.max}}
		 			</td>
		 		</tr>
		 		<tr>
		 			<td class="qtext-right">
		 				Non-Heap Memory Usage
		 			</td>
		 			<td class="qtext-right">
		 				{{scopeController.nonHeapMemory.init}}
		 			</td>
		 			<td class="qtext-right">
		 				{{scopeController.nonHeapMemory.used}}
		 			</td class="qtext-right"> 
		 			<td>
		 				{{scopeController.nonHeapMemory.committed}}
		 			</td class="qtext-right">
		 			<td class="qtext-right">
		 				{{scopeController.nonHeapMemory.max}}
		 			</td>
		 		</tr>
		 	</tbody>
	 
	 	</table>
	 </div>
</div>
	 <div ng-repeat="item in scopeController.memoryPoolMXBeanList">
	 	<div class="box box-framework" style="margin-top:25px;">
	 		<div class="box-header with-border qtext-right">
	 			<b>{{item.name}}</b>&nbsp;{{item.type}}
	 		</div>
	 		<div class="box-body" >
			  <table class="qtable qtable-hover">
			 	<thead>
			 		<tr>
			 			<th class="qtext-right">&nbsp;</th>
			 			<th class="qtext-right">Init</th>
			 			<th class="qtext-right">Used</th>
			 			<th class="qtext-right">Committed</th>
			 			<th class="qtext-right">Max</th>
			 		</tr>
			 	</thead>
			 	<tbody>
			 		<tr>
			 			<td class="qtext-right">
			 				Usage
			 			</td>
			 			<td class="qtext-right">
			 				{{item.initUsage}}
			 			</td>
			 			<td class="qtext-right">
			 				{{item.usedUsage}}
			 			</td>
			 			<td class="qtext-right">
			 				{{item.committedUsage}}
			 			</td>
			 			<td class="qtext-right">
			 				{{item.maxUsage}}
			 			</td>
			 		</tr>
			 		<tr>
			 			<td class="qtext-right">
			 				Peak Usage
			 			</td>
			 			<td class="qtext-right">
			 				{{item.initPeakUsage}}
			 			</td>
			 			<td class="qtext-right">
			 				{{item.usedPeakUsage}}
			 			</td>
			 			<td class="qtext-right">
			 				{{item.committedPeakUsage}}
			 			</td>
			 			<td class="qtext-right">
			 				{{item.maxPeakUsage}}
			 			</td>
			 		</tr>
			 		<tr>
			 			<td class="qtext-right">
			 				Collection Usage
			 			</td>
			 			<td class="qtext-right">
			 				{{item.initCollectionUsage}}
			 			</td class="qtext-right">
			 			<td class="qtext-right">
			 				{{item.usedCollectionUsage}}
			 			</td>
			 			<td class="qtext-right">
			 				{{item.committedCollectionUsage}}
			 			</td>
			 			<td class="qtext-right">
			 				{{item.maxCollectionUsage}}
			 			</td>
			 		</tr>
			 	</tbody>
			 </table>
			</div>
		</div>
	</div>
