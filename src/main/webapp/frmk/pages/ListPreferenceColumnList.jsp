<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:url action="listPreference" id="toggleVisibilityUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">toggleVisibility</s:param>
</s:url>
<s:url action="listPreference" id="togglePositionUpUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">togglePositionUp</s:param>
</s:url>
<s:url action="listPreference" id="togglePositionDownUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">togglePositionDown</s:param>
</s:url>
<s:url action="listPreference" id="cleanColumnListUrl" escapeAmp="false" includeParams="none">
	<s:param name="task">cleanColumnList</s:param>
</s:url>

<html>
<head>
	<jsp:include page="Head.jsp" />
	<script type="text/javascript">
	// funzione per lo show loading
		function showLoading(mydivName){
			var mydiv = document.getElementById(mydivName);
			var myDivHeight = mydiv.offsetHeight;
			var myDivWidth = mydiv.offsetWidth;
			//creo div di attesa
			mydiv.innerHTML='<table style="height: '+myDivHeight+'px; width: '+myDivWidth+'px; " class="waitScreen" ><tr><td><img src="<qs2:imagesPath framework="true" nome="/waitingIcon.gif"/>" style="vertical-align: middle; margin-right: 10px;"/>Wait...</td></tr></table>';		
		}
	
		function toggleVisibility(id){
			showLoading('columnListDiv');
			qamCall('<s:property value="#toggleVisibilityUrl" escape="false" />&columnId='+id, manageColumnList,'text','get');
		}
		
		function togglePositionUp(id){
			showLoading('columnListDiv');
			qamCall('<s:property value="#togglePositionUpUrl" escape="false" />&columnId='+id, manageColumnList,'text','get');
		}
		
		function togglePositionDown(id){
			showLoading('columnListDiv');
			qamCall('<s:property value="#togglePositionDownUrl" escape="false" />&columnId='+id, manageColumnList,'text','get');
		}
		
		function cleanColumnList(){
			showLoading('columnListDiv');
			qamCall('<s:property value="#cleanColumnListUrl" escape="false" />', manageColumnList,'text','get');
		}
		
		function manageColumnList(data){
			document.getElementById('columnListDiv').innerHTML = data;
		}
	</script>
</head>

<body >
<qs2:messagesinit />
<div id="columnListDiv">
	<table border="0" cellspacing="1" cellpadding="0" class="box" width="90%" align="center" style="margin-top: 10px;">
		<s:iterator var="column" value="listPreference.columns" status="status">
			<tr>
				<td>
					<s:if test="#column.visible">
						<img src="<qs2:imagesPath framework="true" nome="/tick.png" />" onclick="toggleVisibility('<s:property value="#column.id" />');" style="cursor: pointer;" />
					</s:if>
					<s:else>
						<img src="<qs2:imagesPath framework="true" nome="/cross.png" />" onclick="toggleVisibility('<s:property value="#column.id" />');" style="cursor: pointer;" />
					</s:else>
				</td>
				<td><s:property value="getText(tableName+'.list.'+#column.columnName)" escape="false" /></td>
				<td>
					<s:if test="#status.index != 0">
						<img src="<qs2:imagesPath framework="true" nome="/up.gif" />" onclick="togglePositionUp('<s:property value="#column.id" />');" style="cursor: pointer;" />
					</s:if>
				</td>
				<td>
					<s:if test="#status.index != listPreference.columns.size - 1">
						<img src="<qs2:imagesPath framework="true" nome="/down.gif" />" onclick="togglePositionDown('<s:property value="#column.id" />');" style="cursor: pointer;" />
					</s:if>
				</td>
			</tr>
		</s:iterator>
		<tr>
			<td align="center" colspan="4" style="padding-top: 5px; padding-bottom: 5px;">
				<button id="reloadColumnList" type="button" class="buttonDftL" onclick="parent.quixPopupClose();"><s:text name="listPreference.reloadColumnList" /></button>
				<button id="cleanColumnList" type="button" class="buttonDftL" onclick="cleanColumnList();"><s:text name="listPreference.cleanColumnList" /></button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>