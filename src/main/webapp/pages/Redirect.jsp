<%@page import="org.apache.struts2.views.jsp.TagUtils"%><%@page import="com.opensymphony.xwork2.util.ValueStack"%><%
ValueStack stack = TagUtils.getStack(pageContext);
String to=stack.findString("redirectUrl");
response.sendRedirect(request.getContextPath() + to);
%>