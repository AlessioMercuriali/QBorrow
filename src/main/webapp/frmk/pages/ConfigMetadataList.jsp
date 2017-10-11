<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<s:url action="configMetadata" id="importFromXmlUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">importFromXml</s:param>
</s:url>
<s:url action="configMetadata" id="exportToXmlUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">exportToXml</s:param>
</s:url>
<s:url action="configMetadata" id="configMetadataXmlImportPopupUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">configMetadataXmlImportPopup</s:param>
</s:url>
<s:url action="configMetadata" id="configMetadataXmlExportPopupUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">configMetadataXmlExportPopup</s:param>
</s:url>
<s:url action="configMetadata" id="emptyCacheUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">emptyCache</s:param>
</s:url>
<s:url action="configMetadata" id="createUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">edit</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<s:url action="configMetadata" id="selectDeselectRowUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">selectDeselectRow</s:param>
</s:url>
<s:url action="configMetadata" id="selectAllRowsUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">selectAllRows2</s:param>
</s:url>
<s:url action="configMetadata" id="unSelectAllRowsUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">unselectAllRows2</s:param>
</s:url>
<s:url id="checkAndGenerateScriptsUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">checkAndGenerateScripts</s:param>
</s:url>
<s:url id="generateScriptsUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">generateScripts</s:param>
</s:url>
<s:url id="createCompleteExcelUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">createExcel</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	function createPage(){
		editConfigMetadata('<s:property value="#createUrl" escape="false" />');
	}
	function editConfigMetadata(url){
		modal.init('<s:text name="configMetadata.edit.title"/>',url);
		modal.display();
	}
	function editConfigValues(code, url){
		modal.init('<s:text name="config.edit.title"/> ' + code,url);
		modal.display();
	}
	function emptyCacheByType(url, type){
		modal.init('<s:text name="configMetadata.image.emptyCache"/> - ' + type);
		modal.load(true);
		modal.display();
		qamCall(url,[],manageEmptyCache,'html','post');
	}
	function emptyCache(){
		modal.init('<s:text name="configMetadata.image.emptyAllCache"/>');
		modal.load(true);
		modal.display();
		qamCall('<s:property value="#emptyCacheUrl" escape="false"/>',[],manageEmptyCache,'html','post');
	}
	function manageEmptyCache(data){
		var newDoc = document.open("text/html", "replace");
		newDoc.write(data);
		newDoc.close();
	}
	function selectDeselectRow(check, configMetadataId, rowId){
		var params = [
			{name:'selectedConfigMetadata',value:configMetadataId},
			{name:'rowId',value:rowId}
		];
		qamCall('<s:property value="#selectDeselectRowUrl" escape="false"/>',params,manageSelectDeselectRow,'json','get');
		$('#checkLoader'+rowId).removeClass('hidden');
		$(check).addClass('hidden');
	}
	function manageSelectDeselectRow(data){
		$('#checkLoader'+data.rowId).addClass('hidden');
		$('#select'+data.rowId+'Check').prop('checked',data.selected).removeClass('hidden');
	}
	function selectAllRows(){
		var check = $('#selectAllCheck'), sel = check.prop('checked');
		qamCall(sel ? '<s:property value="#selectAllRowsUrl"  escape="false" />' : '<s:property value="#unSelectAllRowsUrl"  escape="false" />',[],manageSelectAllRows,'json','get');
		check.addClass('hidden');
		$('#totalCheckLoader').removeClass('hidden');
	}
	function manageSelectAllRows(data){
		$('.row-check').each(function(){
			$(this).prop('checked',data.selected);
		});
		$('#selectAllCheck').removeClass('hidden');
		$('#totalCheckLoader').addClass('hidden');
	}
	function deleteConfigMetadata(url,code) {
		modal.confirm(code+', <s:text name="configMetadata.list.deleteConfirm" />',url);
	}
	function changeApplication(applicationCode){
		var actualApplication = $('.nav-application > .active').attr('id');
		if(!searching && applicationCode != actualApplication){
			$('#'+applicationCode).addClass('active disabled').siblings().removeClass('active disabled');
			$('#searchApplication').val(applicationCode);
			$('#searchSection').val('');
			$('#searchTask').val('changeApplication2');
			formSearch(true);
		}
	}
	function changeSection(sectionCode){
		var actualSection = $('.nav-section > .active').attr('id');
		if(!searching && sectionCode != actualSection){
			$('#'+(sectionCode?sectionCode:'allSections')).addClass('active disabled').siblings().removeClass('active disabled');
			$('#searchSection').val(sectionCode);
			formSearch(false);
		}
	}
	function checkAndGenerateScripts() {
		qamCall('<s:property value="#checkAndGenerateScriptsUrl" />',[], manageCheckAndGenerateScripts,'json','get');
	}
	function manageCheckAndGenerateScripts(data) {
		if (data.selectedListSize > 0) {
			document.location.href = '<s:property value="#generateScriptsUrl" />';
		} else {
			modal.alert('<s:text name="configMetadata.image.generateScripts"/>','<s:text name="configMetadata.select.selectAlmostOne"/>');
		}
	}
	function resetSearch(){
		$('#confCode').val('');
		$('#confKeyVal').val('');
		$('#clusterYN').find('input:checked').prop('checked',false);
		$('#clusterYN').find('input[value="Tutti"]').prop('checked',true);
	}
	searching = false;
	var theLoader, theDiv;
	function formSearch(appSec){
		if(!searching){
			if($('#collapseOne').hasClass('in')){$('#collapseLink').click();}
			search(appSec);
		}
		return false;
	}
	
	function search(appSec){
		if(!searching){
			if ($.type(appSec) === 'object'){ appSec = false;}<%-- nelle callback degli eventi viene passato un evento, ma deve esser considerato false! --%>
			searching = true;
			theLoader = '#ajaxloader'+(appSec ? '' : 'Inner');
			theDiv = '#configMetadata'+(appSec ? 'Section' : 'List')+'Div';
			$(theLoader).removeClass('hidden');
			$(theDiv).empty();
			parentDoResize();
			qamCall($('#searchForm').prop('action'),$('#searchForm').serializeArray(),manageSearch,'html','get');
		}
	}
	function manageSearch(data){
		searching = false;
		$('#filterSummaryDiv').children().removeClass('disabled');
		$(theLoader).addClass('hidden');
		$(theDiv).html(data);
		var secInput =  $('#searchSection'),
			section = secInput.val();
		if (!section) {
			var secId = $('.nav-section > .active').attr('id');
			secInput.val(secId == 'allSections' ? '' : secId);
		}
		$('.with-tooltip').tooltip();
		$('#searchTask').val('list2');
	}
	$(function(){
		$('.with-tooltip').tooltip();
		$(document).on('shown.bs.collapse hidden.bs.collapse',parentDoResize);
	});
	
	function createExcel() {
		document.location.href='<s:property value="#createCompleteExcelUrl" escape="false" />';
	}
	
