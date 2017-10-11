<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<jsp:include page="Head.jsp" />
	<link rel="stylesheet" href="/collection-web/themes/colorpicker.css" type="text/css" />
    <link rel="stylesheet" media="screen" type="text/css" href="/collection-web/themes/layout.css" />
	<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/jquery.js"/>"></script>
	<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/colorpicker.js"/>"></script>
    <script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/eye.js"/>"></script>
    <script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/utils.js"/>"></script>
    <script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/layout.js?ver=1.0.2"/>"></script>
	


<script type="text/javascript">


</script>
</head>
<body>
<!-- Tabella del template -->
<table cellpadding="0" cellspacing="0" border="0" align="center" width="100%" >
	<tr>
		<td class="data" width="50%" align="right">
			Select a color then press the icon
		</td>
		<td class="data" width="50%">
			<img alt="icon" src="<qs2:imagesPath framework="true" nome="/color_submit.png" />" />
		</td>
	</tr>
	<tr>
		<td class="data" style="text-align: center; vertical-align: middle;" colspan="2">
			<s:form action="cause" name="causeForm">
			<div id="customWidget">
				<div id="colorSelector">
					<div style="background-color: #000000">
					</div>
				</div>
				<div id="colorpickerHolder">
				</div>
				<div id="colorpickerIndex" style="color: white;">
					<s:property value="colorPickerIndex"/>
				</div>
			</div>
			</s:form>
		</td>
	</tr>
</table>
</body>
</html>			