<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<s:url action="logger" id="listUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">listPage</s:param>
</s:url>
<s:url action="logger" id="updateLogUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">updateLog2</s:param>
</s:url>
<s:url action="logger" id="createLogUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">create</s:param>
</s:url>
<s:url action="logger" id="systemListUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">systemList</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	var toUpdate = [];
	function updateLog(loggerName, idx){
		var $sel = $('#selLevel'+idx), addon = $sel.siblings('.input-group-addon'),
			newAdd = $('<span/>').addClass('input-group-addon').append($('<img/>').attr('src','<qs2:imagesPath framework="true" nome="/mini-ajax-loader.gif"/>'));
		console.log($sel.val()+'\n'+loggerName+'\n'+idx);
		toUpdate.push({sel:$sel,idx:idx,addon:addon});
		var params =[{name:'loggerName',value:escape(loggerName)},
			{name:'level',value:escape($sel.val())}];
		$sel.prop('disabled',true).siblings('.input-group-addon').replaceWith(newAdd);
		qamCall('<s:property value="#updateLogUrl" escape="false" />',params,manageUpdateLog,'json','post');
	}
	function manageUpdateLog(data){
		var el = toUpdate.shift();
		el.sel.prop('disabled',false).siblings('.input-group-addon').replaceWith(el.addon);
		$('#logLevel_'+el.idx).text(el.sel.val());
	}
	function createPage(){
		modal.init('<s:text name="logger.edit.title"/>', '<s:property value="#createLogUrl" escape="false" />');
		modal.display();
	}
	function systemLogList(){
		modal.init('<s:text name="logger.system.title"/>', '<s:property value="#systemListUrl" escape="false" />');
		modal.display();
	}
	function listPage(page){
		$('#ajaxloader').removeClass('hidden');
		$('#logListDiv').empty();
		parentDoResize();
		qamCall('<s:property value="#listUrl"/>',[{name:'page',value:page}],manageSearch,'html','get');
	}
	function resetSearch(){
		$('#loggerName').val('');
		$('#logLeve').val('');
	}
	searching = false;
	function formSearch(){
		if(!searching){
			searching = true;
			$('#ajaxloader').removeClass('hidden');
			$('#logListDiv').empty();
			parentDoResize();
			if($('#collapseOne').hasClass('in')){$('#collapseLink').click();}
			qamCall($('#searchForm').prop('action'),$('#searchForm').serializeArray(),manageSearch,'html','get');
		}
		return false;
	}
	function manageSearch(data){
		searching = false;
		$('#filterSummaryDiv').children().removeClass('disabled');
		$('#ajaxloader').addClass('hidden');
		$('#logListDiv').html(data);
		$('.with-tooltip').tooltip();
	}
	$(function(){
		$('.with-tooltip').tooltip();
		$(document).on('shown.bs.collapse hidden.bs.collapse',parentDoResize);
	});
	</script>
</head>
<body class="container-fluid">
	<jsp:include page="Header.jsp" flush="true" />
	<div class="row">
		<div class="col-xs-12">
			<s:form action="logger" id="searchForm" role="form" onsubmit="return formSearch();" cssClass="form-horizontal">
				<s:hidden name="task" value="listPage"/>
				<s:hidden name="reset" value="true"/>
				<div class="panel-group little-spacer-bottom" id="searchFiters">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="h4 panel-title">
								<a data-toggle="collapse" id="collapseLink" data-parent="#searchFiters" href="#collapseOne">
									<span id="collapseIcon" class="glyphicon glyphicon-minus"></span>&nbsp;
									<s:text name="logger.title" />
								</a>
							</div>
							<div id="filterSummaryDiv" class="spacer-top hidden filter-summary"></div><%--  contiene i filtri applicati --%>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="form-group">
									<div class="col-xs-12 col-sm-6 col-md-8">
										<label for="loggerName"><s:text name="logger.search.name"/></label>
										<s:textfield id="loggerName" name="nameSearch" cssClass="form-control"/>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-4">
										<label for="logLevel"><s:text name="logger.search.level"/></label>
										<select id="logLevel" name="levelSearch" class="form-control">
											<option value="">&nbsp;</option>
											<option value="DEBUG">DEBUG</option>
											<option value="INFO">INFO</option>
											<option value="WARN">WARN</option>
											<option value="ERROR">ERROR</option>
											<option value="FATAL">FATAL</option>
										</select>
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
	<jsp:include page="./_ajaxLoader.jsp" flush="true"/>
	<div id="logListDiv" class="row"><jsp:include page="_log.jsp" flush="true"/></div>
	<jsp:include page="./_modal.jsp" flush="true"/>
</body>
</html>

