<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<s:url action="scheduler" id="createUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">edit</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<s:url action="scheduler" id="resetSchedulerUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">resetScheduler</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<s:url action="scheduler" id="contextListUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">listJobContext</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<s:url action="scheduler" id="executionListUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">listJobExcecution</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<link rel="stylesheet" type="text/css" href="<qs2:themesPath framework="true" nome="/jquery.cron.css"/>">
	<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/jquery.cron.js"/>"></script>
	<script type="text/javascript">
	function createPage(){
		modal.init('<s:text name="scheduler.job.edit.title"/>','<s:property value="#createUrl" escape="false" />');
		modal.display();
	}
	function editJob(url){
		modal.init('<s:text name="scheduler.job.edit.title"/>',url);
		modal.display();
	}
	function forceStartJob(url){
		modal.alert('<s:text name="scheduler.job.start"/>', '<s:text name="scheduler.job.willstart"/>', 'info');
		qamCall(url,[],manageStartJob,'json','post');
	}
	function manageStartJob(data){
		if(data.success) listaRunning();
		else {
			$(document).one('hidden.bs.modal',function(){
				modal.alert('<s:text name="scheduler.job.notstart"/>', '<s:text name="scheduler.job.wontstart"/>', 'warning');
			});
			modal.disable();
		}
	}
	function deleteJob(url,title){
		modal.confirm(title,url);
	}
	function listaContext(){
		document.location.href = '<s:property value="#contextListUrl" escape="false"/>';
	}
	function listaEsecuzioni(){
		document.location.href = '<s:property value="#executionListUrl" escape="false"/>';
	}
	function resetScheduler(){
		qamCall('<s:property value="#resetSchedulerUrl" escape="false" />',[],null,'html','get');
		search();
	}
	function listPage(url,page){
		$('#ajaxloader').removeClass('hidden');
		$('#jobListDiv').empty();
		parentDoResize();
		$('[name="searchJob.page"]').val(page);
		qamCall(url,[],manageSearch,'html','get');
	}
	function resetSearch(){
		$('#nome').val('');
		$('#context').val('');
	}
	function formSearch(){
		$('[name="searchJob.page"]').val(1);
		search();
		return false;
	}
	searching = false;
	function search(){
		if(!searching){
			searching = true;
			$('#ajaxloader').removeClass('hidden');
			$('#jobListDiv').empty();
			parentDoResize();
			if($('#collapseOne').hasClass('in')){$('#collapseLink').click();}
			qamCall($('#searchForm').prop('action'),$('#searchForm').serializeArray(),manageSearch,'html','get');
		}
	}
	function manageSearch(data){
		searching = false;
		$('#filterSummaryDiv').children().removeClass('disabled');
		$('#ajaxloader').addClass('hidden');
		$('#jobListDiv').html(data);
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
				<s:hidden name="task" value="listJobPage"/>
				<s:hidden name="reset" value="true"/>
				<s:hidden name="searchJob.page" value="1"/>
				<div class="panel-group little-spacer-bottom" id="searchFilters">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="h4 panel-title">
								<a data-toggle="collapse" id="collapseLink" data-parent="#searchFilters" href="#collapseOne">
									<span id="collapseIcon" class="glyphicon glyphicon-minus"></span>&nbsp;
									<s:text name="scheduler.job.search.configured" />
								</a>
								<button type="submit" class="btn-default btn btn-xs pull-right"><span class="glyphicon glyphicon-repeat"></span></button>
							</div>
							<div id="filterSummaryDiv" class="spacer-top hidden filter-summary"></div><%--  contiene i filtri applicati --%>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="form-group">
									<div class="control-group col-xs-12 col-sm-6">
										<label for="nome"><s:text name="scheduler.job.search.name"/></label>
										<s:textfield id="nome" name="searchJob.name" cssClass="form-control"></s:textfield>
										<div class="help-block with-errors"></div>
									</div>
									<div class="control-group col-xs-12 col-sm-6">
										<label for="context"><s:text name="scheduler.job.search.context"/></label>
										<s:select emptyOption="true" id="context" name="searchJob.context" cssClass="form-control" list="allContextList"/>
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
	<div id="jobListDiv" class="row"><jsp:include page="./_jobList.jsp" flush="true" /></div>
	<jsp:include page="./_modal.jsp"></jsp:include>
</body>
</html>
