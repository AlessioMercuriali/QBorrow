<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<s:set var="multilingua" value="attributeType.multilinguaYN"/><s:set var="haveAttributes" value="attributeType.haveAttributes"/>
<div class="form-group">
	<div class="col-xs-12">
		<div class="panel-group panel-group-popup" id="attributeTypeAttributeList">
			<s:iterator id="atAttribute" value="attributeTypeAttributes" status="status">
				<%@ include file="_attributeTypeEditAttribute.jsp" %>
			</s:iterator>
		</div>
	</div>
</div>
<s:if test="attributeTypeAttributes.size() < 10">
	<div id="add-attr-help" class="row" data-used="<s:property value="attributeTypeAttributes.size()"/>">
		<div class="col-xs-12 text-center help-block">
			<s:text name="attributeType.edit.attributeAddHelper"/>
			<button type="button" class="btn btn-success" onclick="addFieldSet();">
				<span class="glyphicon glyphicon-plus" ></span>
			</button>
		</div>
	</div>
	<div id="add-attr-load" class="row hidden"><img class="center-block img-responsive" src="<qs2:imagesPath framework="true" nome="/gif-load.gif"/>" alt="<s:text name="loading.text"/>"/></div>
</s:if>