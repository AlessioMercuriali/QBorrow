<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<s:url action="scheduler" id="createUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">editContext</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<s:url action="scheduler" id="backUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">listJob</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	function createPage(){
		modal.init('<s:text name="scheduler.context.edit.title"/>','<s:property value="#createUrl" escape="false" />');
		modal.display();
	}
	function editContext(url){
		modal.init('<s:text name="scheduler.context.edit.title"/>',url);
		modal.display();
	}
	function deleteContext(url){
		qamCall(url,[],null,'json','get');
		search();
	}
	function backToJobList(){
		document.location.href = '<s:property value="#backUrl" escape="false" />';
	}
	function listPage(url,page){
		$('#ajaxloader').removeClass('hidden');
		$('#contextListDiv').empty();
		$('[name="searchJobContext.page"]').val(page);
		parentDoResize();
		qamCall(url,[],manageSearch,'html','get');
	}
	function resetSearch(){
		$('#nome').val('');
		$('#url').val('');
	}
	function formSearch(){
		search();
		return false;
	}
	searching = false;
	function search(){
		if(!searching){
			searching = true;
			$('#ajaxloader').removeClass('hidden');
			$('#contextListDiv').empty();
			parentDoResize();
			if($('#collapseOne').hasClass('in')){$('#collapseLink').click();}
			qamCall($('#searchForm').attr('action'),$('#searchForm').serializeArray(),manageSearch,'html','get');
		}
	}
	function manageSearch(data){
		searching = false;
		$('#filterSummaryDiv').children().removeClass('disabled');
		$('#ajaxloader').addClass('hidden');
		$('#contextListDiv').html(data);
		$('.with-tooltip').tooltip();
	}
	$(function(){
		$('#searchForm').validator('validate');<%-- validazione del form di ricerca --%>
		$('.with-tooltip').tooltip();<%-- attivazione dei tooltip --%>
		$(document).on('shown.bs.collapse hidden.bs.collapse',parentDoResize);
	});
	</script>	
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true"/>
	<div class="row">
		<div class="col-xs-12">
			<s:form action="scheduler" cssClass="form-horizontal" role="form" id="searchForm" onsubmit="return formSearch();">
				<s:hidden name="task" value="listJobContextPage"/>
				<s:hidden name="reset" value="true"/>
				<s:hidden name="searchJobContext.page" value="1"/>
				<div class="panel-group little-spacer-bottom" id="searchFiters">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="h4 panel-title">
								<a data-toggle="collapse" id="collapseLink" data-parent="#searchFiters" href="#collapseOne">
									<span id="collapseIcon" class="glyphicon glyphicon-minus"></span>&nbsp;
									<s:text name="scheduler.context.search.title" />
								</a>
							</div>
							<div id="filterSummaryDiv" class="spacer-top hidden filter-summary"></div><%--  contiene i filtri applicati --%>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="form-group">
									<div class="control-group col-xs-12 col-sm-6">
										<label for="nome"><s:text name="scheduler.context.search.name"/></label>
										<s:textfield id="nome" name="searchJobContext.name" cssClass="form-control"></s:textfield>
										<div class="help-block with-errors"></div>
									</div>
									<div class="control-group col-xs-12 col-sm-6">
										<label for="url"><s:text name="scheduler.context.search.url"/></label>
										<s:textfield id="url" name="searchJobContext.url" cssClass="form-control"></s:textfield>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 text-center">
										<s:submit cssClass="btn btn-primary" key="button.search" />
										<qs2:button onclick="resetSearch();" clazz="btn btn-default" label="button.reset"/>
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
	<div id="contextListDiv" class="row"><jsp:include page="./_jobContextList.jsp" flush="true" /></div>
	<jsp:include page="./_modal.jsp"></jsp:include>
</body>
</html>