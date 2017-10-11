<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="qf" uri="/quix-framework-tags"%>
<div class="panel panel-default">
	<div class="panel-heading">
		<h5 class="panel-title">
			<s:text name="attributeType.edit.attribute" />&nbsp;<s:property value="#status.count"/>&nbsp;
			<a id="attrLink<s:property value="#status.index"/>" <s:if test="!#atAttribute.visibileYN">class="hidden" </s:if> data-toggle="collapse" data-parent="#attributeTypeAttributeList" href="#attrCollapse<s:property value="#status.index"/>"><span class="caret"></span></a>
		</h5>
		<label class="radio radio-inline"><input <s:if test="#atAttribute.visibileYN">checked="checked" </s:if> type="radio" name="attributeTypeAttributes.get(<s:property value="#status.index"/>).visibileYN" value="true" onclick="toggleAttr(<s:property value="#status.index"/>,true);"><s:text name="label.si"/></label>
		<label class="radio radio-inline"><input type="radio" <s:if test="!#atAttribute.visibileYN">checked="checked"</s:if> name="attributeTypeAttributes.get(<s:property value="#status.index"/>).visibileYN" value="false" onclick="toggleAttr(<s:property value="#status.index"/>,false);"><s:text name="label.no"/></label>
	</div>
	<div id="attrCollapse<s:property value="#status.index"/>" class="panel-collapse collapse<s:if test="#atAttribute.id == null"> in</s:if>">
		<fieldset class="panel-body" <s:if test="!#atAttribute.visibileYN">disabled</s:if>>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-4 help-block"><s:text name="attributeType.detail.attributeObbRicHelper"/></div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label for="attr<s:property value="#status.index"/>Obbl"><s:text name="attributeType.edit.attributeObbligatorio"/></label>
					<div class="radio-control" id="attr<s:property value="#status.index"/>Obbl">
						<label class="radio radio-inline"><input <s:if test="#atAttribute.obbligatorioYN">checked="checked" </s:if> type="radio" name="attributeTypeAttributes.get(<s:property value="#status.index"/>).obbligatorioYN" value="true"><s:text name="label.si"/></label>
						<label class="radio radio-inline"><input type="radio" <s:if test="!#atAttribute.obbligatorioYN">checked="checked"</s:if> name="attributeTypeAttributes.get(<s:property value="#status.index"/>).obbligatorioYN" value="false"><s:text name="label.no"/></label>
					</div>
				</div>
				<div class="clearfix visible-sm"></div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label for="attr<s:property value="#status.index"/>Ric"><s:text name="attributeType.edit.attributeRicerca"/></label>
					<div class="radio-control" id="attr<s:property value="#status.index"/>Ric">
						<label class="radio radio-inline"><input <s:if test="#atAttribute.ricercaYN">checked="checked" </s:if> type="radio" name="attributeTypeAttributes.get(<s:property value="#status.index"/>).ricercaYN" value="true"><s:text name="label.si"/></label>
						<label class="radio radio-inline"><input type="radio" <s:if test="!#atAttribute.ricercaYN">checked="checked"</s:if> name="attributeTypeAttributes.get(<s:property value="#status.index"/>).ricercaYN" value="false"><s:text name="label.no"/></label>
					</div>
				</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-4 help-block"><s:text name="attributeType.detail.attributeAutogenHelper"/></div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<label for="attr<s:property value="#status.index"/>Autogen"><s:text name="attributeType.edit.attributeAutogen"/></label>
					<div class="radio-control" id="attr<s:property value="#status.index"/>Autogen">
						<label class="radio radio-inline"><input <s:if test="#atAttribute.autogeneratoYN">checked="checked" </s:if> type="radio" name="attributeTypeAttributes.get(<s:property value="#status.index"/>).autogeneratoYN" value="true" onclick="toggleAttrAutogen(<s:property value="#status.index"/>,true);"><s:text name="label.si"/></label>
						<label class="radio radio-inline"><input type="radio" <s:if test="!#atAttribute.autogeneratoYN">checked="checked"</s:if> name="attributeTypeAttributes.get(<s:property value="#status.index"/>).autogeneratoYN" value="false" onclick="toggleAttrAutogen(<s:property value="#status.index"/>,false);"><s:text name="label.no"/></label>
					</div>
				</div>
				<div class="clearfix visible-sm"></div>
				<div class="col-xs-12 col-sm-6 col-md-4 control-group <qs2:inputErrorClass property="%{'attributeType.attributeTypeAttributes['+ #status.index +'].attribute'+#status.count+'_autogenBeanName'}"/>">
					<label for="attr<s:property value="#status.index"/>AutogenBean"><s:text name="attributeType.edit.attributeAutogenBeanName"/></label>
					<input type="text" id="attr<s:property value="#status.index"/>AutogenBean" name="attributeTypeAttributes[<s:property value="#status.index"/>].autogenBeanName" value="<s:property value="%{attributeTypeAttributes[#status.index].autogenBeanName}"/>"
						class="form-control" data-required-error="<s:text name="attributeType.error.autoGenBeanName"/>" <s:if test="#atAttribute.autogeneratoYN">reuired</s:if><s:else>disabled</s:else>/>
						<div class="help-block with-errors">
							<qs2:errors property="%{'attributeType.attributeTypeAttributes['+ #status.index +'].attribute'+#status.count+'_autogenBeanName'}"/>
						</div>
				</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-4 help-block"><s:text name="attributeType.detail.attributeTipoHelper"/></div>
				<div class="col-xs-12 col-sm-6 col-md-4 control-group <qs2:inputErrorClass property="%{'attributeType.attributeTypeAttributes['+ #status.index +'].attribute'+#status.countx+'_tipo'}"/>">
					<label for="attr<s:property value="#status.index"/>Tipo"><s:text name="attributeType.edit.attributeTipo" /></label>
					<qf:attributeDisplayAttributeTypeSelect required="true" dataRequiredError="attributeType.error.attrTipo"
						autoGen="#atAttribute.autogeneratoYN" onChange="%{'refreshAltAtt('+#status.index+',this.value);'}" name="%{'attributeTypeAttributes['+#status.index+'].tipo'}"
						categoria="System" id="%{'attr'+#status.index+'Tipo'}" cssClass="form-control"/>
					<div class="help-block with-errors">
						<s:if test="attributeType.haveAttributes"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp;<s:text name="attributeType.changeTypeInfo" /></s:if>
						<qs2:errors property="%{'attributeType.attributeTypeAttributes['+ #status.index +'].attribute'+#status.countx+'_tipo'}"/>
					</div>
				</div>
				<div class="clearfix visible-sm"></div>
				<div class="col-xs-12 col-sm-6 col-md-4 control-group">
					<label for="attr<s:property value="#status.index"/>Altro"><s:text name="attributeType.edit.attributeTipoAttribute" /></label>
					<s:if test="%{#atAttribute.tipo == @it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Altro_Attribute.name()}">
						<qf:attributeDisplayAttributeTypeSelect required="true" dataRequiredError="attributeType.error.attrAltro"
							name="%{'attributeTypeAttributes['+#status.index+'].tipoAttribute'}" categoria="Normal" id="%{'attr'+#status.index+'Altro'}" cssClass="form-control"/>
					</s:if>
					<s:else>
						<qf:attributeDisplayAttributeTypeSelect disabled="true" dataRequiredError="attributeType.error.attrAltro"
							name="%{'attributeTypeAttributes['+#status.index+'].tipoAttribute'}" categoria="Normal" cssClass="form-control" id="%{'attr'+#status.index+'Altro'}"/>
					</s:else>
					<div class="help-block with-errors">
						<qs2:errors property="%{'attributeType.attributeTypeAttributes['+ #status.index +'].attribute'+#status.count+'_tipoAttribute'}"/>
					</div>
				</div>
			</div>
			<hr/>
			<div class="row spacer-top"><div class="col-xs-12 help-block"><s:text name="attributeType.edit.attributeLabelAndHelperHelper"/></div></div>
			<div class="row in-lingua" data-mapbean="attributesLabelsMap" data-mapbean-h="attributesLabelsMap" data-languages="<s:property value="languages"/>" data-suffix="<s:property value="#status.index"/>" data-error="<s:text name="attributeType.error.labelAttr"/>"
				data-help-label="<s:text name="attributeType.edit.attributeLabelTitle"/>" data-help-helper="<s:text name="attributeType.edit.descHelperTitle"/>">
				<s:if test="attributeType.multilinguaYN">
					<div class="col-xs-12 panel-group">
						<s:iterator id="language" value="languages">
							<div class="panel panel-info">
								<div class="panel-heading"><h5 class="panel-title"><s:property value="#language"/></h5></div>
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-12 col-sm-4 control-group">
											<label for="attributesLabelsMap<s:property value="#language"/>_label"><s:text name="attributeType.edit.attributeLabelTitle"/></label>
											<input type="text" id="attributesLabelsMap<s:property value="%{#language+'_'+#status.count}"/>" name="attributesLabelsMap.<s:property value="%{#language+'_'+#status.count}"/>" value="<s:property value="%{attributesLabelsMap.get(#language+'_'+#status.count)}"/>" 
												class="form-control" maxlength="50" required data-required-error="<s:text name="attributeType.error.labelAttr"/>"/>
											<div class="help-block with-errors"></div>
										</div>
										<div class="col-xs-12 col-sm-8">
											<label for="attributesHelpersMap<s:property value="#language"/>_helper"><s:text name="attributeType.edit.descHelperTitle"/></label>
											<s:textarea id="%{'attributesHelpersMap'+#language+'_'+#status.count}" name="%{'attributesHelpersMap.'+#language+'_'+#status.count}" cssClass="form-control" cols="3"></s:textarea>
										</div>
									</div>
								</div>
							</div>
						</s:iterator>
					</div>
				</s:if>
				<s:else>
					<div class="col-xs-12 col-sm-4 control-group">
						<label for="attributesLabelsMap_<s:property value="#status.count"/>"><s:text name="attributeType.edit.descLabelTitle"/></label>
						
						<input type="text" id="attributesLabelsMap<s:property value="#status.count"/>" name="attributesLabelsMap._<s:property value="#status.count"/>" value="<s:property value="%{attributesLabelsMap.get('_' + #status.count)}"/>"
							class="form-control" maxlength="50" required data-required-error="<s:text name="attributeType.error.labelAttr"/>"/>
						<div class="help-block with-errors"></div>
					</div>
					<div class="col-xs-12 col-sm-8">
						<label for="attributesHelpersMap_<s:property value="#status.count"/>"><s:text name="attributeType.edit.descHelperTitle"/></label>
						<s:textarea id="%{'attributesHelpersMap_'+#status.count}" name="%{'attributesHelpersMap._'+#status.count}" cssClass="form-control" cols="3"></s:textarea>
					</div>
				</s:else>
			</div>
			<div class="row spacer-top"><div class="col-xs-12 help-block"><s:text name="attributeType.edit.defaultValueHelper"/></div></div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 control-group">
					<label for="defaultValue_<s:property value="#status.count"/>"><s:text name="attributeType.edit.defaultValue"/></label>
					
					<input type="text" name="attributeTypeAttributes[<s:property value="#status.index"/>].defaultValue" value="<s:property value="%{attributeTypeAttributes[#status.index].defaultValue}"/>"  
						class="form-control" maxlength="250" id="defaultValue_<s:property value="#status.count"/>" />
					<div class="help-block with-errors"></div>
				</div>
			</div>
		</fieldset>
	</div>
</div>