<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<s:url id="cancelUrl" action="attributeType" includeParams="none" escapeAmp="false">
	<s:param name="task">list</s:param>
</s:url>
<s:url id="addFieldSetInEditUrl" action="attributeType" includeParams="none" escapeAmp="false">
	<s:param name="task">addFieldSetInEdit2</s:param>
</s:url>
<s:url id="releaseLockUrl" action="lockManager" includeParams="none" escapeAmp="false">
	<s:param name="task">unlockPressingExit</s:param>
</s:url>
<script type="text/javascript">
$(function(){
	forceValidation();
	$('.long-descr').expander({collapseEffect:'fadeOut'});
	$(modal.id).on('hide.bs.modal',releaseLockModal);
});
function releaseLockModal(){
	console.log('release lock!');
	var params = [
		{name:'lockGroupId', value:'<s:property value="acquireLock.id"/>'},
		{name:'lockUser', value:'<s:property value="userContext.realUserDn"/>'}
	];
	qamCall('<s:property value="#releaseLockUrl" escape="false"/>',params,null,'text','get');
	$(modal.id).off('hide.bs.modal',releaseLockModal);
}
var hexColorSelected;

function forceValidation(){
	$('#attrCreateForm').validator('validate');
}
function addFieldSet(){
	var help = $('#add-attr-help'), used = help.data('used');
	if(used < 10){
		help.addClass('hidden').data('used',++used);
		$('#add-attr-load').removeClass('hidden');
		var multilingua = [{name:'attributeType.multilinguaYN',
			value:
				<s:if test="!attributeType.haveAttributes">$('#attrMultilinguaYN').find('input:checked').val()</s:if>
				<s:else><s:property value="attributeType.multilinguaYN"/></s:else>}];
		qamCall('<s:property value="#addFieldSetInEditUrl"/>',multilingua,manageAddFieldSet,'html','get');
	}
}
function manageAddFieldSet(data){
	var help = $('#add-attr-help'),load = $('#add-attr-load');
	if(help.data('used') < 10){
		help.removeClass('hidden');
		load.addClass('hidden');
	}else{
		help.remove();
		load.remove();
	}
	$('#attributeTypeAttributeList').append(data);
}

