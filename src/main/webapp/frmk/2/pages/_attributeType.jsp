<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="box box-framework" >
	<div class="box-header with-border">
		<h3 class="qh3 box-title">
			<s:text name="attribute.title"></s:text>
		</h3>
	</div>
	<div class="box-body" >
		<div style="margin-right:10px;">
			<span ng-if="scopeController.selectAll!=true" ng-click="selectAll(true)" class="fa fa-lg fa-square text-framework cursor" title="Export Excel" style="margin-top: 10px;margin-left:10px;margin-right:8px;"></span>
			<span ng-if="scopeController.selectAll" ng-click="selectAll(false)" class="fa fa-lg fa-check-square text-framework cursor" title="Export Excel" style="margin-top: 10px;margin-left:10px;margin-right:8px;"></span>
			<span style="font-size:12px"><s:text name="attribute.label.type.selectAll"></s:text></span>
			<span style="font-size:12px" ng-if="scopeController.selectedAttributeTypeList.length > 0">&nbsp;&nbsp;&nbsp;({{scopeController.selectedAttributeTypeList.length}} <s:text name="lebel.selected"/>)</span>
			<button class="qbtn btn-framework-color qpull-right" ng-click="newAttributeType()" type="button">
				<i class="fa fa-plus"></i>&nbsp;<s:text name="attribute.btn.new"></s:text>
			</button>
			<span class="fa fa-lg fa-file-excel-o text-grey cursor qpull-right" title="Export Excel" ng-click="createExcel()" style="margin-top: 10px;margin-right:5px;"></span>
			<span class="fa fa-lg fa-file-code-o text-grey cursor qpull-right" title="Export SQL" ng-click="generateScripts()" style="margin-top: 10px;margin-right:5px;"></span>
			<span class="fa fa-lg fa-upload text-grey cursor qpull-right" title="Export XML" ng-click="exportToXml()" style="margin-top: 10px;margin-right:5px;"></span>
			<span class="fa fa-lg fa-download text-grey cursor qpull-right" ng-click="importXML()" title="Import XML" style="margin-top: 10px;margin-right:5px;"></span>
			<span title="Clean Cache" ng-click="emptyCacheJson()" class="fa fa-lg fa-history text-grey cursor qpull-right" style="margin-top: 10px;margin-right:5px;"></span>
			
		</div>
       	<table class="qtable qtable-hover">
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th class="qtext-left"><s:text name="attribute.head.list.type"/></th>
					<th class="qtext-left"><s:text name="attribute.head.list.descr"/></th>
					<th class="qtext-left"><s:text name="attribute.head.list.gen"/></th>
					<th class="qtext-center"><s:text name="attribute.head.list.multiLan"/></th>
					<th class="qtext-center"><s:text name="attribute.head.list.multiComp"/></th>
					<th class="qtext-center"><s:text name="attribute.head.list.sortable"/></th>
					<th class="qtext-center"><s:text name="attribute.head.list.cacheble"/></th>
					<th class="qtext-right">&nbsp;</th>
					
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="row in scopeController.result">
					<td style="vertical-align: middle;">
						<i-check id="selectItem" style="cursor:pointer;"  ng-model="row.select" ng-click="addToExportList(row)" >
							<label for="selectItem" style="font-size: 120%;color:black;padding-top: 11px;font-weight: normal;"></label>
						</i-check>
					</td>
					<td class="qtext-left" style="vertical-align: middle;">{{row.tipo}}</td>
					<td class="qtext-left" style="vertical-align: middle;">{{row.tipo_descrizione}}</td>
					<td class="qtext-left" style="vertical-align: middle;">{{row.genere}}</td>
					<td class="qtext-center" style="vertical-align: middle;">
						<i ng-if="row.multilinguaYN" class="fa fa-check text-green"></i>
						<i ng-if="row.multilinguaYN!=true" class="fa fa-times text-red"></i>
					</td>
					<td class="qtext-center" style="vertical-align: middle;"> 
						<i ng-if="row.multisocietaYN" class="fa fa-check text-green"></i>
						<i ng-if="row.multisocietaYN!=true" class="fa fa-times text-red"></i>
					</td>
					<td class="qtext-center" style="vertical-align: middle;">
						<i ng-if="row.ordinabileYN" class="fa fa-check text-green"></i>
						<i ng-if="row.ordinabileYN!=true" class="fa fa-times text-red"></i>
					</td>
					<td class="qtext-center" style="vertical-align: middle;">
						<i ng-if="row.cachebleYN" class="fa fa-check text-green"></i>
						<i ng-if="row.cachebleYN!=true" class="fa fa-times text-red"></i>
					</td>
					<td class="qtext-right">
						<div class="qbtn-group">
		                     <button class="qbtn btn-framework-color" ng-click="attributeList(row, true)" type="button"><i class="fa fa-list" ></i>&nbsp;<s:text name="attribute.btn.attribute"></s:text></button>
		                     <button data-toggle="qdropdown" class="qbtn btn-framework-color qdropdown-toggle" type="button" aria-expanded="false">
		                       <span class="qcaret"></span>
		                       <span class="qsr-only"></span>
		                     </button>
		                     <ul role="qmenu" class="qdropdown-menu qdropdown-menu-right">
		                     	<%-- 
		                    	<li ng-click="detail(row)" class="cursor"><a><i class="fa fa-search"></i>&nbsp;<s:text name="attribute.btn.detail"></s:text></a></li>
		                    	--%>
		                       	<li ng-click="edit(row)" class="cursor"><a><i class="fa fa-pencil"></i>&nbsp;<s:text name="attribute.btn.edit"></s:text></a></li>
		                     </ul>
		              	</div>
					</td>
				</tr>
			</tbody>
		</table>
	 <!--  {{scopeController.result | json}}-->
	 <div class="qtext-center">
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

<script type="text/ng-template" id="importXML.html">
      <div class="qmodal-header" style="border-bottom: 0px;">
        <h3 class="qmodal-title">
		 <i class="fa fa-lg fa-download grey"></i>&nbsp;<s:text name="attribute.import.title" />
	    </h3>
      </div>
      <div class="qmodal-body" style="padding: 0px 0px 10px 0px;">
		<div class="qrow" style="margin-left:25px;">
			<span><s:text name="attribute.import.info" />:&nbsp;</span>
   	    	<div class="fileUpload qbtn btn-framework-color">
  				<i class="fa fa-search cursor"></i>&nbsp;<s:text name="attribute.import.choose" />
	    		<input id="uploadBtn" type="file" fileread="file" class="upload qbtn btn-framework-color" accept=".xml" scopeController="scopeController"/>
			</div>
			<i style="vertical-align: -10px;" ng-if="fileread.fileName!=null" class="fa fa-2x fa-download cursor text-grey" ng-click="importXml()"></i>
			<div class="qcol-md-11">
				<div class="qprogress" style="min-width: 300px;" ng-if="scopeController.startImport">
					<div class="qprogress-bar qprogress-bar-striped qactive qprogress-bar-warning" role="progressbar" ng-style="getStyle(scopeController.importPerc)">
						{{getPerc(scopeController.importPerc)}}
					</div>
				</div>
			</div>
		</div>
      </div>
      <div class="qmodal-footer">
		<button class="qbtn btn-framework-color" type="button" ng-click="closeModal()"><i class="fa fa-check"></i>&nbsp;<s:text name="button.ok" /></button>
      </div>
</script>