</script>
</head>
<body class="container-fluid">
	<s:if test="!popUp"><jsp:include page="Header.jsp" flush="true" /></s:if>
	<div class="row">
		<div class="col-xs-12">
			<s:form action="configMetadata" id="searchForm" role="form" onsubmit="return formSearch(false);">
			<s:hidden name="task" id="searchTask" value="list2"/>
			<s:hidden name="configMetadataSearch.application" id="searchApplication"/>
			<s:hidden name="configMetadataSearch.section" id="searchSection"/>
			<div class="panel-group little-spacer-bottom" id="searchFilters">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="h4 panel-title">
								<a data-toggle="collapse" id="collapseLink" data-parent="#searchFilters" href="#collapseOne">
									<span id="collapseIcon" class="glyphicon glyphicon-minus"></span>&nbsp;
									<s:text name="configMetadata.list.title" />
								</a>
								<button type="submit" class="btn-default btn btn-xs pull-right"><span class="glyphicon glyphicon-repeat"></span></button>
							</div>
							<div id="filterSummaryDiv" class="spacer-top hidden filter-summary"></div><%--  contiene i filtri applicati --%>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12 col-sm-6 form-group">
										<label for="confCode"><s:text name="configMetadata.list.code"/></label>
										<s:textfield id="confCode" name="configMetadataSearch.code" maxlength="200" cssClass="form-control"/>
										<div class="help-block with-errors"></div>
									</div>
									<div class="col-xs-12 col-sm-6 form-group">
										<label for="confCode"><s:text name="configMetadata.list.keyValue"/></label>
										<s:textfield id="confKeyVal" name="configMetadataSearch.keyValue" maxlength="200" cssClass="form-control"/>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="row">
									<div class="form-group form-horizontal col-xs-12 col-sm-6 col-lg-3">
										<qs2:radioEnum label="configMetadata.list.clusterYN" name="configMetadataSearch.clusterYN"
											id="clusterYN" value="Tutti" defaultValue="Tutti"
											enumFullName="it.quix.framework.core.model.enumeration.ConfigSiNoEnum" ></qs2:radioEnum>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12 text-center">
										<button type="submit" class="btn btn-primary"><s:text name="button.search" />&nbsp;<span class="glyphicon glyphicon-search"></span></button>
										<button type="button" onclick="resetSearch();" class="btn btn-default"><s:text name="button.reset"/>&nbsp;<span class="glyphicon glyphicon-remove"></span></button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</s:form>
		</div>
	</div>
	<s:if test="applicationAttributeList != null && applicationAttributeList.size() > 0">
	<div class="row">
		<div class="col-xs-12">
			<ul class="nav nav-tabs nav-application">
				<s:iterator id="application" value="applicationAttributeList">
					<li id="<s:property value="#application.code"/>" class="<s:if test="#application.code == configMetadataSearch.application">active disabled</s:if>">
						<a href="javascript:changeApplication('<s:property value="#application.code"/>');"><s:property value="#application.description"/></a>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>
	</s:if>
	<jsp:include page="./_ajaxLoader.jsp" flush="true"/>
	<div id="configMetadataSectionDiv" class="row"><jsp:include page="./_configMetadataList.jsp" flush="true" /></div>
	<jsp:include page="./_modal.jsp" flush="true"/>
</body>
</html>	