function saveAttributeType(){
	$(modal.content).addClass('hidden');
	modal.load(true);
	var form = $('#attrCreateForm');
	qamCall(form.prop('action'),form.serializeArray(),manageSaveAttributeType,'json/html','post');
	return false;
}
function manageSaveAttributeType(data){
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

function createLabelHelperInput(nameL,nameH,helpL,helpH,errorMsg,parent,suffix,lang){
	var l,i,dh,div;
	div =$('<div/>').addClass('col-xs-12 col-sm-4 control-group');
	var ident = nameL+lang+'_label', name = nameL+'.'+lang+'_'+(suffix ? suffix : 'label');
	l = $('<label/>').attr('for',ident).html(helpL);
	i = $('<input/>').attr('type','text').attr('id',ident).attr('maxlength',50).attr('name',name).prop('required',true).data('required-error',errorMsg).addClass('form-control');
	dh = $('<div/>').addClass('help-block with-errors');
	div.append(l,i,dh); parent.append(div);
	div =$('<div/>').addClass('col-xs-12 col-sm-8');
	ident = nameH+lang+'_help'; name = nameH+'.'+lang+'_'+(suffix ? suffix : 'helper');
	l = $('<label/>').attr('for',ident).html(helpH);
	i = $('<textarea/>').attr('cols',3).attr('id',ident).attr('name',name).addClass('form-control');
	div.append(l,i); parent.append(div);
}
function toggleLangSelect(activate){
	$('select#attrDefLang').prop('disabled',!activate).prop('required',activate);
	if(!activate) $('select#attrDefLang').val('');
	$('.in-lingua').each(function(){
		var $el = $(this), helper, label;
		$el.empty();
		if(activate){
			var langs = $el.data('languages').replace('[','').replace(']','');
			var pg = $('<div/>').addClass('panel-group col-xs-12');
			langs.split(', ').forEach(function(lang){
				var p = $('<div/>').addClass('panel panel-info');
				var ph = $('<div/>').addClass('panel-heading'), h = $('<h5/>').addClass('panel-title').text(lang);
				var pb = $('<div/>').addClass('panel-body'), b = $('<div/>').addClass('row');
				createLabelHelperInput($el.data('mapbean'),$el.data('mapbean-h') ? $el.data('mapbean-h') : $el.data('mapbean'),$el.data('help-label'),$el.data('help-helper'),$el.data('error'),b,$el.data('suffix'),lang);
				ph.append(h); pb.append(b); p.append(ph,pb); pg.append(p);
			});
			$el.append(pg);
		}else{
			createLabelHelperInput($el.data('mapbean'),$el.data('mapbean-h') ? $el.data('mapbean-h') : $el.data('mapbean'),$el.data('help-label'),$el.data('help-helper'),$el.data('error'),$el,$el.data('suffix'));
		}
	});
	forceValidation();
}
function toggleAutoGenerate(activate,type){
	$('#attributeType'+type+'AutogenBean').prop('disabled',!activate).prop('required',activate);
}
function toggleAttr(attrIdx,activate){
	if(activate){
		$('#attrLink'+attrIdx).removeClass('hidden').click();
	}else{
		var link = $('#attrLink'+attrIdx).addClass('hidden');
		if($('#attrCollapse'+attrIdx).hasClass('in')) link.click();
	}
	$('#attrCollapse'+attrIdx+'>fieldset').prop('disabled',!activate);
	forceValidation();
}
function toggleAttrAutogen(attrIdx,activate){
	$('#attr'+attrIdx+'AutogenBean').prop('disabled',!activate).prop('required',activate);
	var tipo = $('#attr'+attrIdx+'Tipo');
	if (tipo.val() != '<s:property value="@it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Testo.name()"/>' && tipo.val() != '<s:property value="@it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Intero.name()"/>'){
		tipo.val('').change();
	}
	tipo.children('.no-autogen').prop('disabled',activate);
	forceValidation();
}
function refreshAltAtt(attrIdx,selectValue){
	$('#attr'+attrIdx+'Altro').prop('disabled',!(selectValue == '<s:property value="@it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Altro_Attribute.name()"/>')).val('');
	forceValidation();
}
</script>
<div class="row">
	<div class="col-xs-12">
		<s:form id="attrCreateForm" action="attributeType" onsubmit="return saveAttributeType();" cssClass="form-horizontal" role="form">
			<s:hidden name="attributeType" value="%{attributeType.id}"></s:hidden>
			<s:hidden name="task" value="save2"/>
			<s:hidden name="popUp" />
			<s:hidden name="canChangeMultilinguaDefault" />
			<s:set var="codeIndex" value="attributeTypeAttributes.size()" />
			<s:set var="descrIndex" value="attributeTypeAttributes.size() + 1" />
			<div class="form-group">
				<div class="col-xs-12 col-sm-6 control-group">
					<label for="attrTipo"><s:text name="attributeType.edit.tipo" /></label>
					<s:if test="attributeType.id == null || attributeType.id == ''">
						<input type="text" name="attributeType.tipo" id="attrTipo" required="true" data-required-error="<s:text name="attributeType.error.tipo"/>" class="form-control" maxlength="50"/>
					</s:if>
					<s:else><p id="attrTipo" class="form-control-static"><s:property value="attributeType.tipo" /></p></s:else>
					<div class="help-block with-errors long-descr"><s:text name="attributeType.edit.tipoHelper" /></div>
				</div>
				<div class="col-xs-12 col-sm-6 control-group">
					<label for="attrTipo_descrizione"><s:text name="attributeType.edit.tipoDescrizione" /></label>
					<s:textarea name="attributeType.tipo_descrizione" id="attrTipo_descrizione" required="true" cssClass="form-control" cols="4"></s:textarea>
					<div class="help-block long-descr with-errors"><s:text name="attributeType.edit.tipoDescrizioneHelper" /></div>
				</div>
				<div class="clearfix hidden-sx"></div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label for="attrMultiSocietaYN"><s:text name="attributeType.edit.multisocieta" /></label>
					<div id="attrMultiSocietaYN" class="radio-control">
						<label class="radio radio-inline"><input <s:if test="attributeType.multisocietaYN">checked="checked" </s:if> type="radio" name="attributeType.multisocietaYN" value="true"><s:text name="label.si"/></label>
						<label class="radio radio-inline"><input type="radio" <s:if test="!attributeType.multisocietaYN">checked="checked" </s:if> name="attributeType.multisocietaYN" value="false"><s:text name="label.no"/></label>
					</div>
					<div class="help-block long-descr"><s:text name="attributeType.edit.multisocietaHelper" /></div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label for="attrOrdinabileYN"><s:text name="attributeType.edit.ordinabile" /></label>
					<div id="attrOrdinabileYN" class="radio-control">
						<label class="radio radio-inline"><input <s:if test="attributeType.ordinabileYN">checked="checked" </s:if> type="radio" name="attributeType.ordinabileYN" value="true"><s:text name="label.si"/></label>
						<label class="radio radio-inline"><input type="radio" <s:if test="!attributeType.ordinabileYN">checked="checked" </s:if> name="attributeType.ordinabileYN" value="false"><s:text name="label.no"/></label>
					</div>
					<div class="help-block long-descr"><s:text name="attributeType.edit.ordinabileHelper" /></div>
				</div>
				<div class="clearfix visible-sm"></div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label for="attrCachebleYN"><s:text name="attributeType.edit.cacheble" /></label>
					<div id="attrCachebleYN" class="radio-control">
						<label class="radio radio-inline"><input <s:if test="attributeType.cachebleYN">checked="checked" </s:if> type="radio" name="attributeType.cachebleYN" value="true"><s:text name="label.si"/></label>
						<label class="radio radio-inline"><input type="radio" <s:if test="!attributeType.cachebleYN">checked="checked" </s:if> name="attributeType.cachebleYN" value="false"><s:text name="label.no"/></label>
					</div>
					<div class="help-block long-descr"><s:text name="attributeType.edit.cachebleHelper" /></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12 col-sm-6">
					<label for="attrMultilinguaYN"><s:text name="attributeType.edit.multilingua" /></label>
					<s:if test="!attributeType.haveAttributes">
						<div id="attrMultilinguaYN" class="radio-control">
							<label class="radio radio-inline"><input type="radio" <s:if test="attributeType.multilinguaYN">checked="checked" </s:if>name="attributeType.multilinguaYN" value="true" onchange="toggleLangSelect(true);"/><s:text name="label.si"/></label>
							<label class="radio radio-inline"><input type="radio" <s:if test="!attributeType.multilinguaYN">checked="checked" </s:if>name="attributeType.multilinguaYN" value="false" onchange="toggleLangSelect(false);"/><s:text name="label.no"/></label>
						</div>
					</s:if>
					<s:else>
						<p id="attrMultilinguaYN" class="form-control-static"><span class="glyphicon <s:if test="attributeType.multilinguaYN">glyphicon-ok text-success</s:if>
						<s:else>glyphicon-remove text-danger</s:else>" /></p>
					</s:else>
					<div class="help-block long-descr"><s:text name="attributeType.edit.multilinguaHelper" /></div>
				</div>
				<div class="col-xs-12 col-sm-6 control-group">
					<label for="attrDefLang"><s:text name="attributeType.edit.linguaDefault" /></label>
					<s:if test="!attributeType.haveAttributes">
						<select id="attrDefLang" name="attributeType.linguaDefault" data-required-error="<s:text name="attributeType.error.linguaDefault"/>" class="form-control"<s:if test="attributeType.multilinguaYN"> required</s:if>>
							<option value=""></option>
							<s:iterator id="lang" value="#request['languages']">
								<option value="<s:property value="#lang"/>"><s:property value="#lang"/></option>
							</s:iterator>
						</select>
					</s:if>
					<s:else><p id="attrDefLang" class="form-control-static"><s:property value="attributeType.linguaDefault"/></p></s:else>
					<div class="help-block with-errors long-descr"><s:text name="attributeType.edit.linguaDefaultHelper" /></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12 col-sm-6">
					<label for="genere"><s:text name="attributeType.edit.genere" /></label>
					<qs2:attribute2Input id="genere" emptyOption="true" onlyActive="true" type="FR004_GenereAttributeType" cssClass="form-control" name="attributeType.genere" />
				</div>
				<div class="col-xs-12 col-sm-6 control-group">
					<label for="usatoDa"><s:text name="attributeType.edit.usatoDa" /></label>
					<s:textarea name="attributeType.usatoDa" id="usatoDa" cssClass="form-control" cols="4"></s:textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12 col-sm-12 control-group">
					<label for="fromVersion"><s:text name="attributeType.edit.fromVersion" /></label>
					<s:textarea name="attributeType.fromVersion" id="fromVersion" cssClass="form-control" cols="4"></s:textarea>
				</div>
			</div>
			<div class="page-header"><h3><s:text name="attributeType.edit.sezioneCodeDescr" /></h3></div>
			<div class="row"><div class="col-xs-12 help-block"><s:text name="attributeType.edit.attributeTypeInfoHelper" /></div></div>
			<div class="form-group">
				<div class="col-xs-12">
					<div class="panel-group panel-group-popup" id="attrCodeDescPanels">
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title h4" data-toggle="collapse" data-parent="#attrCodeDescPanels" href="#collapseAttrCode">
									<s:text name="attributeType.edit.code"/><span class="caret"/>
								</a>
							</div>
							<div id="collapseAttrCode" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="row"><div class="col-xs-12 help-block"><s:text name="attributeType.edit.attributeTypeCodeHelper" /></div></div>
									<div class="row">
										<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 <qs2:inputErrorClass property="attributeTypeAttribute.attributeTypeCode_tipo"/>">
											<label for="attributeTypeCodeTipo"><s:text name="attributeType.edit.attributeTipo" /></label>
											<s:if test="!attributeType.haveAttributes">
												<select id="attributeTypeCodeTipo" name="attributeTypeCode.tipo" class="form-control" >
													<option <s:if test="attributeTypeCode.tipo == @it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Testo.name()">selected="selected"</s:if> ><s:property value="@it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Testo.name()"/></option>
													<option <s:if test="attributeTypeCode.tipo == @it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Intero.name()">selected="selected"</s:if> ><s:property value="@it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Intero.name()"/></option>
												</select>
											</s:if>
											<s:else><p id="attributeTypeCodeTipo" class="form-control-static"><s:property value="attributeTypeCode.tipo"/></p></s:else>
											<div class="help-block with-errors"><qs2:errors property="attributeTypeAttribute.attributeTypeCode_tipo"/></div>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
											<label for="attributeTypeCodeRicerca"><s:text name="attributeType.edit.attributeRicerca" /></label>
											<div id="attributeTypeCodeRicerca" class="radio-control">
												<label class="radio radio-inline"><input id="code_ricerca" <s:if test="attributeTypeCode.ricercaYN">checked="checked" </s:if> type="radio" name="attributeTypeCode.ricercaYN" value="true"><s:text name="label.si"/></label>
												<label class="radio radio-inline"><input type="radio" <s:if test="!attributeTypeCode.ricercaYN">checked="checked" </s:if> name="attributeTypeCode.ricercaYN" value="false"><s:text name="label.no"/></label>
											</div>
										</div>
										<div class="clearfix visible-sm"></div>
										<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
											<label for="attributeTypeCodeAutogen"><s:text name="attributeType.edit.attributeAutogen" /></label>
											<div id="attributeTypeCodeAutogen" class="radio-control">
												<label class="radio radio-inline"><input <s:if test="attributeTypeCode.autogeneratoYN">checked="checked" </s:if> type="radio" name="attributeTypeCode.autogeneratoYN" value="true" onclick="toggleAutoGenerate(true,'Code');"><s:text name="label.si"/></label>
												<label class="radio radio-inline"><input type="radio" <s:if test="!attributeTypeCode.autogeneratoYN">checked="checked" </s:if> name="attributeTypeCode.autogeneratoYN" value="false" onclick="toggleAutoGenerate(false,'Code');"><s:text name="label.no"/></label>
											</div>
										</div>
										<div class="clearfix visible-md"></div>
										<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 control-group <qs2:inputErrorClass property="%{'attributeType.attributeTypeAttributes['+ #codeIndex +'].attributeTypeCode_autogenBeanName'}"/>">
											<label for="attributeTypeCodeAutogenBean"><s:text name="attributeType.edit.attributeAutogenBeanName" /></label>
											<input type="text" id="attributeTypeCodeAutogenBean" name="attributeTypeCode.autogenBeanName" class="form-control" data-required-error="attributeType.error.autoGenBeanName"
												value="<s:property value="attributeTypeCode.autogenBeanName"/>" <s:if test="attributeTypeCode.autogeneratoYN">required</s:if><s:else>disabled</s:else>/>
											<div class="help-block with-errors"><qs2:errors property="%{'attributeType.attributeTypeAttributes['+ #codeIndex +'].attributeTypeCode_autogenBeanName'}"/></div>
										</div>
									</div>
									<div class="row spacer-top in-lingua" data-mapbean="codesLabelsAndHelpersMap" data-languages="<s:property value="languages"/>" data-error="<s:text name="attributeType.error.labelCode"/>"
										data-help-label="<s:text name="attributeType.edit.codeLabelTitle"/>" data-help-helper="<s:text name="attributeType.edit.codeHelperTitle"/>">
										<s:if test="attributeType.multilinguaYN">
											<div class="col-xs-12 panel-group">
												<s:iterator id="language" value="languages" status="status">
													<div class="panel panel-info">
														<div class="panel-heading"><h5 class="panel-title"><s:property value="#language"/></h5></div>
														<div class="panel-body">
															<div class="row">
																<div class="col-xs-12 col-sm-4 control-group">
																	<label for="codesLabelsAndHelpersMap<s:property value="#language"/>_label"><s:text name="attributeType.edit.codeLabelTitle"/></label>
																	<input type="text" id="codesLabelsAndHelpersMap<s:property value="#language"/>_label" name="codesLabelsAndHelpersMap.<s:property value="#language"/>_label" value="<s:property value="%{codesLabelsAndHelpersMap.get(#language+'_label')}"/>"
																		class="form-control" maxlength="50" required data-required-error="<s:text name="attributeType.error.labelCode"/>"/>
																	<div class="help-block with-errors"><qs2:errors property="%{'attributeType.'+#language+'_code_label'}" /></div>
																</div>
																<div class="col-xs-12 col-sm-8">
																	<label for="codesLabelsAndHelpersMap<s:property value="#language"/>_helper"><s:text name="attributeType.edit.codeHelperTitle"/></label>
																	<s:textarea id="%{'codesLabelsAndHelpersMap'+#language+'_helper'}" name="%{'codesLabelsAndHelpersMap.'+#language+'_helper'}" cssClass="form-control" cols="3"></s:textarea>
																</div>
															</div>
														</div>
													</div>
												</s:iterator>
											</div>
										</s:if>
										<s:else>
											<div class="col-xs-12 col-sm-4 control-group">
												<label for="codesLabelsAndHelpersMap_label"><s:text name="attributeType.edit.codeLabelTitle"/></label>
												<input type="text" id="codesLabelsAndHelpersMap_label" name="codesLabelsAndHelpersMap._label" value="<s:property value="codesLabelsAndHelpersMap._label"/>" class="form-control" maxlength="50" required data-required-error="<s:text name="attributeType.error.labelCode"/>"/>
												<div class="help-block with-errors"><qs2:errors property="attributeType.code_label" /></div>
											</div>
											<div class="col-xs-12 col-sm-8">
												<label for="codesLabelsAndHelpersMap_helper"><s:text name="attributeType.edit.codeHelperTitle"/></label>
												<s:textarea id="codesLabelsAndHelpersMap_helper" name="codesLabelsAndHelpersMap._helper" cssClass="form-control" cols="3"></s:textarea>
											</div>
										</s:else>
									</div>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title h4" data-toggle="collapse" data-parent="#attrCodeDescPanels" href="#collapseAttrDescr">
									<s:text name="attributeType.edit.descr"/><span class="caret"/>
								</a>
							</div>
							<div id="collapseAttrDescr" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="row"><div class="col-xs-12 help-block"><s:text name="attributeType.edit.attributeTypeDescrHelper" /></div></div>
									<div class="row">
										<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
											<label for="attributeTypeDescOblligatorio"><s:text name="attributeType.edit.attributeObbligatorio" /></label>
											<div id="attributeTypeDescOblligatorio" class="radio-control">
												<label class="radio radio-inline"><s:text name="label.si"/><input id="descr_obbligatorio" <s:if test="attributeTypeDescr.obbligatorioYN">checked="checked" </s:if> type="radio" name="attributeTypeDescr.obbligatorioYN" value="true"></label>
												<label class="radio radio-inline"><s:text name="label.no"/><input type="radio" <s:if test="!attributeTypeDescr.obbligatorioYN">checked="checked" </s:if> name="attributeTypeDescr.obbligatorioYN" value="false"></label>
											</div>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
											<label for="attributeTypeDescRicerca"><s:text name="attributeType.edit.attributeRicerca" /></label>
											<div id="attributeTypeDescRicerca" class="radio-control">
												<label class="radio radio-inline"><input id="descr_ricerca" <s:if test="attributeTypeDescr.ricercaYN">checked="checked" </s:if> type="radio" name="attributeTypeDescr.ricercaYN" value="true"><s:text name="label.si"/></label>
												<label class="radio radio-inline"><input type="radio" <s:if test="!attributeTypeDescr.ricercaYN">checked="checked" </s:if> name="attributeTypeDescr.ricercaYN" value="false"><s:text name="label.no"/></label>
											</div>
										</div>
										<div class="clearfix visible-sm"></div>
										<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
											<label for="attributeTypeDescAutogen"><s:text name="attributeType.edit.attributeAutogen" /></label>
											<div id="attributeTypeDescAutogen" class="radio-control">
												<label class="radio radio-inline"><input <s:if test="attributeTypeDescr.autogeneratoYN">checked="checked" </s:if> type="radio" name="attributeTypeDescr.autogeneratoYN" value="true" onclick="toggleAutoGenerate(true,'Desc');"><s:text name="label.si"/></label>
												<label class="radio radio-inline"><input type="radio" <s:if test="!attributeTypeDescr.autogeneratoYN">checked="checked" </s:if> name="attributeTypeDescr.autogeneratoYN" value="false" onclick="toggleAutoGenerate(false,'Desc');"><s:text name="label.no"/></label>
											</div>
										</div>
										<div class="clearfix visible-md"></div>
										<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 control-group">
											<label for="attributeTypeDescAutogenBean"><s:text name="attributeType.edit.attributeAutogenBeanName" /></label>
											<input type="text" id="attributeTypeDescAutogenBean" name="attributeTypeDescr.autogenBeanName" class="form-control" data-required-error="<s:text name="attributeType.error.autoGenBeanName"/>"
												value="<s:property value="attributeTypeDescr.autogenBeanName"/>" <s:if test="attributeTypeDescr.autogeneratoYN">required</s:if><s:else>disabled</s:else>/>
											<div class="help-block with-errors"><qs2:errors property="%{'attributeType.attributeTypeAttributes['+ #descrIndex +'].attributeTypeDescr_autogenBeanName'}"/></div>
										</div>
									</div>
									<div class="row spacer-top in-lingua" data-mapbean="descrsLabelsAndHelpersMap" data-languages="<s:property value="languages"/>" data-error="<s:text name="attributeType.error.labelDescr"/>"
										data-help-label="<s:text name="attributeType.edit.descLabelTitle"/>" data-help-helper="<s:text name="attributeType.edit.descHelperTitle"/>">
										<s:if test="attributeType.multilinguaYN">
											<div class="col-xs-12 panel-group">
												<s:iterator id="language" value="languages" status="status">
													<div class="panel panel-info">
														<div class="panel-heading"><h5 class="panel-title"><s:property value="#language"/></h5></div>
														<div class="panel-body">
															<div class="row">
																<div class="col-xs-12 col-sm-4 control-group <qs2:inputErrorClass property="%{'attributeType.'+#language+'_descr_label'}"/>">
																	<label for="descrsLabelsAndHelpersMap<s:property value="#language"/>_label"><s:text name="attributeType.edit.descLabelTitle"/></label>
																	<input type="text" id="descrsLabelsAndHelpersMap<s:property value="#language"/>_label" name="descrsLabelsAndHelpersMap.<s:property value="#language"/>_label" value="<s:property value="%{descrsLabelsAndHelpersMap.get(#language+'_label')}"/>" 
																		class="form-control" maxlength="50" required data-required-error="<s:text name="attributeType.error.labelDescr"/>"/>
																	<div class="help-block with-errors"><qs2:errors property="%{'attributeType.'+#language+'_descr_label'}" /></div>
																</div>
																<div class="col-xs-12 col-sm-8">
																	<label for="descrsLabelsAndHelpersMap<s:property value="#language"/>_helper"><s:text name="attributeType.edit.descHelperTitle"/></label>
																	<s:textarea id="%{'descrsLabelsAndHelpersMap'+#language+'_helper'}" name="%{'descrsLabelsAndHelpersMap.'+#language+'_helper'}" cssClass="form-control" cols="3"></s:textarea>
																</div>
															</div>
														</div>
													</div>
												</s:iterator>
											</div>
										</s:if>
										<s:else>
											<div class="col-xs-12 col-sm-4 control-group">
												<label for="descrsLabelsAndHelpersMap_label"><s:text name="attributeType.edit.descLabelTitle"/></label>
												<input type="text" id="descrsLabelsAndHelpersMap_label" name="descrsLabelsAndHelpersMap._label" value="<s:property value="descrsLabelsAndHelpersMap._label"/>" class="form-control" maxlength="50" required data-required-error="<s:text name="attributeType.error.labelDescr"/>"/>
												<div class="help-block with-errors"><qs2:errors property="attributeType.descr_label" /></div>
											</div>
											<div class="col-xs-12 col-sm-8">
												<label for="descrsLabelsAndHelpersMap_helper"><s:text name="attributeType.edit.descHelperTitle"/></label>
												<s:textarea id="descrsLabelsAndHelpersMap_helper" name="descrsLabelsAndHelpersMap._helper" cssClass="form-control" cols="3"></s:textarea>
											</div>
										</s:else>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-header"><h3><s:text name="attributeType.edit.sezioneAttribute" /></h3></div>
			<div class="row"><div class="col-xs-12 help-block"><s:text name="attributeType.edit.attributeHelper" /></div></div>
			<jsp:include page="_attributeTypeEdit.jsp"></jsp:include>
			<div class="form-group">
				<div class="col-xs-12 text-center">
					<button type="submit" class="btn btn-primary"><s:text name="button.save" />&nbsp;<span class="glyphicon glyphicon-floppy-saved"></span></button>
					<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.close"/></button>
				</div>
			</div>
		</s:form>
	</div>
</div>
