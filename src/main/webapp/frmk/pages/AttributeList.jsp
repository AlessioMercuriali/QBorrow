<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="qf" uri="/quix-framework-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<!DOCTYPE html>
<s:url id="createUrl" action="attribute" includeParams="none" escapeAmp="false">
	<s:param name="task">edit</s:param>
	<s:param name="attributeType" value="%{attributeType.id}"></s:param>
	<s:param name="reset">true</s:param>
	<s:param name="noBack"><s:property value="noBack" /></s:param>
</s:url>
<s:url action="attribute" id="url" escapeAmp="false" includeParams="none">
	<s:param name="task">listPage</s:param>
	<s:param name="popUp"><s:property value="popUp" /></s:param>
	<s:param name="noBack"><s:property value="noBack" /></s:param>
</s:url>
<s:url action="attribute" id="backToAttributeTypeListUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">backToAttributeTypeList</s:param>
</s:url>
<s:url action="attribute" id="downloadExcelTemplateId" escapeAmp="false" includeParams="none">
	<s:param name="task">downloadExcelTemplate</s:param>
	<s:param name="popUp"><s:property value="popUp" /></s:param>
	<s:param name="noBack"><s:property value="noBack" /></s:param>
</s:url>
<s:url action="attribute" id="attributeUrl"  escapeAmp="false" includeParams="none">
	<s:param name="task">list2Page</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	function downloadExcelTemplate(nRecords){
		if(nRecords <= 65000){
			document.location.href='<s:property value="#downloadExcelTemplateId" escape="false" />';
		}else{
			modal.alert('<s:text name="attributeImportExcel.fileExcel"/>','<s:text name="attributeImportExcel.tooManyRecords"/>','warning');
		}
	}

	var currentPageLinkBarTitle = '<s:text name="attribute.search.title" />';
	
	function listPage(url,page){
		$('#ajaxloader').removeClass('hidden');
		$('#attributeListDiv').empty();
		parentDoResize();
		$('[name="attributeSearch.page"]').val(page);
		qamCall(url,[],manageSearch,'html','get');
	}
	
	function editAttribute(url){
		modal.init('<s:text name="attribute.edit.title"/>',url);
		modal.display();
	}
	function createPage(){
		modal.init('<s:text name="attribute.edit.title"/>','<s:property value="#createUrl" escape="false" />');
		modal.display();
	}
	
	function askConfirm(url,title){
		modal.confirm(title,url);
	}

	function backAttrTypeList(){
		document.location.href = '<s:property value="#backToAttributeTypeListUrl" escape="false" />';
	}
	function resetSearch(){
		$('#searchDatetimeTo').val('');
		$('#searchDatetimeFrom').val('');
		$('#attributeCode').val('');
		$('#attributeDescr').val('');
		$('#attributeOrganization').val('');
		$('#attributeLanguage').val('');
		var base = '#attributeAttribute';<%-- reset dei filtri sugli attributi estesi --%>
		for(var i = 1; i <= 10; ++i){
			$(base+'<s:text name="label.from"/>').val('');
			$(base+'<s:text name="label.to"/>').val('');
			$(base).val('');
			$(base).find('input:checked').prop('checked',false);
			$(base).find('input[value="Tutti"]').prop('checked',true);
		}
	}
	function formSearch(){
		$('[name="attributeSearch.page"]').val(1);
		search();
		return false;
	}
	searching = false;
	function search(){
		if(!searching){
			searching = true;
			$('#ajaxloader').removeClass('hidden');
			$('#attributeListDiv').empty();
			parentDoResize();
			if($('#collapseOne').hasClass('in')){$('#collapseLink').click();}
			qamCall($('#searchForm').prop('action'),$('#searchForm').serializeArray(),manageSearch,'html','get');
		}
	}
	function manageSearch(data){
		searching = false;
		$('#filterSummaryDiv').children().removeClass('disabled');
		$('#ajaxloader').addClass('hidden');
		$('#attributeListDiv').html(data);
		$('.with-tooltip').tooltip();
		$('.long-descr').expander({collapseEffect:'fadeOut'});
	}
	$(function(){
		$('#searchDatetimePickerFrom,#searchDatetimePickerTo').datetimepicker({language:'it',useSeconds:true}); <%-- inizializzazione dei calendari --%>
		<%-- correlazione dei calendari --%>
		$('#searchDatetimePickerFrom').on('dp.change dp.show',function(e){$('#searchDatetimePickerTo').data('DateTimePicker').setMinDate(e.date);});
		$('#searchDatetimePickerTo').on('dp.change dp.show',function(e){$('#searchDatetimePickerFrom').data('DateTimePicker').setMaxDate(e.date);});
		$('#searchForm').validator('validate');<%-- validazione del form di ricerca --%>
		$('.with-tooltip').tooltip();<%-- attivazione dei tooltip --%>
		$('.long-descr').expander({collapseEffect:'fadeOut'});<%-- attivazione del collapse per i testi lunghi --%>
		$(document).on('show.bs.collapse hidden.bs.collapse',parentDoResize);
	});
