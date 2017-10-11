<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="frameworkRow">
	<div class="frameworkFooterFirstCell">&nbsp;</div>
	<% if("true".equals(request.getParameter("menuActive"))) { %>
		<div class="frameworkFooterSecondCell">&nbsp;</div>
	<% }  %>
	<div class="frameworkFooterThirdCell">
		<jsp:include page="_version.jsp"/>
		<div class="qpull-right">Copyright &copy; 2017 <a href="http://www.quix.it" target="_blank" style="color: blue;">QUIX S.r.l.</a></div>
	</div>

</div>

      