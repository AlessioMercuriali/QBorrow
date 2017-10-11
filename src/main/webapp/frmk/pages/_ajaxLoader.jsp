<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="ajaxloader${param.innerId}" class="row hidden"><%-- il ${param.innerId} è necessario per i parametri passati con <jsp:param> --%>
	<img class="center-block img-responsive" src="<qs2:imagesPath framework="true" nome="/gif-load.gif"/>" alt="<s:text name="loading.text"/>"/>
</div>