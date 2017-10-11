<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<s:url id="releaseLockUrl" action="lockManager" includeParams="none" escapeAmp="false">
	<s:param name="task">unlockPressingExit</s:param>
</s:url>
<script type="text/javascript">
function saveAttribute(){
	$(modal.content).addClass('hidden');
	modal.load(true);
	var form = $('#attrCreateForm');
	qamCall(form.prop('action'),form.serializeArray(),manageSaveAttribute,'json/html','post');
	return false;
}
function manageSaveAttribute(data){
	try{
		data = $.parseJSON(data);
		if(data.success){
			$(modal.content).removeClass('hidden');
			modal.closeNsearch();
			return;
		}
		console.log(data);
	}catch(e){
		modal.fill(data);
	}
}
function releaseLock(){
	console.log('release lock!');
	var params = [
		{name:'lockGroupId', value:'<s:property value="acquireLock.id"/>'},
		{name:'lockUser', value:'<s:property value="userContext.realUserDn"/>'}
	];
	qamCall('<s:property value="#releaseLockUrl" escape="false"/>',params,null,'text','get');
	$(modal.id).off('hide.bs.modal',releaseLock);
}
$(function(){
	$('#attrCreateForm').validator('validate');
	$(modal.id).on('hide.bs.modal',releaseLock);
	parentDoResize();
});
</script>
<s:set name="userLanguage" value="getUserContext().getLocale()"/>
<s:form action="attribute" cssClass="form-horizontal" role="form" id="attrCreateForm" onsubmit="return saveAttribute();">
	<s:hidden name="attribute" value="%{attribute.id}"></s:hidden>
	<s:hidden name="task" value="save2"></s:hidden>
	<s:hidden name="popUp" />
	<s:hidden name="multilanguage" />
	<s:if test="attributeTypeCode.autogeneratoYN"><s:hidden name="attribute.code"/></s:if>
	<s:if test="attributeTypeDescr.autogeneratoYN"><s:hidden name="attribute.description"/></s:if>
	<s:iterator id="att" value="attributeTypeAttributes" status="atStat">
		<s:if test="#att.autogeneratoYN"><s:hidden name="%{'attribute.attribute'+#atStat.count}"/></s:if>
	</s:iterator>
	<div class="row form-group">
		<div class="col-xs-12 col-sm-6 col-md-4 <qs2:inputErrorClass property="attribute.type"/>">
			<label for="attCode"><s:property value="labelsAndHelpersAttributesForEditMap.get('CODE_LABEL')"/></label>
			<s:if test="attribute.id != null && attribute.id != ''">
				<p id="attCode" class="form-control-static"><s:property value="attribute.code"/></p>
			</s:if>
			<s:else>
				<s:if test="!attributeTypeCode.autogeneratoYN"><s:textfield id="attCode" name="attribute.code" cssClass="form-control" required="true"/></s:if>
				<s:else><p id="attCode" class="form-control-static"><s:property value="attribute.code"/></p></s:else>
			</s:else>
			<div class="help-block with-errors">
				<s:property value="labelsAndHelpersAttributesForEditMap.get('CODE_HELPER')"/>
				<qs2:errors property="attribute.type" />
			</div>
		</div>
		<s:if test="attributeType.ordinabileYN">
			<div class="control-group col-xs-12 col-sm-6 col-md-4">
				<label for="attOrdinamento"><s:text name="attribute.edit.insertPosition"/></label>
				<s:textfield id="attOrdinamento" cssClass="form-control" name="attribute.ordinamento" />
			</div>
		</s:if>
		<div class="clearfix visible-sm"></div>
		<s:if test="attributeType.multisocietaYN">
			<div class="col-xs-12 col-sm-6 col-md-4">
				<label for="attOrganization"><s:text name="attribute.edit.chooseOrganization"/></label>
				<s:select id="attOrganization" emptyOption="true" cssClass="form-control" list="#request['organizations']" name="attribute.organization" />
			</div>
		</s:if>
	</div>
	<div class="row form-group">
		<s:if test="attributeType.multilinguaYN">
			<s:iterator id="language" value="languages" status="status">
				<div class="col-xs-12 col-sm-6 control-group <qs2:inputErrorClass property="attribute.description"/>">
					<label for="attDescription<s:property value="#language"/>"><s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_LABEL')" />&nbsp;<s:property value="#language"/></label>
					<s:if test="!attributeTypeDescr.autogeneratoYN">
						<s:if test="attributeTypeDescr.obbligatorioYN"><s:textarea name="%{'descriptionInLanguage.'+#language}" id="%{'attDescription'+language}"  cssStyle="max-width: 100%" cssClass="form-control" required="true"/></s:if>
						<s:else><s:textarea name="%{'descriptionInLanguage.'+#language}" id="%{'attDescription'+language}" cssClass="form-control" cssStyle="max-width: 100%"/></s:else>
					</s:if>
					<s:else><p id="attDescription" class="form-control-static"><s:property value="attribute.description"/></p></s:else>
					<div class="help-block with-errors">
						<s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_HELPER')"/>
						<qs2:errors property="attribute.description"/>
					</div>
				</div>
				<s:if test="#status.even && !#status.last">
					<div class="clearfix hidden-sx"></div>
				</s:if>
			</s:iterator>
		</s:if>
		<s:else><%--no multilingua => default_language --%>
			<div class="col-xs-12 control-group <qs2:inputErrorClass property="attribute.description"/>">
				<label for="attDescription"><s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_LABEL')" /></label>
				<s:if test="!attributeTypeDescr.autogeneratoYN">
					<s:if test="attributeTypeDescr.obbligatorioYN"><s:textarea name="attribute.description" id="attDescription" cssClass="form-control"  cssStyle="max-width: 100%" required="true"/></s:if>
					<s:else><s:textarea name="attribute.description" id="attDescription" cssClass="form-control"  cssStyle="max-width: 100%"/></s:else>
				</s:if>
				<s:else><p id="attDescription" class="form-control-static"><s:property value="attribute.description"/></p></s:else>
				<div class="help-block with-errors">
					<s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_HELPER')"/>
					<qs2:errors property="attribute.description"/>
				</div>
			</div>
		</s:else>
	</div>
	<jsp:include page="_attributeEdit.jsp"></jsp:include>
	<div class="row">
		<div class="col-xs-12 text-center">
			<button type="submit" class="btn btn-primary"><s:text name="button.save" />&nbsp;<span class="glyphicon glyphicon-floppy-saved"></span></button>
			<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.close"/></button>
		</div>
	</div>
</s:form>