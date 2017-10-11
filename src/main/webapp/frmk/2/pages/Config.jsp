<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
  	<head>
  		<jsp:include page="_head.jsp"></jsp:include>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxConfigController.js?_<jsp:include page='_version.jsp' />"></script>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/filter/qxConfigListFilter.js?_<jsp:include page='_version.jsp' />"></script>
  	</head>
  	<body ng-app="framework"> 
  		<div class="frameworkGlobalDiv"> 
  			<jsp:include page="_header.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  		<div class="frameworkRow"  >
		  		<div class="frameworkLeftMenuCell">
					<jsp:include page="_left.jsp">
						<jsp:param name="menuActive" value="Config"/>
					</jsp:include>
				</div>
  				<div class="frameworkMainCell" id="main2" ng-controller="qxConfigController">
  					<form name="forms.configListForm">
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
	                  			<h3 class="qh3 box-title">&nbsp;&nbsp;<s:text name="configMetadata.list.title"/></h3>
	                  			<div class="qpull-right">
									<span class="fa fa-lg fa-exclamation-triangle text-yellow cursor qpull-right" title="Export Excel" ng-click="filtriEspansi = false;scopeController.search.onlyInvalid = true;search();" style="margin-top: 10px;margin-right:5px;"></span>
								</div>
	                		</div>
	                		<div class="box-body" ng-show="!filtriEspansi" ng-cloak>
	                			<span class="filterDiv" ng-if="scopeController.search.code != null && scopeController.search.code != ''">
	                				<s:text name="configMetadata.list.code"/>: <b>{{scopeController.search.code}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('code')"></i>
	                			</span>
	                			<span class="filterDiv" ng-if="scopeController.search.value != null && scopeController.search.value != ''">
	                				<s:text name="exceptionLogList.search.value"/>: <b>{{scopeController.search.value}}</b>
	                				&nbsp;&nbsp;<i class="fa fa-times-circle" style="cursor: pointer;" ng-click="removeFilter('value')"></i>
	                			</span>
	                		</div>
	               			<div class="box-body qfade " ng-show="filtriEspansi">
	               				<div class="qrow">
	               					<div class="qcol-xs-12 qcol-md-6">
										<label for="code"><s:text name="configMetadata.list.code"/>:</label>
										<s:textfield ng-model="scopeController.search.code" id="code" cssClass="qform-control"></s:textfield>
									</div>
									<div class="qcol-xs-12 qcol-md-6">
										<label for="value"><s:text name="exceptionLogList.search.value"/>:</label>
										<s:textfield ng-model="scopeController.search.value" id="value" cssClass="qform-control"></s:textfield>
									</div>
	               				</div>
	               			</div>
	               			<div class="box-footer qtext-center" ng-show="filtriEspansi" style="border-top: 0px;">
								<button ng-click="filtriEspansi = false;scopeController.search.onlyInvalid = false;search();" class="qbtn btn-framework-color"><i class="fa fa-search"></i>&nbsp;<s:text name="button.search"/></button>
								<button ng-click="resetSearch()" class="qbtn btn-framework-color"><i class="fa fa-undo"></i>&nbsp;<s:text name="button.reset"/></button>
							</div>
	  					</div>
              		</form>
			    	<div class="box box-framework" cg-busy="{promise: scopeController.promise}">
			    		
			    		<div class="box-body qtext-center" ng-if="!(scopeController.result.list!= null && scopeController.result.list.length>0)" >
           	  				<s:text name="config.noResult"></s:text>
           	 			</div>
	  			 		<div class="box-header" ng-if="scopeController.result.list!= null && scopeController.result.list.length>0" ng-cloak>
	  			 			<span>
	  			 				<span class="qbadge bg-framework">{{ scopeController.result.count }}</span>&nbsp;<s:text name="config.resultFound"/>
	  			 				&nbsp;&nbsp;&nbsp;
	  			 				<span ng-if="scopeController.selectAll!=true" ng-click="selectAll(true)" class="fa fa-lg fa-square text-framework cursor" title="Export Excel" style="margin-top: 10px;margin-left:10px;margin-right:8px;"></span>
								<span ng-if="scopeController.selectAll" ng-click="selectAll(false)" class="fa fa-lg fa-check-square text-framework cursor" title="Export Excel" style="margin-top: 10px;margin-left:10px;margin-right:8px;"></span>
								<span style="font-size:12px"><s:text name="attribute.label.type.selectAll"></s:text></span>
	  			 			</span>
							<div class="qpull-right">
								<button class="qbtn btn-framework-color qpull-right" ng-click="create()" type="button">
									<i class="fa fa-plus"></i>&nbsp;<s:text name="attribute.btn.new"></s:text>
								</button>
								<span class="fa fa-lg fa-file-excel-o text-grey cursor qpull-right" title="Export Excel" ng-click="createExcel()" style="margin-top: 10px;margin-right:5px;"></span>
								<span class="fa fa-lg fa-file-code-o text-grey cursor qpull-right" title="Export SQL" ng-click="generateScripts()" style="margin-top: 10px;margin-right:5px;"></span>
								<%-- 
								<span class="fa fa-lg fa-upload text-grey cursor qpull-right" title="Export XML" ng-click="exportToXml()" style="margin-top: 10px;margin-right:5px;"></span>
								<span class="fa fa-lg fa-download text-grey cursor qpull-right" ng-click="importXML()" title="Import XML" style="margin-top: 10px;margin-right:5px;"></span>
								--%>
								<span title="<s:text name="configMetadata.image.emptyAllCache" />" ng-click="emptyCacheJson()" class="fa fa-lg fa-history text-grey cursor qpull-right" style="margin-top: 10px;margin-right:5px;"></span>
			                </div>
						 </div>
  						<form name="forms.configForm">
  						<div class="box-body" ng-if="scopeController.result.list!= null && scopeController.result.list.length>0" ng-cloak>
               				<tabset>
								<tab ng-repeat="row in scopeController.result.tree">
								 	<tab-heading>
								      {{row.application}}&nbsp;
								      <span class="qbadge bg-framework">
								      	{{ row.count }}
								      </span>
								    </tab-heading> 
								    <tabset>
									    <tab ng-repeat="row2 in row.list">
										 	<tab-heading>
										     {{row2.section }}&nbsp;
										     <span class="qbadge bg-framework">
										     	{{row2.count}}
										      </span>
										    </tab-heading> 
								    
								    		<fieldset class="scheduler-border" ng-repeat="resultConfig in row2.list">
											    <legend class="scheduler-border">{{resultConfig.fieldset}}</legend>
											    <div class="control-group">
											       <jsp:include page="_config.jsp"/>
											    </div>
											</fieldset>
								    	</tab>
								    	
									</tabset>
								</tab>
							</tabset>
               			</div>
			    		</form>
			    		<!--  <pre>{{scopeController.result.tree | json}}</pre> -->
			    		
  					</div>
  				</div>
			</div>
  		 	<jsp:include page="_footer.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  	</div>	
  	</body>
  	<jsp:include page="_configTemplate.jsp" />
</html>
