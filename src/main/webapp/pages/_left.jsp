<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:url id="homeUrl" namespace="/" action="home" escapeAmp="false" includeParams="none">
	<s:param name="version">2</s:param>
</s:url>
<s:url id="oggettiUrl" namespace="/" action="oggetti" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="prestitiUrl" namespace="/" action="prestiti" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="soggettiUrl" namespace="/" action="soggetti" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="frmkUrl" namespace="/framework" action="admin" escapeAmp="false" includeParams="none">
	<s:param name="version">2</s:param>
</s:url>

<!-- Sidebar Menu -->
<ul class="framework-sidebar-menu">
	<li class="framework-sidebar-menu-element qtext-left <% if("Home".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link" href="<s:property value="#homeUrl" escape="false" />">
			<i class='fa fa-home fa-lg'></i><span style="display:inline-block;font-size:12px;">&nbsp;<s:text name="menu.home" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element qtext-left <% if("oggetti".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link" href="<s:property value="#oggettiUrl" escape="false" />">
			<i class='fa fa-dot-circle-o fa-lg'></i><span style="display:inline-block;font-size:12px;">&nbsp;oggetti</span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element qtext-left <% if("prestiti".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link" href="<s:property value="#prestitiUrl" escape="false" />">
			<i class='fa fa-dot-circle-o fa-lg'></i><span style="display:inline-block;font-size:12px;">&nbsp;prestiti</span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element qtext-left <% if("soggetti".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link" href="<s:property value="#soggettiUrl" escape="false" />">
			<i class='fa fa-dot-circle-o fa-lg'></i><span style="display:inline-block;font-size:12px;">&nbsp;soggetti</span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element qtext-left <% if("Frmk".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link" href="<s:property value="#frmkUrl" escape="false" />">
			<i class='fa fa-wrench fa-lg'></i><span style="display:inline-block;font-size:12px;">&nbsp;Framework</span>
		</a>
	</li>
</ul>


