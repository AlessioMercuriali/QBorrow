<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<s:url id="cancelUrl" action="attribute" includeParams="none" escapeAmp="false">
	<s:param name="task">list</s:param>
</s:url>

<html>
<head>
	<jsp:include page="Head.jsp" />
	
	<script type="text/javascript">

	function cancel(){
		document.location.href='<s:property value="#cancelUrl" escape="false" />';
	}

	function checkColorPicker(){
		<s:iterator id="colorPick" value="colorPickerMap.keySet()" status="colorPickStatus">
			var color = '<s:property value="colorPickerMap.get(#colorPick)"/>';
			var index = <s:property value="#colorPick"/>;
			var id = 'colorPickerDiv_id' + index;
			document.getElementById(id).style.backgroundColor = '#' + color;
		</s:iterator>
	}

	</script>
</head>
<body onload="checkColorPicker();">
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
				<qs2:templateTable title="attribute.detail.title" tablecolspan="4"/>
				<s:form action="attribute" theme="quixext">
					<s:hidden name="attribute" value="%{attribute.id}"></s:hidden>
					<s:hidden name="popUp" />
					<%--riga 1: type, code --%>
					<tr align="center" style="padding-top:10px;">
						<td class="testoLegendLevel" style="font-size: 14px;" width="1%" nowrap="nowrap" colspan="6">
							<s:property value="attribute.type" />
						</td>
					</tr>
					<tr>	
						<td class="helper" style="text-align:center;" colspan="6">
							<s:property value="attributeType.tipo_descrizione" />
						</td>
					</tr>
					<tr>
						<td class="boxSeparator" colspan="6"><img border="0" src="<qs2:imagesPath framework="true" />" width="1" height="1"></td>
					</tr>
					<tr>
						<td class="label" width="1%">
							<s:text name="attribute.detail.multilingua"/>
						</td>
						<td class="data" width="1%" colspan="5">	
							<s:if test="attributeType.multilinguaYN">
								<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
							</s:if>
							<s:else>
								<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
							</s:else>
						</td>
					</tr>
					<tr>
						<td class="boxSeparator" colspan="6"><img border="0" src="<qs2:imagesPath framework="true" />" width="1" height="1"></td>
					</tr>
					<tr>
						<td class="label" width="1%">
							<s:text name="attribute.detail.multisocieta"/>
						</td>
						<td class="data" width="1%">	
							<s:if test="attributeType.multisocietaYN">
								<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
							</s:if>
							<s:else>
								<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
							</s:else>
						</td>
						<td class="data" width="48%">
							<s:if test="attributeType.multisocietaYN">
								<s:property value="attribute.organization"/>
							</s:if>
						</td>
						<td class="label" width="1%">
							<s:text name="attribute.detail.ordinabile"/>
						</td>
						<td class="data" width="1%">	
							<s:if test="attributeType.ordinabileYN">
								<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
							</s:if>
							<s:else>
								<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
							</s:else>
						</td>
						<td class="data" width="48%">
							<s:if test="attributeType.ordinabileYN">
								<s:text name="attribute.detail.position"/>&nbsp;
								<s:property value="attribute.ordinamento" />
							</s:if>
						</td>				
					</tr>
					<tr>
						<td class="boxSeparator" colspan="6"><img border="0" src="<qs2:imagesPath framework="true" />" width="1" height="1"></td>
					</tr>
					<tr>
						<td class="label" width="1%" nowrap="nowrap">
							<s:property value="labelsAndHelpersAttributesForEditMap.get('CODE_LABEL')"/>
						</td>
						<td class="data" colspan="2">
							<s:property value="attribute.code" />
						</td>
						<td class="helper" colspan="3">
							<s:property value="labelsAndHelpersAttributesForEditMap.get('CODE_HELPER')"/>
						</td>
					</tr>
					<tr>
						<td class="boxSeparator" colspan="6"><img border="0" src="<qs2:imagesPath framework="true" />" width="1" height="1"></td>
					</tr>
					<%--riga 2: code, description --%>
					<s:if test="!attributeType.multilinguaYN">
						<%--no multilingua -> default_language --%>
						<tr>
							<td class="label" width="1%" nowrap="nowrap">
								<s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_LABEL')" />
							</td>
							<td class="data" width="99%" nowrap="nowrap" colspan="2">
								<s:property value="attribute.description" />
							</td>
							<td class="helper" colspan="3">
								<s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_HELPER')"/>
							</td>
						</tr>
					</s:if>
					<s:else>
						<tr>
							<td class="helper" colspan="6"><s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_HELPER')"/></td>
						</tr>
						<tr>
							<td class="data" colspan="6" width="100%">
								<table class="box" cellpadding="0" cellspacing="0" border="0" style="width:100%;" >
									<%--multilingua -> una riga per lingua disponibile --%>
									<tr>
										<td class="label" width="1%">&nbsp;</td>
										<s:iterator id="language" value="languages" status="code_status">
											<td class="label" style="text-align:left;">
												<s:property value="#language"/>&nbsp;
											</td>
										</s:iterator>
									</tr>
									<tr>
										<td class="boxSeparator" colspan="<s:property value="languages.size() + 1"/>"><img border="0" src="<qs2:imagesPath framework="true" />" width="1" height="1"></td>
									</tr>
									<tr>		
										<td class="label" width="1%" nowrap="nowrap">
											<s:property value="labelsAndHelpersAttributesForEditMap.get('DESCR_LABEL')" />
										</td>
										<s:iterator id="language" value="languages" status="code_status">
											<td class="data" nowrap="nowrap" width="<s:property value="99/language.size()"/>%">
												<s:property value="descriptionInLanguage.get(#language)" />
											</td>	
										</s:iterator>
									</tr>	
								</table>
							</td>
						</tr>		
					</s:else>
					<tr>
						<td class="boxSeparator" colspan="6"><img border="0" src="<qs2:imagesPath framework="true" />" width="1" height="1"></td>
					</tr>
					<jsp:include page="_attributeDetail.jsp"></jsp:include>
					<qs2:templateSpace />
					<s:if test="attribute.updateDate != null">
						<tr>
							<td class="helper" colspan="6" style="text-align:right;">					
								<s:text name="attribute.detail.lastUpdateDate"/>:<s:property value="attribute.updateDate" />
							</td>
						</tr>
					</s:if>	
					<tr>
						<td class="data" colspan="6" align="center" style="text-align:center;">					
							<button onclick="cancel();" type="button" class="buttonDft"><s:text name="button.cancel"/></button>
						</td>
					</tr>				
				</s:form>
			</td>
		</tr>
	</table>
</body>
</html>					