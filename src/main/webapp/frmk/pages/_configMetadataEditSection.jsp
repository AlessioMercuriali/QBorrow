<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<qs2:attribute2Input id="confSection" name="configMetadata.section" emptyOption="true" onlyActive="true" 
	type="FR002_ConfigSectionList" required="true" data-required-error="configMetadata.error.section" cssClass="form-control"
	onChange="getSectionFields(this);"></qs2:attribute2Input>