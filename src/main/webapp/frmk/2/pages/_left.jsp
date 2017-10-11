<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:url id="homeUrl" namespace="/framework" action="admin" escapeAmp="false" includeParams="none">
	<s:param name="version">2</s:param>
</s:url>
<s:url id="exceptionUrl" namespace="/framework" action="exceptionLog" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="configUrl" namespace="/framework" action="config" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="attributeUrl" namespace="/framework" action="attributeType" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="jobUrl" namespace="/framework" action="job" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="lockUrl" namespace="/framework" action="lock" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="labelUrl" namespace="/framework" action="label" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="jobNotificationUrl" namespace="/framework" action="jobNotification" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="debugUrl" namespace="/framework" action="debug" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>
<s:url id="templateUrl" namespace="/framework" action="template" escapeAmp="false" includeParams="none">
	<s:param name="task">mainPage</s:param>
</s:url>

<!-- Sidebar Menu -->
<ul class="framework-sidebar-menu">
	<li class="framework-sidebar-menu-element <% if("Home".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#homeUrl" escape="false" />">
			&nbsp;<i class='fa fa-home fa-lg'></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.home" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element <% if("Config".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#configUrl" escape="false" />">
			&nbsp;<i class='fa fa-wrench fa-lg'></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.config" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element <% if("Attribute".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#attributeUrl" escape="false" />">
			&nbsp;<i class='fa fa-list'></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.attribute" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element <% if("Job".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#jobUrl" escape="false" />">
			&nbsp;<i class='fa fa-cog fa-lg'></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.job" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element <% if("Lock".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#lockUrl" escape="false" />">
			&nbsp;<i class='fa fa-lg fa-lock'></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.lock" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element <% if("Label".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#labelUrl" escape="false" />">
			&nbsp;<i class='fa fa-lg fa-tag'></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.label" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element <% if("Exception".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#exceptionUrl" escape="false" />">
			&nbsp;<i class='fa fa-times-circle fa-lg'></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.exception" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element <% if("JobNotification".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#jobNotificationUrl" escape="false" />">
			&nbsp;<i class="fa fa-lg fa-bell"></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.jobNotification" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element <% if("Debug".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#debugUrl" escape="false" />">
			&nbsp;<i class='fa fa-lg fa-bug'></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.debug" /></span>
		</a>
	</li>
	<li class="framework-sidebar-menu-element <% if("Template".equals(request.getParameter("menuActive"))) { %>framework-sidebar-menu-element-active<% } %>">
		<a class="framework-sidebar-menu-element-link qtext-left" href="<s:property value="#templateUrl" escape="false" />">
			&nbsp;<i class="fa fa-envelope" aria-hidden="true"></i><span style="display:inline-block;font-size:12px;">&nbsp;&nbsp;<s:text name="menu.template" /></span>
		</a>
	</li>        
</ul>