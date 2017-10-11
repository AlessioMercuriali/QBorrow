<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<qs2:attribute2Input id="confFields" name="configMetadata.fieldset" emptyOption="true" onlyActive="true"
	type="FR003_ConfigFieldsetList" cssClass="form-control" attribute1="%{configMetadata.section}"></qs2:attribute2Input>