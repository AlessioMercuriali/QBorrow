<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<table>
	<s:iterator id="atAttribute" value="attributeTypeAttributes" status="atAttributeStatus">
		<s:set var="index" value="#atAttributeStatus.index + 1" />
		<%--riga1: attribute1 --%>
		<tr>
			<td class="data" width="99%">
				<fieldset class="fieldBorderLevel" style="padding:10px;">
					<legend class="testoLegendLevel" style="vertical-align: middle;">
						<s:text name="attributeType.edit.attribute" />&nbsp;<s:property value="#index"/>:&nbsp;
						<s:if test="#atAttribute.visibileYN">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>	
					</legend>
					<table class="<s:if test="#atAttribute.visibileYN">showTr</s:if><s:else>hide</s:else>">
						<tr>
							<td class="data helper" colspan="8">
								<s:text name="attributeType.edit.attributeInfoPrincHelper"/>
							</td>
						</tr>
					</table>
					<table class="<s:if test="#atAttribute.visibileYN">showTr</s:if><s:else>hide</s:else>" border="0" style="margin-top: 2px;border:1px solid #9E9E9E;" cellpadding="0" cellspacing="0" width="100%">
						<tr bordercolor="#9E9E9E">
							<td class="label" width="1%" nowrap="nowrap">
								<s:text name="attributeType.edit.attributeObbligatorio" />&nbsp;
							</td>
							<td class="data" nowrap="nowrap" width="49%">
								<s:if test="#atAttribute.obbligatorioYN">
									<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
								</s:if>
								<s:else>
									<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
								</s:else>
							</td>
							<td class="label" width="1%" nowrap="nowrap">
								<s:text name="attributeType.edit.attributeRicerca" />&nbsp;
							</td>
							<td class="data" nowrap="nowrap" width="49%">
								<s:if test="#atAttribute.ricercaYN">
									<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
								</s:if>
								<s:else>
									<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
								</s:else>
							</td>
						</tr>
						<tr>
							<td class="boxSeparator" colspan="4"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
						</tr>
						<tr>
							<td class="label" width="1%" nowrap="nowrap">
								<s:text name="attributeType.edit.attributeAutogen" />&nbsp;
							</td>
							<td class="data" nowrap="nowrap" width="49%">
								<s:if test="#atAttribute.autogeneratoYN"> 
									<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
									</td>
									<td class="label" width="1%" nowrap="nowrap">
										<s:text name="attributeType.edit.attributeAutogenBeanName" />&nbsp;
									</td>
									<td class="data" nowrap="nowrap" width="49%">
											<s:property value="#atAttribute.autogenBeanName" />
								</s:if>
								<s:else>
									<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
								</s:else>
							</td>
						</tr>
						<tr>
							<td class="boxSeparator" colspan="4"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
						</tr>
						<tr bordercolor="#9E9E9E">
							<td class="label" width="1%" nowrap="nowrap" >
								<s:text name="attributeType.edit.attributeTipo" />&nbsp;
							</td>
							<td class="data">
								<s:property value="#atAttribute.tipo" />
								<s:if test="%{#atAttribute.tipo == @it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Altro_Attribute.name()}">
									</td>
									<td width="1%" nowrap="nowrap" class="label">
										<s:text name="attributeType.edit.attributeTipoAttribute" />&nbsp;
									</td>
									<td class="data">
										<s:property value="#atAttribute.tipoAttribute"/>
								</s:if>
							</td>
						</tr>
					</table>
					<BR>
					<table class="<s:if test="#atAttribute.visibileYN">showTr</s:if><s:else>hide</s:else>">
						<tr>
							<td class="data helper" colspan="<s:property value="languages.size() + 1"/>">
								<s:text name="attributeType.detail.attributeLabelAndHelperHelper"/>
							</td>
						</tr>
					</table>
					<table class="<s:if test="#atAttribute.visibileYN">showTr</s:if><s:else>hide</s:else>" border="0" style="margin-top: 2px;border:1px solid #9E9E9E;" cellpadding="0" cellspacing="0" width="100%">
						<s:if test="attributeType.multilinguaYN">
							<tr>
								<td class="label" width="1%">&nbsp;</td>
								<s:iterator id="language" value="languages" status="status">
									<td class="label" style="text-align:left;" >
										<s:property value="#language"/>
									</td>
								</s:iterator>
							</tr>
							<tr>
								<td class="boxSeparator" colspan="<s:property value="languages.size() + 1"/>"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
							</tr>
							<tr>
								<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.attributeLabelTitle"/></td>
								<s:iterator id="language" value="languages" status="codeLabelStatus">
									<td class="data" width="<s:property value="99/languages.size()"/>%">
										<s:property value="attributesLabelsMap.get(#language+'_'+#index)" />
									</td>	
								</s:iterator>
							</tr>
							<tr>
								<td class="boxSeparator" colspan="<s:property value="languages.size() + 1"/>"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
							</tr>
							<tr>
								<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.attributeHelperTitle"/></td>
								<s:iterator id="language" value="languages" status="codeHelperStatus">
									<td class="data" width="<s:property value="99/languages.size()"/>%">
										<s:property value="attributesHelpersMap.get(#language+'_'+#index)" />
									</td>	
								</s:iterator>
							</tr>
						</s:if>
						<s:else>
							<tr>
								<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.attributeLabelTitle"/></td>
								<td class="data" width="29%">
									<s:property value="attributesLabelsMap.get('_'+#index)" />
								</td>
								<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.attributeHelperTitle"/></td>
								<td class="data" width="69%">
									<s:property value="attributesHelpersMap.get('_'+#index)" />
								</td>
							</tr>
						</s:else>
					</table>	
				</fieldset>
			</td>
		</tr>
	</s:iterator>
</table>