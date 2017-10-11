<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<s:url id="cancelUrl" action="attributeType" includeParams="none" escapeAmp="false">
	<s:param name="task">list</s:param>
</s:url>

<html>
<head>
	<jsp:include page="Head.jsp" />
	
	<script type="text/javascript">

	function cancel(){
		document.location.href='<s:property value="#cancelUrl" escape="false" />';
	}

	</script>
</head>
<body>
	<qs2:messagesinit/>
	<!-- Tabella del template -->
	<table cellpadding="0" cellspacing="0" border="0" align="center" width="100%" class="template">
		<s:if test="!popUp">
			<tr>
				<td class="templateHeaderCell">
					<jsp:include page="Header.jsp" flush="true" />         
				</td>
			</tr>
		</s:if>
		<tr>
	 		<td class="templateContentcell">
				<qs2:templateTable title="attributeType.detail.title" tablecolspan="8"/>
				<s:form action="attributeType" theme="quixext">
					<s:hidden name="attributeType" value="%{attributeType.id}"></s:hidden>
					<s:hidden name="popUp" />
					<%--riga1: tipo, tipo_descrizione --%>
					<tr>
						<td class="label" nowrap="nowrap" width="1%">
							<s:text name="attributeType.detail.tipo" />:
						</td>
						<td width="24%" class="data">
							<s:property value="attributeType.tipo" />
						</td>
						<td width="1%" class="label" nowrap="nowrap" width="1%">
							<s:text name="attributeType.detail.tipoDescrizione" />:
						</td>
						<td width="74%" class="data" colspan="5">
							<s:property value="attributeType.tipo_descrizione" />
						</td>
					</tr>
					<tr>
						<td class="boxSeparator" colspan="8"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
					</tr>
					<%--riga2: multisocietà, ordinabile, multilingua, linguaDefault --%>
					<tr>
						<td class="label" nowrap="nowrap" width="1%">
							<s:text name="attributeType.detail.multisocieta" />
						</td>
						<td class="data" width="24%">
							<s:if test="attributeType.multisocietaYN">
								<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
							</s:if>
							<s:else>
								<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
							</s:else>							
						</td>
						<td class="label" nowrap="nowrap" width="1%">
							<s:text name="attributeType.detail.ordinabile" />
						</td>
						<td class="data" width="24%">
							<s:if test="attributeType.ordinabileYN">
								<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
							</s:if>
							<s:else>
								<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
							</s:else>
						</td>
						<td class="label" nowrap="nowrap" width="1%">
							<s:text name="attributeType.detail.multilingua" />
						</td>
						<td class="data" width="24%">
							<s:if test="attributeType.multilinguaYN">
								<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
							</s:if>
							<s:else>
								<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
							</s:else>
						</td>
						<td width="1%" nowrap="nowrap" id="linguaDefault.label" class="<s:if test="attributeType.multilinguaYN">showTr label</s:if><s:else>hide</s:else>">
							<s:text name="attributeType.detail.linguaDefault" />
						</td>
						<td width="24%" class="<s:if test="attributeType.multilinguaYN">showTr data</s:if><s:else>hide</s:else>">
							<s:property value="attributeType.linguaDefault" />
						</td>
					</tr>		
					<tr>
						<td class="boxSeparator" colspan="8"><img border="0" src="<qs2:imagesPath/>" width="1" height="1"></td>
					</tr>
					<tr>
						<td class="helper" colspan="8">
							<s:text name="attributeType.detail.attributeTypeInfoHelper" />
						</td>
					</tr>
					<%--riga3: code labels and helpers --%>
					<tr>
						<td class="data" colspan="8">
							<table align="left" cellpadding="0" cellspacing="0" border="0" style="border:1px solid #9E9E9E;" width="100%">
								<tr bordercolor="#9E9E9E">
									<td class="label" width="1%" nowrap="nowrap">
										<s:text name="attributeType.edit.attributeTipo" />&nbsp;
									</td>
									<td class="data" width="24%">
										<s:property value="attributeTypeCode.tipo" />
									</td>
									<td class="label" width="1%" nowrap="nowrap">
										<s:text name="attributeType.edit.attributeRicerca" />&nbsp;
									</td>
									<td class="data" nowrap="nowrap" width="24%">
										<s:if test="attributeTypeCode.ricercaYN">
											<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
										</s:if>
										<s:else>
											<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
										</s:else>
									</td>
									<td class="label" width="1%" nowrap="nowrap">
										<s:text name="attributeType.edit.attributeAutogen" />&nbsp;
									</td>
									<td class="data" nowrap="nowrap" width="24%">
										<s:if test="attributeTypeCode.autogeneratoYN">
											<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
											</td>
											<td class="label" width="1%" nowrap="nowrap">
												<s:text name="attributeType.edit.attributeAutogenBeanName" />&nbsp;
											</td>
											<td class="data" nowrap="nowrap" width="24%">
												<s:property value="attributeTypeCode.autogenBeanName"/>											
										</s:if>
										<s:else>
											<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
										</s:else>
									</td>
								</tr>
								<tr>
									<td class="boxSeparator" colspan="6"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
								</tr>
								<tr>
									<td colspan="8" class="data">
										<table align="left" cellpadding="0" cellspacing="0" border="0" width="100%" <s:if test="attributeType.multilinguaYN">style="border:1px solid #9E9E9E;"</s:if>>
											<s:if test="attributeType.multilinguaYN">
												<tr>
													<td class="label" width="1%" >&nbsp;</td>
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
													<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.codeLabelTitle"/></td>
													<s:iterator id="language" value="languages" status="codeLabelStatus">
														<td class="data" width="<s:property value="99/languages.size()" />%">
															<s:property value="codesLabelsAndHelpersMap.get(#language+'_label')" />
														</td>	
													</s:iterator>
												</tr>
												<tr>
													<td class="boxSeparator" colspan="<s:property value="languages.size() + 1"/>"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
												</tr>
												<tr>
													<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.codeHelperTitle"/></td>
													<s:iterator id="language" value="languages" status="codeHelperStatus">
														<td class="data" width="<s:property value="99/languages.size()" />%">
															<s:property value="codesLabelsAndHelpersMap.get(#language+'_helper')" />
														</td>	
													</s:iterator>
												</tr>
											</s:if>
											<s:else>
												<tr>
													<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.codeLabelTitle"/></td>
													<td class="data" nowrap="nowrap" width="49%">
														<s:property value="codesLabelsAndHelpersMap.get('_label')" />
													</td>
													<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.codeHelperTitle"/></td>
													<td class="data" width="49%">
														<s:property value="codesLabelsAndHelpersMap.get('_helper')" />
													</td>
												</tr>
											</s:else>
										</table>
									</td>	
											
							</table>
						</td>
					</tr>
					<tr>
						<td class="boxSeparator" colspan="8"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
					</tr>
				<%--riga3: descr labels and helpers --%>
					<tr>
						<td class="data" colspan="8">
							<table align="left" cellpadding="0" cellspacing="0" border="0" style="border:1px solid #9E9E9E;" width="100%">
								<tr bordercolor="#9E9E9E">
									<td class="label" width="1%" nowrap="nowrap">
										<s:text name="attributeType.edit.attributeObbligatorio" />&nbsp;
									</td>
									<td class="data" width="24%">
										<s:if test="attributeTypeDescr.obbligatorioYN">
											<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
										</s:if>
										<s:else>
											<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
										</s:else>
									</td>
									<td class="label" width="1%" nowrap="nowrap">
										<s:text name="attributeType.edit.attributeRicerca" />&nbsp;
									</td>
									<td class="data" nowrap="nowrap" width="24%">
										<s:if test="attributeTypeDescr.ricercaYN">
											<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
										</s:if>
										<s:else>
											<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
										</s:else>
									</td>
									<td class="label" width="1%" nowrap="nowrap">
										<s:text name="attributeType.edit.attributeAutogen" />&nbsp;
									</td>
									<td class="data" nowrap="nowrap" width="24%">
										<s:if test="attributeTypeDescr.autogeneratoYN">
											<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
											</td>
											<td class="label" width="1%" nowrap="nowrap">
												<s:text name="attributeType.edit.attributeAutogenBeanName" />&nbsp;
											</td>
											<td class="data" nowrap="nowrap" width="24%">
												<s:property value="attributeTypeCode.autogenBeanName"/>											
										</s:if>
										<s:else>
											<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
										</s:else>
									</td>
								</tr>
								<tr>
									<td class="boxSeparator" colspan="6"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
								</tr>
								<tr>
									<td colspan="8" class="data">
										<table align="left" cellpadding="0" cellspacing="0" border="0" width="100%" <s:if test="attributeType.multilinguaYN">style="border:1px solid #9E9E9E;"</s:if>>
											<s:if test="attributeType.multilinguaYN">
												<tr>
													<td class="label" width="1%" >&nbsp;</td>
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
													<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.descLabelTitle"/></td>
													<s:iterator id="language" value="languages" status="codeLabelStatus">
														<td class="data" width="<s:property value="99/languages.size()" />%">
															<s:property value="descrsLabelsAndHelpersMap.get(#language+'_label')" />
														</td>	
													</s:iterator>
												</tr>
												<tr>
													<td class="boxSeparator" colspan="<s:property value="languages.size() + 1"/>"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
												</tr>
												<tr>
													<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.descHelperTitle"/></td>
													<s:iterator id="language" value="languages" status="codeHelperStatus">
														<td class="data" width="<s:property value="99/languages.size()" />%">
															<s:property value="descrsLabelsAndHelpersMap.get(#language+'_helper')" />
														</td>	
													</s:iterator>
												</tr>
											</s:if>
											<s:else>
												<tr>
													<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.descLabelTitle"/></td>
													<td class="data" nowrap="nowrap" width="49%">
														<s:property value="descrsLabelsAndHelpersMap.get('_label')" />
													</td>
													<td class="label" nowrap="nowrap" width="1%"><s:text name="attributeType.edit.descHelperTitle"/></td>
													<td class="data" width="49%">
														<s:property value="descrsLabelsAndHelpersMap.get('_helper')" />
													</td>
												</tr>
											</s:else>
										</table>
									</td>	
											
							</table>
						</td>
					</tr>
					<s:if test="attributeType.attributeTypeAttributes != null && attributeType.attributeTypeAttributes.size() - 1 >= 0">
						<tr>
							<td class="boxSeparator" colspan="8"><img border="0" src="<qs2:imagesPath framework="true"/>" width="1" height="1"></td>
						</tr>
						<tr>
							<td class="helper" colspan="8">
								<s:text name="attributeType.detail.attributeHelper" />
							</td>
						</tr>
						<%--riga7: sezione Attribute --%>
						<tr>
							<td class="data" colspan="8">
								<fieldset class="fieldBorderLevel2" style="padding:10px;">
									<legend class="testoLegendLevel2" style="vertical-align: middle;">
										<s:text name="attributeType.detail.attribute" />
									</legend>
									<jsp:include page="_attributeTypeDetail.jsp"></jsp:include>
								</fieldset>
							</td>	
						</tr>		
					</s:if>
					<tr>
						<td class="data" colspan="8" align="center" style="text-align:center;">					
							<button onclick="cancel();" type="button" class="buttonDft"><s:text name="button.back"/></button>
						</td>
					</tr>
				</s:form>
			</td>
		</tr>
	</table>
</body>
</html>