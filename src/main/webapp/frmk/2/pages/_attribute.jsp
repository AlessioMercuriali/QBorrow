<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form name="forms.attributeListForm">
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
        	<h3 class="qh3 box-title">&nbsp;&nbsp;<s:text name="attribute.search.title"/></h3>
        </div>
        <div class="box-body" ng-show="!filtriEspansi" ng-cloak>
         	<span class="filterDiv qpull-left" ng-if="scopeController.searchAttribute.code != null && scopeController.searchAttribute.code != ''">
    			{{scopeController.labelsAndHelpersAttributes['CODE_LABEL']}}: <b>{{scopeController.searchAttribute.code}}</b>&nbsp;&nbsp;
    			<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilterAttribute('code')"></i>
    		</span>
         	<span class="filterDiv qpull-left" ng-if="scopeController.searchAttribute.description != null && scopeController.searchAttribute.description != ''">
         		{{scopeController.labelsAndHelpersAttributes['DESCR_LABEL']}}: <b>{{scopeController.searchAttribute.description}}</b>&nbsp;&nbsp;
         		<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilterAttribute('description')"></i>
         	</span>
         	<span class="filterDiv qpull-left" ng-if="scopeController.selectedAttributeType.multisocietaYN && scopeController.searchAttribute.organization != null">
         		<s:text name="attribute.search.organization"/>: <b>{{scopeController.searchAttribute.organization}}</b>&nbsp;&nbsp;
         		<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilterAttribute('organization')"></i>
         	</span>
         	<span class="filterDiv qpull-left" ng-if="scopeController.selectedAttributeType.multilinguaYN && scopeController.searchAttribute.language != null">
         		<s:text name="attribute.search.language"/>: <b>{{scopeController.searchAttribute.language}}</b>&nbsp;&nbsp;
         		<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilterAttribute('language')"></i>
         	</span>
         	<div ng-repeat="attrTypeAttr in scopeController.attributeTypeAttributes track by $index" ng-if="attrTypeAttr.ricercaYN">
	         	<span class="filterDiv qpull-left" ng-if="scopeController.searchAttribute['attribute'+($index+1)] != null && scopeController.searchAttribute['attribute'+($index+1)] != ''">
	         		{{scopeController.labelsAndHelpersAttributes['ATT'+($index+1)+'_LABEL']}}: <b>{{scopeController.searchAttribute['attribute'+($index+1)]}}</b>&nbsp;&nbsp;
	         		<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilterAttribute('attribute'+($index+1))"></i>
	         	</span>
         	</div>
        </div>
		<div class="box-body qfade " ng-show="filtriEspansi" ng-if="scopeController.searchAttribute.hasSearchableValues">
      		<div class="qcol-xs-12 qcol-md-6" ng-if="scopeController.attributeTypeAttributeCode.ricercaYN">
				<label for="attributeCode">{{scopeController.labelsAndHelpersAttributes['CODE_LABEL']}}</label>
				<input type="text" id="attributeCode" class="qform-control" ng-model="scopeController.searchAttribute.code" />
				<div class="help-block with-errors">{{scopeController.labelsAndHelpersAttributes['CODE_HELPER']}}</div>
			</div>
      		<div class="qcol-xs-12 qcol-md-6" ng-if="scopeController.attributeTypeAttributeDescr.ricercaYN">
				<label for="attributeDescr">{{scopeController.labelsAndHelpersAttributes['DESCR_LABEL']}}</label>
				<input type="text" id="attributeDescr" class="qform-control" ng-model="scopeController.searchAttribute.description" />
				<div class="help-block with-errors">{{scopeController.labelsAndHelpersAttributes['DESCR_HELPER']}}</div>
			</div>
      		<div class="qcol-xs-12 qcol-md-6" ng-if="scopeController.selectedAttributeType.multisocietaYN">
				<label for="attributeOrganization"><s:text name="attribute.search.organization"/></label>
				<div class="qery-panel-btn dropdown" style="height: 34px;" ng-init="scopeController.openCompanyMenu=false">
					<a class="cursor" ng-click="scopeController.openCompanyMenu = !scopeController.openCompanyMenu"  style="color: #000;">
						<span style="font-style:italic;font-weight: bold;" ng-if="scopeController.searchAttribute.organization != null && scopeController.searchAttribute.organization != undefined && scopeController.searchAttribute.organization!=''">
							{{scopeController.searchAttribute.organization}}
						</span>
						<span style="font-style:italic;" ng-if="scopeController.searchAttribute.organization == null || scopeController.searchAttribute.organization == undefined || scopeController.searchAttribute.organization==''">
						</span>
						&nbsp;
						<i class="fa fa-lg fa-angle-down text-framework"></i>
					</a>
					<ul class="qdropdown-menu" ng-show="scopeController.openCompanyMenu" style="display: block;" ng-mouseleave="scopeController.openCompanyMenu=false" >
						<li style="padding: 10px;" class="cursor" ng-click="scopeController.searchAttribute.organization=''">
							&nbsp;
						</li>
						<li style="padding: 10px;" class="cursor" ng-repeat="company in scopeController.companyList" ng-click="scopeController.searchAttribute.organization=company">
							{{company}}
						</li>
					</ul>
				</div>
			</div>
      		<div class="qcol-xs-12 qcol-md-6" ng-if="scopeController.selectedAttributeType.multilinguaYN">
				<label for="attributeLanguage"><s:text name="attribute.search.language"/></label>
				<div class="qery-panel-btn dropdown" style="height: 34px;" ng-init="scopeController.openLanguageMenu=false">
					<a class="cursor" ng-click="scopeController.openLanguageMenu = !scopeController.openLanguageMenu"  style="color: #000;">
						<span style="font-style:italic;font-weight: bold;" ng-if="scopeController.searchAttribute.language != null && scopeController.searchAttribute.language != undefined && scopeController.searchAttribute.language!=''">
							{{scopeController.searchAttribute.language}}
						</span>
						<span style="font-style:italic;" ng-if="scopeController.searchAttribute.language == null || scopeController.searchAttribute.language == undefined || scopeController.searchAttribute.language==''">
						</span>
						&nbsp;
						<i class="fa fa-lg fa-angle-down text-framework"></i>
					</a>
					<ul class="qdropdown-menu" ng-show="scopeController.openLanguageMenu" style="display: block;" ng-mouseleave="scopeController.openLanguageMenu=false" >
						<li style="padding: 10px;" class="cursor" ng-click="scopeController.searchAttribute.language=''">
							&nbsp;
						</li>
						<s:iterator id="language" status="status" value="languages">
							<li style="padding: 10px;" class="cursor" ng-click="scopeController.searchAttribute.language='<s:property value="#language" />'">
								<s:property value="#language" />
							</li>
						</s:iterator>
					</ul>
				</div>
			</div>
			<div ng-repeat="attrTypeAttr in scopeController.attributeTypeAttributes track by $index" class="qcol-xs-12 qcol-md-6" ng-if="attrTypeAttr.ricercaYN">
				<label>{{scopeController.labelsAndHelpersAttributes['ATT'+($index+1)+'_LABEL']}}</label>
				<div ng-if="attrTypeAttr.tipo == 'Testo' || attrTypeAttr.tipo == 'Testo_Multilingua'">
					<input type="text" class="qform-control" ng-model="scopeController.searchAttribute['attribute'+($index+1)]"></input>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Intero'">
					<input type="number" class="qform-control" ng-model="scopeController.searchAttribute['attribute'+($index+1)]" string-to-int></input>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Decimale'">
					<input type="number" class="qform-control" ng-model="scopeController.searchAttribute['attribute'+($index+1)]" string-to-decimal></input>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Vero_Falso'">
					<i-check id="selectItem" style="cursor:pointer;" ng-model="scopeController.searchAttribute['attribute'+($index+1)]" >
					</i-check>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Altro_Attribute'">
					<div class="qery-panel-btn dropdown" style="height: 34px;" ng-init="initAttribute(attrTypeAttr.tipoAttribute, $index)">
						<a class="cursor" ng-click="scopeController.openAttrValueMenu[$index] = !scopeController.openAttrValueMenu[$index]"  style="color: #000;">
							<span style="font-style:italic;font-weight: bold;" ng-if="scopeController.searchAttribute['attribute'+($index+1)] != null && scopeController.searchAttribute['attribute'+($index+1)] != undefined && scopeController.searchAttribute['attribute'+($index+1)]!=''">
								{{scopeController.searchAttribute['attribute'+($index+1)]}}
							</span>
							<span style="font-style:italic;" ng-if="scopeController.searchAttribute['attribute'+($index+1)] == null || scopeController.searchAttribute['attribute'+($index+1)] == undefined || scopeController.searchAttribute['attribute'+($index+1)] ==''">
							</span>
							&nbsp;
							<i class="fa fa-lg fa-angle-down text-framework"></i>
							<input type="hidden" class="qform-control" ng-model="scopeController.searchAttribute['attribute'+($index+1)]" />
						</a>
						<ul class="qdropdown-menu" ng-show="scopeController.openAttrValueMenu[$index]" style="display: block;" ng-mouseleave="scopeController.openAttrValueMenu[$index]=false" >
							<li style="padding: 10px;" class="cursor" ng-click="scopeController.searchAttribute['attribute'+($index+1)]= ''">
								&nbsp;
							</li>
							<li style="padding: 10px;" class="cursor" ng-repeat="attrValue in scopeController.attributeValuesList[$index]" ng-click="scopeController.searchAttribute['attribute'+($parent.$index+1)] = attrValue.code">
								{{attrValue.description}}
							</li>
						</ul>
					</div>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Data'">
					<div class="qinput-group" style="vertical-align: top;" >
						<input type="text"
								class="qform-control" 
								id="attribute{{$index+1}}"
								ng-model="scopeController.calendar['attribute'+($index+1)].date"
								ng-change="convertDate('attribute'+($index+1))"  
								datepicker-popup="<s:text name='format.date' />" 
								is-open="scopeController.calendar['attribute'+($index+1)].opened"
								datepicker-options="dateOptions" 
								close-text="Close"
								/>
						<span class="qinput-group-btn">
					   		<button type="button" class="qbtn qbtn-default" ng-click="openCalendar('attribute'+($index+1), $event)"
				                	style="padding: 6px 12px;"><i class="fa fa-calendar"></i></button>
				        </span>
			    	</div>
				</div>
				<div ng-if="attrTypeAttr.tipo == 'Color_Picker'">
					<button type="qbutton" class="qbtn" colorpicker ng-model="scopeController.searchAttribute['attribute'+($index+1)]" style="background-color:{{scopeController.searchAttribute['attribute'+($index+1)]}}" >
						<span class="fa fa-paint-brush"></span>
					</button>
				</div>
				<div class="help-block with-errors">{{scopeController.labelsAndHelpersAttributes['ATT'+($index+1)+'_HELPER']}}</div>
			</div>
		</div>
		<div class="box-footer qtext-center" ng-show="filtriEspansi" style="border-top: 0px;">
			<button ng-click="filtriEspansi = false;searchAttribute();" class="qbtn btn-framework-color"><i class="fa fa-search"></i>&nbsp;<s:text name="button.search"/></button>
			<button ng-click="resetSearchAttribute()" class="qbtn btn-framework-color"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.reset"/></button>
		</div>
	</div>
