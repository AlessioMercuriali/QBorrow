<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

  	<title><s:text name="application.title" /></title>
  	<meta charset="utf-8">
  	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  
  	<link rel="icon" href="<%=(request.getProtocol().toLowerCase().contains("https"))?"https":"http" %>://<%=request.getServerName() %>:<%=request.getServerPort() %><%=request.getContextPath() %>/favicon.ico?_<jsp:include page='_version.jsp' />" type="image/x-icon" />
	<link rel="shortcut icon" href="<%=(request.getProtocol().toLowerCase().contains("https"))?"https":"http" %>://<%=request.getServerName() %>:<%=request.getServerPort() %><%=request.getContextPath() %>/favicon.ico?_<jsp:include page='_version.jsp' />" type="image/x-icon" />

	<!-- JQuery -->  
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/jqery-1.11.3/jquery-1.11.3.js"></script>
	<!-- Bootstrap -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/bootstrap-3.3.2/css/qbootstrap.css">
    <script type= "text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/bootstrap-3.3.2/js/qbootstrap.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/bootstrap-3.3.2/css/bootstrap.css">
    <script type= "text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/bootstrap-3.3.2/js/bootstrap.js"></script>
	<!-- Angular JS -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/angular-1.3.14/angular.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/angular-1.3.14/angular-animate.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/angular-1.3.14/angular-messages.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/angular-1.3.14/i18n/angular-locale_<s:property value="userContext.locale.language" /><s:if test="userContext.locale.country != ''">-<s:property value="userContext.locale.country.toLowerCase()" /></s:if>.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/animate/animate.css?_<jsp:include page='_version.jsp' />">   
    <!-- SweetAlert -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/SweetAlert-0.4.1/sweet-alert.min.js"></script>
	<link  rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/SweetAlert-0.4.1/sweet-alert.css"> 
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/angular-ngSweetAlert-1.0.0/SweetAlert.min.js"></script>
	<!-- font-awesome -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/font-awesome-4.5.0/css/font-awesome.css" >
	<!-- Angular Ui -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/angular-ui-bootstrap-0.12.0/ui-bootstrap-tpls-0.12.0.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/angular-busy-4.1.2/angular-busy.js"></script> 	
	<link href="<%=request.getContextPath() %>/frmk/2/lib/angular-busy-4.1.2/angular-busy.css" rel="stylesheet"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/angular-duration-format-1.0.0/angular-duration-format.js"></script> 
	
	 <!-- Icheck -->
	 <link href="<%=request.getContextPath() %>/frmk/2/lib/angular-icheck-1.0.1/angular-icheck.css" rel="stylesheet"/>
   	 <link href="<%=request.getContextPath() %>/frmk/2/lib/angular-icheck-1.0.1/skins/flat/flat.css" rel="stylesheet"/>
   	 <script src="<%=request.getContextPath() %>/frmk/2/lib/angular-icheck-1.0.1/angular-icheck.js"></script>
   	 
   	<!-- Angular-bootstrap-colorpicker -->
   	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/lib/angular-bootstrap-colorpicker/bootstrap-colorpicker-module.js?_<jsp:include page='_version.jsp' />"></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/angular-bootstrap-colorpicker/colorpicker.css?_<jsp:include page='_version.jsp' />" >
	
	<%-- CODE MIRROR --%>
	  	<script src="<%=request.getContextPath() %>/frmk/2/lib/angular-ui-codemirror-0.3.0/ui-codemirror.js"></script>
	  	<link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/angular-ui-codemirror-0.3.0/ui-codemirror.css" />
	  	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/codemirror.js"></script>
	  	<link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/codemirror.css"/>
	    <script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/edit/closebrackets.js"></script>
	    <script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/edit/matchbrackets.js"></script>
	    <script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/edit/closetag.js"></script>
	    <script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/edit/matchtags.js"></script>
	    <script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/hint/show-hint.js"></script>
	    <link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/hint/show-hint.css"/>
	    <script src="<%=request.getContextPath() %>/frmk/2/libqx/codemirror-5.22.1/addons/hint/sql-hint.js"></script>
	  	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/display/fullscreen.js"></script>
	  	<link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/display/fullscreen.css"/>
	  	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/comment/comment.js"></script>
	  	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/comment/continuecomment.js"></script>
	  	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/search/searchcursor.js"></script>
	  	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/addons/fold/xml-fold.js"></script>
	   	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/mode/sql.js"></script>
	   	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/mode/javascript.js"></script>
	   	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/mode/htmlmixed.js"></script>
	   	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/mode/xml.js"></script>
	   	<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/mode/properties.js"></script>
		<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/mode/freemarker.js"></script>
		<script src="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/mode/css.js"></script>
	   	<link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/codemirror-5.22.1/theme/mdn-like.css">
	   	<link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/libqx/codemirror-5.22.1/theme/qery.css">
	  
	<!-- TEXTAREA HTML -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/lib/bower_components/editor.min.css?_<jsp:include page='_version.jsp' />" />
	<script src="<%=request.getContextPath() %>/frmk/2/lib/bower_components/wysiwyg.min.js?_<jsp:include page='_version.jsp' />"></script>
	<script src="<%=request.getContextPath() %>/frmk/2/lib/bower_components/angular-sanitize-1.2.27/angular-sanitize.js"></script>	
	
	<!-- SUMMERNOTE -->
	<link href="<%=request.getContextPath() %>/frmk/2/lib/summernote/summernote.css" rel="stylesheet">
	<script src="<%=request.getContextPath() %>/frmk/2/lib/summernote/summernote.js"></script>	
	<script src="<%=request.getContextPath() %>/frmk/2/lib/angular-summernote-0.8.1/angular-summernote.js"></script>	
	
	<!-- Framework -->
	<link  rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/themes/framework.css?_<jsp:include page='_version.jsp' />">
	<s:if test="changeTheme()!=null && changeTheme()!=''">
		<link  rel="stylesheet" href="<%=request.getContextPath() %>/frmk/2/themes/framework_<s:property value="changeTheme()"/>.css?_<jsp:include page='_version.jsp' />">
	</s:if>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/qxFrameworkCommonsComponet.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/service/qxFrameworkHttpService.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/filter/qxTrimFilter.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/filter/qxSysAttributeFilter.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxAbstractEditConfigController.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/filter/qxPaginationFilter.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/directive/qxFrameworkFileRead.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/directive/qxConversionDirective.js?_<jsp:include page='_version.jsp' />"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxAbstractLabelController.js?_<jsp:include page='_version.jsp' />"></script>
	<style>
			@font-face {
			    font-family: 'robotoregular';
			    src: url('<%=request.getContextPath() %>/frmk/2/lib/font-roboto/Roboto-Regular-webfont.eot');
			    src: url('<%=request.getContextPath() %>/frmk/2/lib/font-roboto/Roboto-Regular-webfont.eot?#iefix') format('embedded-opentype'),
			         url('<%=request.getContextPath() %>/frmk/2/lib/font-roboto/Roboto-Regular-webfont.woff') format('woff'),
			         url('<%=request.getContextPath() %>/frmk/2/lib/font-roboto/Roboto-Regular-webfont.ttf') format('truetype'),
			         url('<%=request.getContextPath() %>/frmk/2/lib/font-roboto/Roboto-Regular-webfont.svg#robotoregular') format('svg');
			    font-weight: normal;
			    font-style: normal;
			}
			
			@font-face {
			  font-family: 'FontAwesome';
			  src:  url('<%=request.getContextPath() %>/frmk/2/lib/font-awesome-4.5.0/fonts/fontawesome-webfont.eot?v=4.5.0');
			  src:  url('<%=request.getContextPath() %>/frmk/2/lib/font-awesome-4.5.0/fonts/fontawesome-webfont.eot?#iefix&v=4.5.0') format('embedded-opentype'), 
			  		url('<%=request.getContextPath() %>/frmk/2/lib/font-awesome-4.5.0/fonts/fontawesome-webfont.woff2?v=4.5.0') format('woff2'), 
			  		url('<%=request.getContextPath() %>/frmk/2/lib/font-awesome-4.5.0/fonts/fontawesome-webfont.woff?v=4.5.0') format('woff'), 
			  		url('<%=request.getContextPath() %>/frmk/2/lib/font-awesome-4.5.0/fonts/fontawesome-webfont.ttf?v=4.5.0') format('truetype'), 
			  		url('<%=request.getContextPath() %>/frmk/2/lib/font-awesome-4.5.0/fonts/fontawesome-webfont.svg?v=4.5.0#fontawesomeregular') format('svg');
			  font-weight: normal;
			  font-style: normal;
			}
			
	</style>
	
	<script type="text/javascript">
		
		var module = angular.module('framework');
		module.constant('frameworkConfig', {
			  'baseUrl': '<%=request.getContextPath() %>'
		});
		
		function showMainMenu() {
			$('.frameworkLogoCell').toggleClass('activeLeftMenu');
			$('.frameworkLeftMenuCell').toggleClass('activeLeftMenu');
			$('.frameworkDebugMenuCell').toggleClass('activeLeftMenu');
			$('.frameworkFooterFirstCell').toggleClass('activeLeftMenu');
		}
	
	</script>
	
	