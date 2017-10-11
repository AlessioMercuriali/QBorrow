<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<s:url action="scheduler" id="backUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">listJob</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<s:url action="scheduler" id="refreshUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">listJobRunning</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<s:url action="scheduler" id="runninListUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">listJobRunningPage</s:param>
</s:url>
<s:url action="scheduler" id="stopJobRunningUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">stopJobRunning</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	function backToJobList(){
		document.location.href = '<s:property value="#backUrl" escape="false" />';
	}
	function updateJobRunningList(){
		$('#ajaxloaderRunning').removeClass('hidden');
		$('#runningList').empty();
		qamCall('<s:property value="#runninListUrl"/>',[],manageJobRunningUpdate,'html','get');
	}
	function manageJobRunningUpdate(data) {
		$('#ajaxloaderRunning').addClass('hidden');
		$('#runningList').html(data);
	}
	function listPage(url,page){
		$('#ajaxloaderHistory').removeClass('hidden');
		$('#historyListDiv').empty();
		parentDoResize();
		$('[name="searchJobHistory.page"]').val(page);
		qamCall(url,[],manageSearch,'html','get');
	}
	function formSearch(){
		$('[name="searchJobHistory.page"]').val(1);
		search();
		return false;
	}
	searching = false;
	function search(){
		if(!searching){
			searching = true;
			$('#ajaxloaderHistory').removeClass('hidden');
			$('#historyListDiv').empty();
			parentDoResize();
			if($('#collapseOne').hasClass('in')){$('#collapseLink').click();}
			var form = $('#searchHistoryForm')
			qamCall(form.prop('action'),form.serializeArray(),manageSearch,'html','get');
		}
	}
	function manageSearch(data){
		searching = false;
		$('#filterSummaryDiv').children().removeClass('disabled');
		$('#ajaxloaderHistory').addClass('hidden');
		$('#historyListDiv').html(data);
		$('.with-tooltip').tooltip();
	}
	$(function(){
		$('#searchHistoryForm').validator('validate');<%-- validazione del form di ricerca --%>
		$('.with-tooltip').tooltip();<%-- attivazione dei tooltip --%>
		$('#dateStartFromPicker,#dateStartToPicker,#dateEndFromPicker,#dateEndToPicker').datetimepicker({language:'it',useSeconds:true});<%-- inizializzazione dei calendari --%>
		<%-- correlazione dei calendari --%>
		$('#dateStartFromPicker').on('dp.change dp.show',function(e){$('#dateStartToPicker').data('DateTimePicker').setMinDate(e.date);});
		$('#dateStartToPicker').on('dp.change dp.show',function(e){$('#dateStartFromPicker').data('DateTimePicker').setMaxDate(e.date);});
		$('#dateEndFromPicker').on('dp.change dp.show',function(e){$('#dateEndToPicker').data('DateTimePicker').setMinDate(e.date);});
		$('#dateEndToPicker').on('dp.change dp.show',function(e){$('#dateEndFromPicker').data('DateTimePicker').setMaxDate(e.date);});
		$(document).on('shown.bs.collapse hidden.bs.collapse',parentDoResize);
	});

	function stopJob(jobName, jobContext) {
		if (confirm('Sei sicuro di voler stoppare questo job?\nTutte le istanze dello stesso job saranno stoppate.')) {
			var url = '<s:property value="#stopJobRunningUrl" />&jobName=' + jobName + '&jobRunningContext=' + jobContext;
			qamCall(url,[],manageStopJob,'json','get');
		}
	}
	
	function manageStopJob(data) {
		if (data.success) {
			updateJobRunningList();
		} else {
			alert('Non ho potuto stoppare il job');
		}
	}
	</script>
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="row" id="runningList"><jsp:include page="./_jobRunningList.jsp" flush="true" /></div>
	<jsp:include page="./_ajaxLoader.jsp">
		<jsp:param value="Running" name="innerId"/>
	</jsp:include>
	<hr/>
	<div class="row">
		<div class="col-xs-12">
			<s:form action="scheduler" cssClass="form-horizontal" role="form" id="searchHistoryForm" onsubmit="return formSearch();">
				<s:hidden name="task" value="listJobHistoryPage"/>
				<s:hidden name="reset" value="true"/>
				<s:hidden name="searchJobHistory.page" value="1"/>
				<div class="panel-group little-spacer-bottom" id="searchFilters">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="h4 panel-title">
								<a data-toggle="collapse" id="collapseLink" data-parent="#searchFilters" href="#collapseOne">
									<span id="collapseIcon" class="glyphicon glyphicon-plus"></span>&nbsp;
									<s:text name="scheduler.history.search.title" />
								</a>
								<button type="submit" class="btn-default btn-xs btn pull-right"><span class="glyphicon glyphicon-repeat"></span></button>
							</div>
							<div id="filterSummaryDiv" class="spacer-top hidden filter-summary"></div><%--  contiene i filtri applicati --%>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="form-group">
									<div class="control-group col-xs-12 col-sm-6">
										<label for="nome"><s:text name="scheduler.history.search.name"/></label>
										<s:textfield id="nome" name="searchJobHistory.name" cssClass="form-control"></s:textfield>
										<div class="help-block with-errors"></div>
									</div>
									<div class="control-group col-xs-12 col-sm-6">
										<label for="context"><s:text name="scheduler.history.search.context"/></label>
										<s:select emptyOption="true" id="context" name="searchJobHistory.context" cssClass="form-control" list="allContextList"/>
										<div class="help-block with-errors"></div>
									</div>
									<div class="clearfix hidden-sx"></div>
									<div class="control-group col-xs-12 col-sm-6 col-md-4">
										<label for="risultato"><s:text name="scheduler.history.search.result"/></label>
										<s:select emptyOption="true" id="risultato" name="searchJobHistory.result" cssClass="form-control" list="@it.quix.framework.core.model.enumeration.JobResultEnum@values()"/>
										<div class="help-block with-errors"></div>
									</div>
									<div class="control-group col-xs-12 col-sm-6 col-md-4">
										<label for="clusterNode"><s:text name="scheduler.history.search.nodeName"/></label>
										<s:select emptyOption="true" id="clusterNode" name="searchJobHistory.nodeName" cssClass="form-control" list="clusters" value="searchJobHistory.nodeName"/>
										<div class="help-block with-errors"></div>
									</div>
									<div class="clearfix visible-sm"></div>
									<div class="control-group col-xs-12 col-sm-6 col-md-4">
										<label for="stato"><s:text name="scheduler.history.search.state"/></label>
										<s:select emptyOption="true" id="stato" name="searchJobHistory.state" cssClass="form-control" list="{@it.quix.framework.core.model.enumeration.JobRunningStateEnum@ABORTED.name(),@it.quix.framework.core.model.enumeration.JobRunningStateEnum@FINISHED.name()}"/>
										<div class="help-block with-errors"></div>
									</div>
									<div class="clearfix hidden-sx hidden-sm"></div>
									<div class="control-group col-xs-12 col-sm-6 col-md-3">
										<label for="dateStartFrom"><s:text name="scheduler.history.search.dateStartFrom"/></label>
										<qs2:bootstrapDtPicker name="searchJobHistory.dateStartFrom" id="dateStartFrom" groupId="dateStartFromPicker"
											date="DD/MM/YYYY HH:mm:ss" errorDate="scheduler.history.error.date"/>
										<div class="help-block with-errors"></div>
									</div>
									<div class="clearfix visible-sm"></div>
									<div class="control-group col-xs-12 col-sm-6 col-md-3">
										<label for="dateStartTo"><s:text name="scheduler.history.search.dateStartTo"/></label>
										<qs2:bootstrapDtPicker name="searchJobHistory.dateStartTo" id="dateStartTo" groupId="dateStartToPicker"
											date="DD/MM/YYYY HH:mm:ss" errorDate="scheduler.history.error.date"/>
										<div class="help-block with-errors"></div>
									</div>
									<div class="control-group col-xs-12 col-sm-6 col-md-3">
										<label for="dateEndFrom"><s:text name="scheduler.history.search.dateEndFrom"/></label>
										<qs2:bootstrapDtPicker name="searchJobHistory.dateEndFrom" id="dateEndFrom" groupId="dateEndFromPicker"
											date="DD/MM/YYYY HH:mm:ss" errorDate="scheduler.history.error.date"/>
										<div class="help-block with-errors"></div>
									</div>
									<div class="clearfix visible-sm"></div>
									<div class="control-group col-xs-12 col-sm-6 col-md-3">
										<label for="dateEndTo"><s:text name="scheduler.history.search.dateEndTo"/></label>
										<qs2:bootstrapDtPicker name="searchJobHistory.dateEndTo" id="dateEndTo" groupId="dateEndToPicker"
											date="DD/MM/YYYY HH:mm:ss" errorDate="scheduler.history.error.date"/>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 text-center">
										<button type="submit" class="btn btn-primary"><s:text name="button.search" />&nbsp;<span class="glyphicon glyphicon-search"></span></button>
										<button type="reset"class="btn btn-default"><s:text name="button.reset"/>&nbsp;<span class="glyphicon glyphicon-remove"></span></button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</s:form>
		</div>
	</div>
	<jsp:include page="./_ajaxLoader.jsp">
		<jsp:param value="History" name="innerId"/>
	</jsp:include>
	<div id="historyListDiv" class="row"><jsp:include page="./_jobHistoryList.jsp" flush="true" /></div>
</body>
</html>
