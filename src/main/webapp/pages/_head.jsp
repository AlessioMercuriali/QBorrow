<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:url id="checkUrl" action="home" escapeAmp="false">
	<s:param name="task">checkSession</s:param>
</s:url>

  	<title><s:text name="application.title" /></title>
  	<meta charset="utf-8">
  	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  
  	<link rel="icon" href="<%=(request.getProtocol().toLowerCase().contains("https"))?"https":"http" %>://<%=request.getServerName() %>:<%=request.getServerPort() %><%=request.getContextPath() %>/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="<%=(request.getProtocol().toLowerCase().contains("https"))?"https":"http" %>://<%=request.getServerName() %>:<%=request.getServerPort() %><%=request.getContextPath() %>/favicon.ico" type="image/x-icon" />

	<!-- JQuery -->  
	<script type="text/javascript" src="<%=request.getContextPath() %>/lib/jqery-1.11.3/jquery-1.11.3.js"></script>
	<!-- Bootstrap -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/lib/bootstrap-3.3.2/css/qbootstrap.css">
    <script type= "text/javascript" src="<%=request.getContextPath() %>/lib/bootstrap-3.3.2/js/qbootstrap.js"></script>
	<!-- Angular JS -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/lib/angular-1.5.9/angular.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/lib/angular-1.5.9/angular-animate.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/lib/angular-1.5.9/angular-messages.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/lib/angular-1.5.9/i18n/angular-locale_<s:property value="userContext.locale.language" /><s:if test="userContext.locale.country != ''">-<s:property value="userContext.locale.country.toLowerCase()" /></s:if>.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/lib/animate/animate.css?_<jsp:include page='_version.jsp' />">   
    <!-- SweetAlert -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/lib/SweetAlert-0.4.1/sweet-alert.min.js"></script>
	<link  rel="stylesheet" href="<%=request.getContextPath() %>/lib/SweetAlert-0.4.1/sweet-alert.css"> 
	<script type="text/javascript" src="<%=request.getContextPath() %>/lib/angular-ngSweetAlert-1.0.0/SweetAlert.min.js"></script>
	<!-- font-awesome -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/lib/font-awesome-4.3.0/css/font-awesome.css" >
	<!-- Angular Ui -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/lib/angular-ui-bootstrap-0.12.0/ui-bootstrap-tpls-0.12.0.min.js"></script> 	

	<!-- Angular DateTime Picker -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/lib/angular-moment/moment.min.js?_<jsp:include page='_version.jsp' />"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/lib/angular-bootstrap-datetimepicker-1.0.1/datetimepicker.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/lib/angular-bootstrap-datetimepicker-1.0.1/datetimepicker.js"></script>
 	<script type="text/javascript" src="<%=request.getContextPath() %>/lib/angular-bootstrap-datetimepicker-1.0.1/datetimepicker.templates.js"></script>

	<!-- Framework -->
	<link  rel="stylesheet" href="<%=request.getContextPath() %>/themes/framework.css?_<jsp:include page='_version.jsp' />">
	<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/qxQborrowCommonsComponent.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/service/qxQborrowHttpService.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/filter/qxSysAttributeFilter.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/directive/qxDateDirective.js?_<jsp:include page='_version.jsp' />"></script>
	
	<style>
			@font-face {
			    font-family: 'robotoregular';
			    src: url('<%=request.getContextPath() %>/lib/font-roboto/Roboto-Regular-webfont.eot');
			    src: url('<%=request.getContextPath() %>/lib/font-roboto/Roboto-Regular-webfont.eot?#iefix') format('embedded-opentype'),
			         url('<%=request.getContextPath() %>/lib/font-roboto/Roboto-Regular-webfont.woff') format('woff'),
			         url('<%=request.getContextPath() %>/lib/font-roboto/Roboto-Regular-webfont.ttf') format('truetype'),
			         url('<%=request.getContextPath() %>/lib/font-roboto/Roboto-Regular-webfont.svg#robotoregular') format('svg');
			    font-weight: normal;
			    font-style: normal;
			}
			
			@font-face {
			  font-family: 'FontAwesome';
			  src:  url('<%=request.getContextPath() %>/lib/font-awesome-4.3.0/fonts/fontawesome-webfont.eot?v=4.3.0');
			  src:  url('<%=request.getContextPath() %>/lib/font-awesome-4.3.0/fonts/fontawesome-webfont.eot?#iefix&v=4.3.0') format('embedded-opentype'), 
			  		url('<%=request.getContextPath() %>/lib/font-awesome-4.3.0/fonts/fontawesome-webfont.woff2?v=4.3.0') format('woff2'), 
			  		url('<%=request.getContextPath() %>/lib/font-awesome-4.3.0/fonts/fontawesome-webfont.woff?v=4.3.0') format('woff'), 
			  		url('<%=request.getContextPath() %>/lib/font-awesome-4.3.0/fonts/fontawesome-webfont.ttf?v=4.3.0') format('truetype'), 
			  		url('<%=request.getContextPath() %>/lib/font-awesome-4.3.0/fonts/fontawesome-webfont.svg?v=4.3.0#fontawesomeregular') format('svg');
			  font-weight: normal;
			  font-style: normal;
			}
			
	</style>
	
	<script type="text/javascript">
		
		var module = angular.module('qborrow');
		module.constant('qborrowConfig', {
			  'baseUrl': '<%=request.getContextPath() %>'
		});
	
		function checkSession() {
			$.ajax({
				  url: '<s:property value="#checkUrl" escape="false" />&foo=' + new Date().getTime(),
				  context: document.body
				}).done(function(data) {
				});
				setTimeout('checkSession()', 5 * 60 * 1000);
		}
		
		$( document ).ready(function() {
			setTimeout('checkSession()', 5 * 60 * 1000);
		});
		
	</script>
	
