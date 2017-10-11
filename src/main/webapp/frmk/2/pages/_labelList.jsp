<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
             			
<table class="qtable qtable-hover">
	<thead>
		<tr>
			<th class="qtext-left" >labelId</th>
			<th class="qtext-center" ng-repeat="language in scopeController.languagesList">
				<span ng-if="language != 'DEFAULT'"><img ng-attr-src="/framework/frmk/images/flags/{{ language }}.png" style="width: 25px;"></span>
				<span ng-if="language == 'DEFAULT'">{{ language }}</span>
			</th>
			<th class="qtext-right" width="1%">&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<tr ng-repeat="label in scopeController.labelList" >
			<td class="qtext-left" style="vertical-align: middle;" colspan=1>
				<span ng-if="(label.labelKey.nuovo == null || label.labelKey.nuovo == undefined || label.labelKey.nuovo == '') && !label.labelKey.nuovo">
					{{ label.labelKey.labelId }}
				</span>
				<span ng-if="label.labelKey.nuovo">
					<input type="text" 
						ng-model="label.labelKey.labelId" 
						id="labelId" 
						name="labelId"
						class="qform-control" />
				</span>
			</td>
			<td class="qtext-left" style="vertical-align: middle;" colspan=1 ng-repeat="language in scopeController.languagesList">
				<input type="text" 
						ng-model="label.translationMap[language.toUpperCase()]" 
						id="translation" 
						name="translation"
						class="qform-control" />
			</td>
			<td>
				<span ng-click="deleteLabel($index)" style="cursor:pointer" title="Delete label"><i class="fa fa-times" aria-hidden="true"></i></span>
			</td>
		</tr>
	</tbody>
</table>
			    		
  				