</script>
</head>
<body class="container-fluid">
	<s:if test="!popUp"><jsp:include page="Header.jsp" flush="true"/></s:if>
	<div class="row">
		<div class="col-xs-12">
			<s:form action="attribute" cssClass="form-horizontal" role="form" id="searchForm" onsubmit="return formSearch();">
				<s:hidden name="task" value="list2Page"/>
				<s:hidden name="reset" value="true"/>
				<s:hidden name="attributeSearch.page" value="1"/>
				<s:hidden name="noBack" />
				<div class="panel-group little-spacer-bottom" id="searchFiters">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="h4 panel-title">
								<a data-toggle="collapse" id="collapseLink" data-parent="#searchFiters" href="#collapseOne">
									<span id="collapseIcon" class="glyphicon glyphicon-minus"></span>&nbsp;
									<s:text name="attribute.search.title" />
								</a>
								<button type="submit" class="btn-default btn btn-xs pull-right"><span class="glyphicon glyphicon-repeat"></span></button>
							</div>
							<div id="filterSummaryDiv" class="spacer-top hidden filter-summary"></div><%--  contiene i filtri applicati --%>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="form-group">
									<div class="control-group col-xs-12 col-sm-6">
										<label for="searchDatetimeFrom"><s:text name="attribute.search.updateDate" />&nbsp;<s:text name="label.from"/></label>
										<qs2:bootstrapDtPicker name="attributeSearch.updateDateFrom" id="searchDatetimeFrom" groupId="searchDatetimePickerFrom"
											date="DD/MM/YYYY HH:mm:ss" errorDate="attribute.search.error.date"/>
										<div class="help-block with-errors"></div>
									</div>
									<div class="control-group col-xs-12 col-sm-6">
										<label for="searchDatetimeTo"><s:text name="attribute.search.updateDate" />&nbsp;<s:text name="label.to"/></label>
										<qs2:bootstrapDtPicker name="attributeSearch.updateDateTo" id="searchDatetimeTo" groupId="searchDatetimePickerTo"
											date="DD/MM/YYYY HH:mm:ss" errorDate="attribute.search.error.date"/>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<s:if test="attributeSearch.hasSearchableValues">
									<div class="form-group">
										<s:if test="attributeTypeCode.ricercaYN">
											<div class="control-group col-xs-12 col-sm-6 col-md-4 col-lg-3">
												<label for="attributeCode"><s:property value="labelsAndHelpersAttributesForEditMap.get('CODE_LABEL')"/></label>
												<s:textfield name="attributeSearch.code" id="attributeCode" cssClass="form-control"/>
												<div class="help-block with-errors"><s:property value="labelsAndHelpersAttributesForEditMap.get('CODE_HELPER')"/></div>
											</div>
										</s:if>
										<s:if test="attributeTypeDescr.ricercaYN">
											<div class="control-group col-xs-12 col-sm-6 col-md-4 col-lg-3">
												<label for="attributeDescr"><s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_LABEL')"/></label>
												<s:textfield name="attributeSearch.description" id="attributeDescr" cssClass="form-control"/>
												<div class="help-block with-errors"><s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_HELPER')"/></div>
											</div>
										</s:if>
										<s:if test="attributeType.multisocietaYN">
											<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
												<label for="attributeOrganization"><s:text name="attribute.search.organization"/></label>
												<s:textfield name="attributeSearch.organization" id="attributeOrganization" cssClass="form-control"/>
											</div>
										</s:if>
										<s:if test="attributeType.multilinguaYN">
											<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
												<label for="attributeLanguage"><s:text name="attribute.search.language"/></label>
												<s:textfield name="attributeSearch.language" id="attributeLanguage" cssClass="form-control"/>
											</div>
										</s:if>
										<div class="clearfix hidden-sx"></div>
									<s:set var="searchAtt" value="0"/>
									<s:iterator id="atAttribute" value="attributeTypeAttributes" status="atAttributeStatus">
										<s:if test="#atAttribute.ricercaYN">
											<s:if test="#searchAtt % 2 == 0 && #searchAtt != 0"><div class="clearfix hidden-sx"></div></s:if>
											<s:set var="attIndex" value="#atAttributeStatus.index + 1" /><s:set var="searchAtt" value="%{#searchAtt+1}"/>
											<qf:attributeSearchDisplayAttribute onlyActive="true" attributeType="%{'attributeTypeAttributes['+#atAttributeStatus.index+'].tipo'}"
												attributeFullName="'attributeSearch.attribute'+#attIndex" attributeFullNameFrom="'attributeSearch.attribute'+#attIndex+'From'" attributeFullNameTo="'attributeSearch.attribute'+#attIndex+'To'" altroAttributeListName="'attribute'+#attIndex+'AltriAttributeList'"
												attributeIndex="%{#attIndex}"/>
										</s:if>
									</s:iterator>
									</div>
								</s:if>
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
	<div id="attributeListDiv" class="row"><jsp:include page="./_attributeList.jsp" flush="true" /></div>
	<jsp:include page="./_modal.jsp"></jsp:include>
</body>
</html>		