</form>
              		
<i class="fa fa-arrow-left text-framework cursor" ng-click="scopeController.selectedPage='list'"></i>
<div class="box box-framework" >
	<div class="box-header with-border">
		<h3 class="qh3 box-title"><i class="fa fa-list"></i>
			{{scopeController.selectedAttributeType.tipo}}
		</h3>
		
		<button class="qbtn btn-framework-color qpull-right" ng-click="newAttribute()" type="button">
			<i class="fa fa-plus-circle"></i>&nbsp;<s:text name="attribute.btn.new"></s:text>
		</button>
		<span class="dropdown qpull-right" ng-if="scopeController.selectedAttributeType.ordinabileYN" style="display:table-cell;height:40px;width:40px;text-align: center; vertical-align: middle; margin: 2px;">
			<a class="action-icon" ng-click="openOrderMenu = !openOrderMenu" style="color: #000;">
				<i class="fa fa-sort fa-2x" ng-class="{'active-order-icon':scopeController.searchAttribute.order > 0}"></i>
			</a>
			<ul class="qdropdown-menu qdropdown-menu-right" ng-show="openOrderMenu" style="display: block;">
				<li style="padding: 10px;">
					<s:text name="attribute.head.list.ord"></s:text>
					<span class="pull-right">
						<i class="fa fa-sort-amount-asc" style="cursor: pointer;" ng-class="{'active-order-icon': scopeController.searchAttribute.order == 1}" ng-click="orderByAttribute(1); openOrderMenu = false;"></i>
						<i class="fa fa-sort-amount-desc" style="cursor: pointer;" ng-class="{'active-order-icon': scopeController.searchAttribute.order == 2}" ng-click="orderByAttribute(2); openOrderMenu = false;"></i>
					</span>
				</li>
			</ul>
	 	</span>
		<span class="fa fa-lg fa-file-excel-o text-grey cursor qpull-right" title="Export Excel" ng-click="XLSAttributeList()" style="margin-top: 10px;margin-right:5px;"></span>
	</div>
	<div class="box-body" >
        <table class="qtable qtable-hover">
			<thead>
				<tr>
					<th class="qtext-left" ng-if="scopeController.selectedAttributeType.ordinabileYN"><s:text name="attribute.head.list.ord"></s:text></th>
					<th class="qtext-left"><s:text name="attribute.head.list.code"></s:text></th>
					<th class="qtext-left" ng-if="scopeController.selectedAttributeType.multisocietaYN"><s:text name="attribute.head.list.company"></s:text></th>
					<th class="qtext-left" ng-if="scopeController.selectedAttributeType.multilinguaYN"><s:text name="attribute.head.list.language"></s:text></th>
					<th class="qtext-left"><s:text name="attribute.head.list.descr"/></th>
					<th class="qtext-right" width="1%">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="row in scopeController.attributeList" ng-class="{'item-disable':row.activeFlag==0}">
					<td class="qtext-left" style="vertical-align: middle;" ng-if="scopeController.selectedAttributeType.ordinabileYN">{{row.ordinamento}}</td>
					<td class="qtext-left" style="vertical-align: middle;">{{row.code}}</td>
					<td class="qtext-left" style="vertical-align: middle;" ng-if="scopeController.selectedAttributeType.multisocietaYN">{{row.organization.code}}</td>
					<td class="qtext-left" style="vertical-align: middle;" ng-if="scopeController.selectedAttributeType.multilinguaYN">{{row.language.language}}</td>
					<td class="qtext-left" style="vertical-align: middle;">{{row.description}}</td>
					<td class="qtext-right" style="vertical-align: middle;">
						<div class="qbtn-group">
		                     <button class="qbtn btn-framework-color" ng-click="editAttribute(row)" type="button"><i class="fa fa-pencil"></i>&nbsp;<s:text name="attribute.btn.edit"></s:text></button>
		                     <button data-toggle="qdropdown" class="qbtn btn-framework-color qdropdown-toggle" type="button" aria-expanded="false">
		                       <span class="qcaret"></span>
		                       <span class="qsr-only"></span>
		                     </button>
		                     <ul role="qmenu" class="qdropdown-menu qdropdown-menu-right">
		                     	<%-- 
		                       	<li ng-click="detailAttribute(row)"><a><i class="fa fa-search"></i>&nbsp;<s:text name="attribute.btn.detail"></s:text></a></li>
		                        --%>
		                        <li class="cursor" ng-if="row.activeFlag!=0" ng-click="deleteAttribute(row)"><a><i class="fa fa-trash-o"></i>&nbsp;<s:text name="attribute.btn.delete"></s:text></a></li>
		                     	<li class="cursor" ng-if="row.activeFlag==0" ng-click="restoreAttribute(row)"><a><i class="fa fa-repeat"></i>&nbsp;<s:text name="attribute.btn.restore"></s:text></a></li>
		                     </ul>
		              	</div>
					</td>
					
				</tr>
			</tbody>
		</table>
		 <div class="qtext-center">
	     	<pagination 
				ng-model="scopeController.searchAttribute.page" 
				total-items="scopeController.countAttribute" 
				max-size="5" 
				direction-links="false" 
				boundary-links="true" 
				first-text="«" 
				last-text="»" 
				rotate="false" 
				ng-change="attributeListPage()"
				style="margin: 0px;"
		/>
         	</div>
	</div>
</div>		
			    		
  				