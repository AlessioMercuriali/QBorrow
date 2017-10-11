<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form name="forms.templateListForm">
	<div class="box box-framework" ng-cloak>
		<div class="box-header">
	    	<div class="qrow" style="margin: 1px 10px 10px 6px;display: inline-block;" >
	    		<div>
					<label for="qt"  class="control-label text-yellow cursor" ng-click="filtriEspansi = !filtriEspansi">
						<span  class="fa fa-filter fa-lg collapse-plus text-framework">
							<i style="font-size: 12px;" ng-show="filtriEspansi != true" class="fa fa-lg fa-plus"></i>
							<i style="font-size: 12px;" ng-show="filtriEspansi == true" class="fa fa-lg fa-minus"></i>
						</span>
					</label>
				</div>
			</div>
	    	<h3 class="qh3 box-title">&nbsp;&nbsp;<s:text name="template.search.title"/> <i class="fa fa-pencil cursor" aria-hidden="true" ng-click="openPopupUpdateLabel('template.search.title','DEFAULT','html')"></i></h3>
	    </div>
	    <div class="box-body" ng-show="!filtriEspansi" ng-cloak>
	    	<span class="filterDiv" ng-if="scopeController.search.name != null && scopeController.search.name != ''">
	    		<s:text name="template.search.name"/>: <b>{{scopeController.search.name}}</b>
	    		&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('name')"></i>
	    	</span>
	    	<span class="filterDiv" ng-if="scopeController.search.application != null && scopeController.search.application != ''">
	        	<s:text name="template.search.application"/>: <b>{{scopeController.search.application}}</b>
	         	&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('application')"></i>
	        </span>
	        <span class="filterDiv" ng-if="scopeController.search.organization != null && scopeController.search.organization != ''">
	        	<s:text name="template.search.organization"/>: <b>{{scopeController.search.organization}}</b>
	         	&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('organization')"></i>
	        </span>
	        <span class="filterDiv" ng-if="scopeController.search.language != null && scopeController.search.language != ''">
	        	<s:text name="template.search.language"/>: <b>{{scopeController.search.language}}</b>
	         	&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('language')"></i>
	        </span>
	    </div>
	    <div class="box-body qfade " ng-show="filtriEspansi">
	    	<div class="qrow">
	        	<div class="qcol-xs-12 qcol-md-6">
					<label for="code"><s:text name="template.search.name"/>:</label> <i class="fa fa-pencil cursor" aria-hidden="true" ng-click="openPopupUpdateLabel('template.search.name','DEFAULT','html')"></i>
					<input type="text" 
						ng-model="scopeController.search.name" 
						id="name" 
						name="name"
						class="qform-control" />
				</div>
				<div class="qcol-xs-12 qcol-md-6">
					<label for="value"><s:text name="template.search.language"/>:</label> <i class="fa fa-pencil cursor" aria-hidden="true" ng-click="openPopupUpdateLabel('template.search.language','DEFAULT','html')"></i>
					<select class="qform-control" ng-model="scopeController.search.language">
						<option ng-repeat="language in scopeController.languageList" value="{{language}}">{{language}}</option>
					</select>
				</div>
			</div>
	    	<div class="qrow">
	        	<div class="qcol-xs-12 qcol-md-6">
					<label for="value"><s:text name="template.search.application"/>:</label> <i class="fa fa-pencil cursor" aria-hidden="true" ng-click="openPopupUpdateLabel('template.search.application','DEFAULT','html')"></i>
					<select class="qform-control" ng-model="scopeController.search.application" ng-change="scopeController.search.organization = '';getOrganizationList()">
						<option ng-repeat="application in scopeController.applicationList" value="{{application}}">{{application}}</option>
					</select>
				</div>
	        	<div class="qcol-xs-12 qcol-md-6">
					<label for="value"><s:text name="template.search.organization"/>:</label> <i class="fa fa-pencil cursor" aria-hidden="true" ng-click="openPopupUpdateLabel('template.search.organization','DEFAULT','html')"></i>
					<select class="qform-control" ng-model="scopeController.search.organization">
						<option ng-repeat="organization in scopeController.organizationList" value="{{organization}}">{{organization}}</option>
					</select>
				</div>
	        </div>
		</div>
	    <div class="box-footer qtext-center" ng-show="filtriEspansi" style="border-top: 0px;">
			<button ng-click="filtriEspansi = false;scopeController.search.onlyInvalid = false;search();" class="qbtn btn-framework-color"><i class="fa fa-search"></i>&nbsp;<s:text name="button.search"/></button>
			<button ng-click="resetSearch()" class="qbtn btn-framework-color"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.reset"/></button>
		</div>
	</div>
