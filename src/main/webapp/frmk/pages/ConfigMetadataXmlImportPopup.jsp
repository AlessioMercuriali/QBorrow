<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head><jsp:include page="Head.jsp" />
<script type="text/javascript">

	function imp(){
		var id = document.getElementById('file.textfield').value;
		if(id == null || id == ''){
			alert('Select one file!');
		}
	}

	function importFromXml(){
		document.forms[0].task.value = 'importFromXml';
		document.forms[0].submit();
	}

</script>

</head>
<body>
<qs2:messagesinit/>
<s:form action="configMetadata" onsubmit="imp();" method="POST" enctype="multipart/form-data">
	<s:hidden name="task" value="importFromXml"></s:hidden>
		<table cellpadding="0" cellspacing="0" border="0" align="center" height="100%" width="100%">
			<tr>
				<td class="data" align="center" style="text-align:center;vertical-align:middle;">
					<s:file id="file.textfield" name="file" cssClass="textInput" size="60"></s:file>
					<qs2:errors property="file"/>
				</td>
			</tr>
			<tr>
				<td class="data" align="center" style="text-align:center;vertical-align:middle;">
					<!--<s:submit cssClass="buttonM" key="button.importXml"></s:submit>&nbsp;-->
					<button style="text-align:center;" type="button" class="buttonM" onclick="importFromXml();"><s:text name="button.importXml"/></button>
					<button style="text-align:center;" type="button" class="buttonDft" onclick="parent.quixPopupClose()"><s:text name="button.cancel"/></button>
				</td>
			</tr>
		</table>
</s:form>
</body>
</html>