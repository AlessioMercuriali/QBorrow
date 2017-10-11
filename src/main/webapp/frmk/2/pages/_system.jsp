<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>



<div class="box box-framework" style="margin-top:25px;">
 <table class="qtable qtable-hover">
 	<thead>
 		<tr>
 			<th>Property Name</th>
 			<th>Property Value</th>
 		</tr>
 	</thead>
 	<tbody>
 		<tr ng-repeat="prop in scopeController.systemProperties">
 			<td>{{prop.key}}</td>
 			<td><div style="overflow: auto;max-width: 900px">{{prop.value}}</div></td>
 		</tr>
 	</tbody>
 
 </table>

</div>