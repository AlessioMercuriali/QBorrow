<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<s:url id="resetUrl" action="lockManager" includeParams="none" escapeAmp="false">
	<s:param name="task">list</s:param>
	<s:param name="reset">true</s:param>
</s:url>
<s:url action="lockManager" id="url" escapeAmp="false" includeParams="none">
	<s:param name="task">listPage</s:param>
	<s:param name="popUp"><s:property value="popUp" /></s:param>
</s:url>
<s:url action="lockManager" id="openCloseItemUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">openCloseItem</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	function listPage(url,page){
		$('#ajaxloader').removeClass('hidden');
		$('#attributeTypeListDiv').empty();
		parentDoResize();
		$('[name="lockGroupSearch.page"]').val(page);
		qamCall(url,[],manageSearch,'html','get');
	}
	function askConfirmUnlock(url, numLock){
		modal.confirm('<s:text name="lockManagerGroup.list.askConfirmUnlock"/> '+numLock+'?',url);
	}
	function askConfirmForceUnlock(url, numLock){
		modal.confirm('<s:text name="lockManagerGroup.list.askConfirmForceUnlock"/> '+numLock+'?',url);
	}
	function resetSearch(){
		$('#numLock').val('');
		$('#lockUser').val('');
		$('#lockTimeTo').val('');
		$('#lockTimeFrom').val('');
		$('#checkTimeTo').val('');
		$('#checkTimeFrom').val('');
		$('#machineName').val('');
		$('#searchSystem').find('input:checked').prop('checked',false);
		$('#searchSystem').find('input[value="Tutti"]').prop('checked',true);
	}
	function formSearch(){
		$('[name="lockGroupSearch.page"]').val(1);
		search();
		return false;
	}
	searching = false;
	function search(){
		if(!searching){
			searching = true;
			$('#ajaxloader').removeClass('hidden');
			$('#lockGroupListDiv').empty();
			parentDoResize();
			if($('#collapseOne').hasClass('in')){$('#collapseLink').click();}
			qamCall($('#searchForm').prop('action'),$('#searchForm').serializeArray(),manageSearch,'html','get');
		}
	}
	function manageSearch(data){
		searching = false;
		$('#filterSummaryDiv').children().removeClass('disabled');
		$('#ajaxloader').addClass('hidden');
		$('#lockGroupListDiv').html(data);
		$('.with-tooltip').tooltip();
	}
	$(function(){
		$('#searchForm').validator();
		$('#locktimeFromPicker,#locktimeToPicker,#checkTimeFromPicker,#checkTimeToPicker').datetimepicker({language:'it',useSeconds:true}); <%-- inizializzazione dei calendari --%>
		<%-- correlazione dei calendari --%>
		$('#locktimeFromPicker').on('dp.change dp.show',function(e){$('#locktimeToPicker').data('DateTimePicker').setMinDate(e.date);});
		$('#locktimeToPicker').on('dp.change dp.show',function(e){$('#locktimeFromPicker').data('DateTimePicker').setMaxDate(e.date);});
		$('#checkTimeFromPicker').on('dp.change dp.show',function(e){$('#checkTimeToPicker').data('DateTimePicker').setMinDate(e.date);});
		$('#checkTimeToPicker').on('dp.change dp.show',function(e){$('#checkTimeFromPicker').data('DateTimePicker').setMaxDate(e.date);});
		$('.with-tooltip').tooltip();
		$(document).on('shown.bs.collapse hidden.bs.collapse',parentDoResize);
	});
	</script>
