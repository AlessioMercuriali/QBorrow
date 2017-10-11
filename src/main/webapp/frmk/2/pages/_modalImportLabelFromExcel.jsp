<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
  
<div class="qmodal-header" style="border-bottom: 0px;">
	<h3 class="qmodal-title">
		<i class="fa fa-lg fa-upload grey"></i>&nbsp;&nbsp;&nbsp;<s:text name="label.import.title" />
	</h3>
	<br><span style="color:grey"><i><s:text name="label.import.helper.format"/></i></span>
</div>
<div class="qmodal-body" style="padding: 0px 0px 10px 0px;">
	<div class="qrow" style="margin-left:25px;">
		<span><s:text name="label.import.info" />:&nbsp;</span>
	   	<div class="fileUpload qbtn btn-framework-color">
	  		<i class="fa fa-search cursor"></i>&nbsp;<s:text name="label.import.choose" />
			<input id="uploadBtn" type="file" fileread="file" class="upload qbtn btn-framework-color" accept=".xls" scopeController="scopeController"/>
		</div>
	</div>
<!-- 	<div class="qrow" style="margin-left:25px;"> -->
<%-- 		<span ng-if="fileread.fileName!=null" style="color:grey"><i><s:text name="label.import.helper"></s:text></i></span> --%>
<!-- 	</div> -->
	<div class="qrow">&nbsp;</div>
	<div class="qrow" style="margin-left:25px;">
		<i style="vertical-align: -10px;" ng-if="fileread.fileName!=null" class="fa fa-2x fa-upload cursor text-grey" title="Import file" ng-click="importLabelExcel()"></i>
		<span style="margin-left: inherit;">{{ fileread.fileName }}</span>
	</div>
</div>
<div class="qmodal-footer">
	<button class="qbtn btn-framework-color" type="button" ng-click="close()"><i class="fa fa-times"></i>&nbsp;<s:text name="button.cancel" /></button>
</div>