</form>    		
<div class="box box-framework" cg-busy="{promise: scopeController.promise}" ng-cloak>
	<div class="box-header" ng-if="!(scopeController.count!= null && scopeController.count>0)" >
		<button class="qbtn btn-framework-color qpull-right" ng-click="create()" type="button">
			<i class="fa fa-plus"></i>&nbsp;<s:text name="template.btn.new"></s:text>
		</button>
	</div>
	<div class="box-body qtext-center" ng-if="!(scopeController.count!= null && scopeController.count>0)" >
		<s:text name="template.list.noResult"></s:text><br>&nbsp;
	</div>
	<div class="box-header" ng-if="scopeController.count!= null && scopeController.count>0" >
		<span>
			<span class="qbadge bg-framework">{{ scopeController.count }}</span>&nbsp;
			<s:text name="template.list.resultFound"/>
		</span>
		<div class="qpull-right">
			<button class="qbtn btn-framework-color qpull-right" ng-click="create()" type="button">
				<i class="fa fa-plus"></i>&nbsp;<s:text name="template.btn.new"></s:text>
			</button>
			&nbsp;<span class="fa fa-lg fa-file-excel-o text-grey cursor qpull-right" title="Export Excel" ng-click="createExcel()" style="margin-top: 10px;margin-right:5px;"></span>
		</div>
	</div>
	<div class="box-body" >
        <table class="qtable qtable-hover" ng-if="scopeController.count!= null && scopeController.count>0">
			<thead>
				<tr>
					<th class="qtext-left"><s:text name="template.list.name"/></th>
					<th class="qtext-left"><s:text name="template.list.application"/></th>
					<th class="qtext-left"><s:text name="template.list.organization"/></th>
					<th class="qtext-left"><s:text name="template.list.language"/></th>
					<th class="qtext-left"><s:text name="template.list.creationUser"/></th>
					<th class="qtext-center"><s:text name="template.list.creationDate"/></th>
					<th class="qtext-left"><s:text name="template.list.updateUser"/></th>
					<th class="qtext-center"><s:text name="template.list.updateDate"/></th>
					<th class="qtext-right" width="1%">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="row in scopeController.templateList" >
					<td class="qtext-left" style="vertical-align: middle;">{{ row.name }}</td>
					<td class="qtext-left" style="vertical-align: middle;">{{ row.application }}</td>
					<td class="qtext-left" style="vertical-align: middle;">{{ row.organization }}</td>
					<td class="qtext-left" style="vertical-align: middle;">{{ row.language }}</td>
					<td class="qtext-left" style="vertical-align: middle;">{{ row.creationUser }}</td>
					<td class="qtext-center" style="vertical-align: middle;">{{ row.creationDate | date:"dd/MM/yyyy HH:mm" }}</td>
					<td class="qtext-left" style="vertical-align: middle;">{{ row.updateUser }}</td>
					<td class="qtext-center" style="vertical-align: middle;">{{ row.updateDate | date:"dd/MM/yyyy HH:mm" }}</td>
					<td class="qtext-right" style="vertical-align: middle;">
						<div class="qbtn-group"> 
		                     <button class="qbtn btn-framework-color" ng-click="edit(row)" type="button"><i class="fa fa-pencil"></i>&nbsp;<s:text name="template.btn.edit"/></button>
		                     <button data-toggle="qdropdown" class="qbtn btn-framework-color qdropdown-toggle" type="button" aria-expanded="false"> 
		                       <span class="qcaret"></span> 
		                       <span class="qsr-only"></span> 
		                     </button>
		                     <ul role="qmenu" class="qdropdown-menu qdropdown-menu-right">
		                     	
<%-- 		                       	<li ng-click="detail(row)"><a><i class="fa fa-search"></i>&nbsp;<s:text name="template.btn.detail"></s:text></a></li>  --%>
		                        
		                        <li class="cursor" ng-if="row.activeFlag!=0" ng-click="deleteTemplate(row)"><a><i class="fa fa-trash-o"></i>&nbsp;<s:text name="template.btn.delete"></s:text></a></li> 
		                     </ul> 
		              	</div>
					</td>
					
				</tr>
			</tbody>
		</table>
		 <div class="qtext-center" ng-if="scopeController.count!= null && scopeController.count>0">
	     	<pagination 
				ng-model="scopeController.search.page" 
				total-items="scopeController.count" 
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
			    		
  				