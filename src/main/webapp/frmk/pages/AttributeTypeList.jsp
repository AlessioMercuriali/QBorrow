<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<s:url id="createUrl" action="attributeType" includeParams="none" escapeAmp="false">
	<s:param name="task">edit</s:param>
	<s:param name="reset">true</s:param>
	<s:param name="popUp">true</s:param>
</s:url>
<s:url action="attributeType" id="selectDeselectRowUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">selectDeselectRow</s:param>
</s:url>
<s:url action="attributeType" id="selectAllRowsUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">selectAllRows2</s:param>
</s:url>
<s:url action="attributeType" id="unSelectAllRowsUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">unselectAllRows2</s:param>
</s:url>
<s:url action="attributeType" id="attributeTypeXmlExportPopupUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">attributeTypeXmlExportPopup</s:param>
	<s:param name="popUp">true</s:param>
</s:url>
<s:url action="attributeType" id="exportToXmlUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">exportToXml</s:param>
</s:url>
<s:url action="attributeType" id="attributeTypeXmlImportPopupUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">attributeTypeXmlImportPopup</s:param>
	<s:param name="popUp">true</s:param>
</s:url>
<s:url action="attributeType" id="importFromXmlUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">importFromXml</s:param>
	<s:param name="popUp">true</s:param>
</s:url>
<s:url id="emptyCacheUrl" action="attributeType" includeParams="none" escapeAmp="false">
	<s:param name="task">emptyCache</s:param>
</s:url>
<s:url id="checkAndGenerateScriptsUrl" action="attributeType" includeParams="none" escapeAmp="false">
	<s:param name="task">checkAndGenerateScripts</s:param>
</s:url>
<s:url id="generateScriptsUrl" action="attributeType" includeParams="none" escapeAmp="false">
	<s:param name="task">generateScripts</s:param>
</s:url>
<s:url id="createCompleteExcelUrl" action="attributeType" includeParams="none" escapeAmp="false">
	<s:param name="task">createExcel</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
