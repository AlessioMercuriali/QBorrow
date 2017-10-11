<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="org.apache.struts2.views.jsp.TagUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="col-xs-12">
	<s:if test="sectionAttributeList != null && sectionAttributeList.size() > 0">
	<div class="row spacer-top">
		<div class="col-xs-12">
			<ul class="nav nav-tabs nav-section">
				<s:iterator id="section" value="sectionAttributeList">
					<li id="<s:property value="#section.code"/>"<s:if test="#section.code == configMetadataSearch.section"> class="active disabled"</s:if>>
						<a href="javascript:changeSection('<s:property value="#section.code"/>');" ><s:property value="#section.description"/></a>
					</li>
				</s:iterator>
				<s:if test="sectionAttributeList.size() > 1">
					<li id="allSections"<s:if test="configMetadataSearch.section == null || configMetadataSearch.section == ''"> class="active"</s:if>>
						<a href="javascript:changeSection('');"><s:text name="configMetadata.list.allSection"></s:text></a>
					</li>
				</s:if>
			</ul>
		</div>
	</div>
	</s:if>
	<jsp:include page="./_ajaxLoader.jsp" flush="true"><jsp:param name="innerId" value="Inner" /></jsp:include>
	<div id="configMetadataListDiv" class="row"><jsp:include page="./_configMetadataListSection.jsp" flush="true"/></div>
</div>