</head>
<body class="container-fluid">
	<s:if test="!popUp"><jsp:include page="Header.jsp" flush="true" /></s:if>
	<div class="row">
		<div class="col-xs-12">
			<s:form action="lockManager" cssClass="form-horizontal" role="form" id="searchForm" onsubmit="return formSearch();">
				<s:hidden name="task" value="listPage"/>
				<s:hidden name="reset" value="true"/>
				<s:hidden name="lockGroupSearch.page" value="1"/>
				<div class="panel-group little-spacer-bottom" id="searchFilters">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="h4 panel-title">
								<a data-toggle="collapse" id="collapseLink" data-parent="#searchFilters" href="#collapseOne">
									<span id="collapseIcon" class="glyphicon glyphicon-minus"></span>&nbsp;
									<s:text name="lockManager.search.title" />
								</a>
								<button type="submit" class="btn-default btn btn-xs pull-right"><span class="glyphicon glyphicon-repeat"></span></button>
							</div>
							<div id="filterSummaryDiv" class="spacer-top hidden filter-summary"></div><%--  contiene i filtri applicati --%>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="form-group"><%-- numLock, lockUser --%>
									<div class="col-xs-12 col-sm-6">
										<label for="numLock"><s:text name="lockManager.search.numLock"/></label>
										<s:textfield id="numLock" name="lockGroupSearch.numLock" cssClass="form-control"/>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label for="lockUser"><s:text name="lockManager.search.lockUser"/></label>
										<s:textfield id="lockUser" name="lockGroupSearch.lockUser" cssClass="form-control"/>
									</div>
								</div>
								<div class="form-group"><%-- lockTime, checkTime --%>
									<div class="control-group col-xs-12 col-sm-6 col-md-4 col-lg-3">
										<label for="lockTimeFrom"><s:text name="lockManager.search.lockTime" />&nbsp;<s:text name="label.from" /></label>
										<qs2:bootstrapDtPicker id="lockTimeFrom" groupId="locktimeFromPicker" date="DD/MM/YYYY HH:mm:ss" name="lockGroupSearch.lockTimeFrom" />	
									</div>
									<div class="control-group col-xs-12 col-sm-6 col-md-4 col-lg-3">
										<label for="lockTimeTo"><s:text name="lockManager.search.lockTime" />&nbsp;<s:text name="label.to" /></label>
										<qs2:bootstrapDtPicker id="lockTimeTo" groupId="locktimeToPicker" date="DD/MM/YYYY HH:mm:ss" name="lockGroupSearch.lockTimeTo" />
									</div>
									<div class="control-group col-xs-12 col-sm-6 col-md-4 col-lg-3">
										<label for="checkTimeFrom"><s:text name="lockManager.search.checkTime" />&nbsp;<s:text name="label.from" /></label>
										<qs2:bootstrapDtPicker id="checkTimeFrom" groupId="checkTimeFromPicker" date="DD/MM/YYYY HH:mm:ss" name="lockGroupSearch.checkTimeFrom" />
									</div>
									<div class="control-group col-xs-12 col-sm-6 col-md-4 col-lg-3">
										<label for="checkTimeTo"><s:text name="lockManager.search.checkTime" />&nbsp;<s:text name="label.to" /></label>
										<qs2:bootstrapDtPicker id="checkTimeTo" groupId="checkTimeToPicker" date="DD/MM/YYYY HH:mm:ss" name="lockGroupSearch.checkTimeTo" />
									</div>
								</div>
								<div class="form-group"><%-- machineName, system --%>
									<div class="col-xs-12 col-sm-6">
										<label for="machineName"><s:text name="lockManager.search.machineName"/></label>
										<s:textfield id="machineName" name="lockGroupSearch.machineName" cssClass="form-control"/>
									</div>
									<div class="col-xs-12 col-sm-6">
										<qs2:radioEnum id="searchSystem" label="lockManager.search.system" name="lockGroupSearch.system" value="Tutti" defaultValue="Tutti"
											enumFullName="it.quix.framework.core.model.enumeration.LockManagerSiNoEnum" ></qs2:radioEnum>
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
	<div id="lockGroupListDiv" class="row"><jsp:include page="./_lockManagerGroupList.jsp" flush="true" /></div>
	<jsp:include page="./_modal.jsp" flush="true"/>
</body>
</html>	