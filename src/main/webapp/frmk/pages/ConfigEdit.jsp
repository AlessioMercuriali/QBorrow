<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<s:url id="cancelUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">list</s:param>
</s:url>

<s:url id="addConfigUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">addConfig</s:param>
</s:url>
<s:url id="copyConfigUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">copyConfig</s:param>
</s:url>
<s:url id="deleteConfigUrl" action="configMetadata" includeParams="none" escapeAmp="false">
	<s:param name="task">deleteConfig</s:param>
</s:url>

<html>
<head>
	<jsp:include page="Head.jsp" />
	
	<script type="text/javascript">

	window.scrollTo(0, 10000);
	
	function manageScroll(){
		document.forms[0].qtop.value = document.body.scrollTop;
		document.forms[0].qleft.value = document.body.scrollLeft;
		return true;
	}

	var fieldSetsValues = '';

	function cancel(){
		document.location.href='<s:property value="#cancelUrl" escape="false" />';
	}

	function refreshEdit(){
		document.forms[0].task.value = 'refreshEdit';
		manageScroll();
		document.forms[0].submit();
	}

	function addConfig(){
		document.forms[0].task.value = 'addConfig';
		manageScroll();
		document.forms[0].submit();
	}

	function typeChange() {
		var configType = document.getElementById('configMetadata.type');
		var typeDomain = document.getElementById('configMetadata.typeDomain');
		if(configType.value != 'SysAttribute') {
			typeDomain.value = '';
			typeDomain.disabled = true;
		} else {
			typeDomain.value = '';
			typeDomain.disabled = false;
		}
	}

	function empty(data){
	}

	function addConfig() {
		document.forms[0].task.value = "addConfig";
		document.forms[0].submit();
	}

	function copyConfig(configNumber) {
		document.forms[0].task.value = "copyConfig";
		document.forms[0].configNumber.value = configNumber;
		document.forms[0].submit();
	}

	function deleteConfig(configNumber) {
		if (confirm('<s:text name="config.edit.confirmDelete" />')) {
			document.forms[0].task.value = "deleteConfig";
			document.forms[0].configNumber.value = configNumber;
			document.forms[0].submit();
		}
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
	 			<s:if test="!readonly">
					<qs2:templateTable title="attributeType.edit.title" tablecolspan="4"/>
				</s:if>
				<s:else>
					<qs2:templateTable title="attributeType.detail.title" tablecolspan="4"/>
				</s:else>
				<s:form action="configMetadata" theme="quixext">
					<s:hidden name="task" value="save"></s:hidden>
					<s:hidden name="popUp" />
					<tr>
						<td class="label" width="1%">
							<s:text name="configMetadata.list.code" />:
						</td>
						<td class="data" width="1%">	
							<s:property value="configMetadata.code" />	
						</td>
						<td class="label" width="1%">
							<s:text name="configMetadata.list.application"/>:
						</td>
						<td class="data" width="1%">
							<s:property value="configMetadata.application" />
						</td>
					</tr>
					<tr>
						<td class="boxSeparator" colspan="4"><img border="0" src="<qs2:imagesPath framework="true" />" width="1" height="1"></td>
					</tr>

				<%-- Bottoni: salva e annulla --%>
					<tr>
						<td class="data" colspan="4" align="center" style="text-align:center;">
							<s:if test="!readonly">			
								<s:submit theme="quixbasic" cssClass="buttonM" key="button.save" />
								<button onclick="cancel();" type="button" class="buttonDft"><s:text name="button.cancel"/></button>
							</s:if>
							<s:else>
								<button onclick="cancel();" type="button" class="buttonDft"><s:text name="button.back"/></button>
							</s:else>
						</td>
					</tr>
					<tr>
						<td class="data" colspan="4">
							<div id="configItemsDiv">
								<jsp:include page="./_configItems.jsp"></jsp:include>
							</div>
						</td>
					</tr>
					<qs2:templateSpace />
				</s:form>
			</td>
		</tr>
	</table>
</body>
</html>
<s:if test="qleft > 0 || qtop > 0">
	<script type="text/javascript">
		window.scrollTo(<s:property value="qleft"/>,<s:property value="qtop"/>);
  	</script>
</s:if>					