<script type="text/javascript">
	var currentPageLinkBarTitle = '<s:text name="attributeType.search.title" />';


	function emptyCacheByType(url,type){
		modal.init('<s:text name="attributeType.image.emptyCache"/> - '+ type);
		modal.load(true);
		modal.display();
		qamCall(url,[],manageEmptyCache,'html','post');
	}
	function emptyCache(){
		modal.init('<s:text name="attributeType.image.emptyAllCache"/>');
		modal.load(true);
		modal.display();
		qamCall('<s:property value="#emptyCacheUrl" escape="false"/>',[],manageEmptyCache,'html','post');
	}
	function manageEmptyCache(data){
		var newDoc = document.open("text/html", "replace");
		newDoc.write(data);
		newDoc.close();
	}
	function listPage(url,page){
		$('#ajaxloader').removeClass('hidden');
		$('#attributeTypeListDiv').empty();
		parentDoResize();
		$('[name="attributeTypeSearch.page"]').val(page);
		qamCall(url,[],manageSearch,'html','get');
	}
	
	function createPage(){
		modal.init('<s:text name="attributeType.create.title"/>','<s:property value="#createUrl" escape="false" />');
		modal.display();
	}
	
	function askConfirm(url, title){
		modal.confirm(title,url);
	}

	function selectDeselectRow(check, attributeTypeId, rowId){
		var params = [
			{name:'selectedAttributeType',value:attributeTypeId},
			{name:'rowId',value:rowId}
		];
		qamCall('<s:property value="#selectDeselectRowUrl" />',params,manageSelectDeselectRow,'json','get');
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
	
	function importFormXmlPopup(){
		modal.init('<s:text name="attributeType.image.importFromXml"/>','<s:property value="#attributeTypeXmlImportPopupUrl" escape="false" />');
		modal.display();
	}
	function exportToXmlPopup(){
		modal.init('<s:text name="attributeType.image.exportToXml"/>','<s:property value="#attributeTypeXmlExportPopupUrl" escape="false" />');
		modal.display();
	}
	function exportToXml(exportAttributes){
		document.location.href='<s:property value="#exportToXmlUrl"/>&exportAttributes=' + exportAttributes;
	}
	function checkAndGenerateScripts() {
		qamCall('<s:property value="#checkAndGenerateScriptsUrl" />',[],manageCheckAndGenerateScripts,'json','get');
	}
	function manageCheckAndGenerateScripts(data) {
		if (data.selectedListSize > 0) {
			document.location.href = '<s:property value="#generateScriptsUrl" />';
		} else {
			modal.alert('<s:text name="attributeType.image.exportToXml"/>','<s:text name="attributeType.edit.selectAlmostOne"/>');
		}
	}
	
	function editAttType(url){
		modal.init('<s:text name="attributeType.edit.title"/>',url);
		modal.display();
	}
	

	function resetSearch(){
		$('#tipoAtt').val('');
		$('#descAtt').val('');
		$('#multiLinguaYN').find('input:checked').prop('checked',false);
		$('#multisocietaYN').find('input:checked').prop('checked',false);
		$('#ordinabileYN').find('input:checked').prop('checked',false);
		$('#cachebleYN').find('input:checked').prop('checked',false);
		$('#multiLinguaYN').find('input[value="Tutti"]').prop('checked',true);
		$('#multisocietaYN').find('input[value="Tutti"]').prop('checked',true);
		$('#ordinabileYN').find('input[value="Tutti"]').prop('checked',true);
		$('#cachebleYN').find('input[value="Tutti"]').prop('checked',true);
	}
	function formSearch(){
		$('[name="attributeTypeSearch.page"]').val(1);
		search();
		return false;
	}
	searching = false;
	function search(){
		if(!searching){
			searching = true;
			$('#ajaxloader').removeClass('hidden');
			$('#attributeTypeListDiv').empty();
			parentDoResize();
			if($('#collapseOne').hasClass('in')){$('#collapseLink').click();}
			qamCall($('#searchForm').prop('action'),$('#searchForm').serializeArray(),manageSearch,'html','get');
		}
	}
	function manageSearch(data){
		searching = false;
		$('#filterSummaryDiv').children().removeClass('disabled');
		$('#ajaxloader').addClass('hidden');
		$('#attributeTypeListDiv').html(data);
		$('.with-tooltip').tooltip();
		$('.long-descr').expander({collapseEffect:'fadeOut'});
	}
	$(function(){
		$('#searchForm').validator('validate');<%-- validazione del form di ricerca --%>
		$('.with-tooltip').tooltip();<%-- attivazione dei tooltip --%>
		$('.long-descr').expander({collapseEffect:'fadeOut'});<%-- attivazione del collapse per i testi lunghi --%>
		$(document).on('shown.bs.collapse hidden.bs.collapse',parentDoResize);
	});
	
	function createExcel() {
		document.location.href='<s:property value="#createCompleteExcelUrl" escape="false" />';
	}
	
</script>
</head>
<body class="container-fluid">
	<s:if test="!popUp"><jsp:include page="Header.jsp" flush="true"/></s:if>
	<div class="row">
		<div class="col-xs-12">
			<s:form action="attributeType" cssClass="form-horizontal" role="form" id="searchForm" onsubmit="return formSearch();">
				<s:hidden name="task" value="list2Page"/>
				<s:hidden name="reset" value="true"/>
				<s:hidden name="attributeTypeSearch.page" value="1"/>
				<div class="panel-group little-spacer-bottom" id="searchFiters">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="h4 panel-title">
								<a data-toggle="collapse" id="collapseLink" data-parent="#searchFiters" href="#collapseOne">
									<span id="collapseIcon" class="glyphicon glyphicon-minus"></span>&nbsp;
									<s:text name="attributeType.search.title" />
								</a>
								<button type="submit" class="btn-default btn btn-xs pull-right"><span class="glyphicon glyphicon-repeat"></span></button>
							</div>
							<div id="filterSummaryDiv" class="spacer-top hidden filter-summary"></div><%--  contiene i filtri applicati --%>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="form-group">
									<div class="control-group col-xs-12 col-sm-6">
										<label for="tipoAtt"><s:text name="attributeType.search.tipo"/></label>
										<s:textfield id="tipoAtt" name="attributeTypeSearch.tipo" cssClass="form-control"></s:textfield>
										<div class="help-block with-errors"></div>
									</div>
									<div class="control-group col-xs-12 col-sm-6">
										<label for="descAtt"><s:text name="attributeType.search.tipo_descrizione"/></label>
										<s:textfield id="descAtt" name="attributeTypeSearch.tipo_descrizione" cssClass="form-control"></s:textfield>
										<div class="help-block with-errors"></div>
									</div>
									<div class="clearfix hidden-sx"></div>
									<div class="control-group col-xs-12 col-sm-6 col-lg-3">
									<qs2:radioEnum label="attributeType.search.multilingua" name="attributeTypeSearch.multilinguaYN"
										id="multiLinguaYN" value="Tutti" defaultValue="Tutti"
										enumFullName="it.quix.framework.core.model.enumeration.AttributeTypeSiNoEnum" ></qs2:radioEnum>
									</div>
									<div class="control-group col-xs-12 col-sm-6 col-lg-3">
									<qs2:radioEnum label="attributeType.search.multisocieta" name="attributeTypeSearch.multisocietaYN"
										id="multisocietaYN" value="Tutti" defaultValue="Tutti"
										enumFullName="it.quix.framework.core.model.enumeration.AttributeTypeSiNoEnum" ></qs2:radioEnum>
									</div>
									<div class="clearfix visible-sm"></div>
									<div class="control-group col-xs-12 col-sm-6 col-lg-3">
										<qs2:radioEnum label="attributeType.search.ordinabile" name="attributeTypeSearch.ordinabileYN"
											id="ordinabileYN" value="Tutti" defaultValue="Tutti"
											enumFullName="it.quix.framework.core.model.enumeration.AttributeTypeSiNoEnum" ></qs2:radioEnum>
									</div>
									<div class="control-group col-xs-12 col-sm-6 col-lg-3">
										<qs2:radioEnum label="attributeType.search.cacheble" name="attributeTypeSearch.cachebleYN"
											id="cachebleYN" value="Tutti" defaultValue="Tutti"
											enumFullName="it.quix.framework.core.model.enumeration.AttributeTypeSiNoEnum" ></qs2:radioEnum>
									</div>
									<div class="control-group col-xs-12 col-sm-6">
										<label for="genere"><s:text name="attributeType.search.genere"/></label>
										<qs2:attribute2Input id="genere" name="attributeTypeSearch.genere" cssClass="form-control" type="FR004_GenereAttributeType" onlyActive="true" emptyOption="true" />
									<div class="help-block with-errors"></div>
								</div>
								</div>
								<div class="form-group">
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
	<jsp:include page="./_ajaxLoader.jsp"></jsp:include>
	<div id="attributeTypeListDiv" class="row"><jsp:include page="./_attributeTypeList.jsp" flush="true" /></div>
	<jsp:include page="./_modal.jsp"></jsp:include>
</body>
</html>		