<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- wrapper per inserire i metadati di un nuovo attributo ad un attributeType --%>
<s:set var="status" value="newConfigStatus"/>
<s:set var="config" value="newConfig"/>
<%@ include file="_configItemRow.jsp" %>