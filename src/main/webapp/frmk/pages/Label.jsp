<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<s:url id="organizationByApplicationUrl" action="label" includeParams="none" escapeAmp="false">
	<s:param name="task">selectOrganizationByApplication</s:param> 
</s:url>
<s:url action="label"  id="statusMessageUrl" includeParams="none" escapeAmp="false">
	<s:param name="task">statusMessage</s:param>
</s:url>
<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	function loadOrganization(sel){
		var $sel = $(sel);
		if ($sel.val() != ''){
			params = [{name:'applicationForAjaxSelect',value:$sel.val()}];
			qamCall('<s:property value="#organizationByApplicationUrl" />',params, ($sel.attr('id') == 'upApp' ? setUpOrganization : setDownOrganization),'json','get');
			return;
		}
		($sel.attr('id') == 'upApp' ? setUpOrganization : setDownOrganization)([]);
	}
	function setUpOrganization(data){
		setOrganizationListResult(data,'#upOrg','#upForm');
	}
	function setDownOrganization(data){
		setOrganizationListResult(data,'#downOrg','#downForm');
	}
	
	function setOrganizationListResult(data,sel,form){
		var $sel = $(sel).empty();
		data.forEach(function(item){
			var opt = $('<option/>').attr('value',item.value).text(item.description);
			$sel.append(opt);
		});
		$(form).validator('validate');
	}
	function checkStatusMessage(){
		qamCall('<s:property value="#statusMessageUrl"  escape="false" />',[], checkStatusMessageResponse,'json','get');
		
	}
	function checkStatusMessageResponse(data){
		console.log(data);
		if(data.status == "RUNNING"){
			if(modal.isDisplayed()) modal.disable();
			modal.alert('<s:text name="label.action.upload"/>',data.msg);
		}
		if(data.status == "OK"){
			if(modal.isDisplayed()) modal.disable();
			modal.alert('<s:text name="label.action.upload"/>',data.msg,'success');
			stopRequest();
		}
		if(data.status == "ERROR"){
			if(modal.isDisplayed()) modal.disable();
			modal.alert('<s:text name="label.action.upload"/>',data.msg,'danger');
			stopRequest();
		} else stopRequest();
	}
	function stopRequest(){
		clearInterval(checkInt);
		checkInt = 0;
	}
	var checkInt = 0;
	$(function(){
		$('#upForm,#downForm').validator('validate');
		checkInt = setInterval(checkStatusMessage,1000);
	})
	</script>
</head>
<body class="container-fluid">
	<s:if test="!popUp"><jsp:include page="./Header.jsp" flush="true"/></s:if>
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-default">
				<div class="panel-heading"><h4 class="panel-title"><s:text name="label.title" /></h4></div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<hr/><p class="h4 text-center"><s:text name="label.action.upload"/></p><hr/>
							<s:form action="label" id="upForm" enctype="multipart/form-data" method="post" cssClass="form-horizontal">
								<s:hidden name="task" value="upload"/>
								<div class="form-group">
									<div class="control-group col-xs-12 col-sm-6">
										<label for="upApp"><s:text name="label.application"/></label>
										<s:select id="upApp" cssClass="form-control" onchange="loadOrganization(this);" list="applicationList"
											name="applicationCode" listKey="code"listValue="code" emptyOption="true" required="true"></s:select>
									</div>
									<div class="control-group col-xs-12 col-sm-6">
										<label for="upOrg"><s:text name="label.organization"/></label>
										<s:select id="upOrg" cssClass="form-control" required="true" list="organizationList"
											name="organizationCode" listKey="code" listValue="code" ></s:select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 col-sm-6">
										<label for="upPolicy"><s:text name="label.labelImportPolicy"/></label>
										<s:select id="upPolicy" cssClass="form-control" list="policyImportList"
											name="labelCode" listKey="key" listValue="description" ></s:select>
									</div>
									<div class="control-group col-xs-12 col-sm-6">
										<label for="upFile"><s:text name="label.file"/></label>
										<s:file id="upFile" cssClass="form-control" name="fileInput" size="40" maxlength="200" required="true" accept=".xls,application/vnd.ms-excel"/>
										<div class="help block"><qs2:errors property="fileInput"></qs2:errors></div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 text-center">
										<button type="submit" class="btn btn-lg btn-primary"><s:text name="label.action.upload"/>&nbsp;<span class="glyphicon glyphicon-upload"></span></button>
									</div>
								</div>
							</s:form>
						</div>
						<div class="col-xs-12 col-md-6">
							<hr/><p class="h4 text-center"><s:text name="label.action.download"/></p><hr/>
							<s:form action="label" id="downForm" cssClass="form-horizontal">
								<s:hidden name="task" value="download"/>
								<div class="form-group">
									<div class="control-group col-xs-12 col-sm-6">
										<label for="downApp"><s:text name="label.application"/></label>
										<s:select id="downApp" cssClass="form-control" onchange="loadOrganization(this);" list="applicationList"
											name="applicationCode" listKey="code"listValue="code" emptyOption="true" required="true"></s:select>
									</div>
									<div class="control-group col-xs-12 col-sm-6">
										<label for="downOrg"><s:text name="label.organization"/></label>
										<s:select id="downOrg" cssClass="form-control" required="true" list="organizationList"
											name="organizationCode" listKey="code" listValue="code" ></s:select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12 text-center">
										<button type="submit" class="btn btn-lg btn-primary"><s:text name="label.action.download"/>&nbsp;<span class="glyphicon glyphicon-download"></span></button>
									</div>
								</div>
							</s:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="./_modal.jsp" flush="true"/>
</body>
</html>

