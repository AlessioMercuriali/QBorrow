<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<title><s:text name="application.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="<qs2:themesPath framework="true" nome="/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css" href="<qs2:themesPath framework="true" nome="/bootstrap-datetimepicker.css"/>"/>
<link rel="stylesheet" type="text/css" href="<qs2:themesPath framework="true" nome="/bootstrap-colorpicker.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<qs2:themesPath framework="true" nome="/filetypes.css"/>"/>
<link rel="stylesheet" type="text/css" href="<qs2:themesPath framework="true" nome="/frmk.css"/>"/>
<link rel="icon" href="<%=(request.getProtocol().toLowerCase().contains("https"))?"https":"http" %>://<%=request.getServerName() %>:<%=request.getServerPort() %><%=request.getContextPath() %>/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="<%=(request.getProtocol().toLowerCase().contains("https"))?"https":"http" %>://<%=request.getServerName() %>:<%=request.getServerPort() %><%=request.getContextPath() %>/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/jquery.js"/>"></script>
<%-- <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script> --%><%-- jQuery non minified per debug --%>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/jquery-sortable.js"/>"></script>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/jquery.expander.js"/>"></script>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/bootstrap.js"/>"></script>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/quixAjaxManager.js"/>"></script>
<script type="text/javascript">
<!--
qSM.maxInactiveInterval = <%= request.getSession().getMaxInactiveInterval() %> - 120; // tolgo 2 minuti per sicurezza
qAM.conflictMessage = ' <s:text name="ajax.json.msg.editConflictShow"/>';

//-->
</script>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/moment.min.js"/>"></script>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/bootstrap-datetimepicker.js"/>"></script>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/bootstrap-colorpicker.min.js"/>"></script>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/locales/bootstrap-datetimepicker.it.js"/>"></script>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/validator.js"/>"></script>
<script type="text/javascript" src="<qs2:scriptsPath framework="true" nome="/commons.js"/>"></script>
