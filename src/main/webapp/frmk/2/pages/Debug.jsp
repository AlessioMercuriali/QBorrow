<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
  	<head>
  		<jsp:include page="_head.jsp"></jsp:include>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxDebugController.js?_<jsp:include page='_version.jsp' />"></script>
  	</head>
  	<body ng-app="framework"> 
  		<div class="frameworkGlobalDiv"> 
  			<jsp:include page="_header.jsp">
	  			<jsp:param name="menuActive" value="true"/>
	  		</jsp:include>
	  		<div class="frameworkRow"  ng-controller="qxDebugController">
		  		<div class="frameworkLeftMenuCell">
					<jsp:include page="_left.jsp">
						<jsp:param name="menuActive" value="Debug"/>
					</jsp:include>
				</div>
				<div class="frameworkDebugMenuCell"  >
		            <div style="font-size:10px;padding-top:10px;" >
	              	 	<ul class="debug-sidebar-menu" ng-cloak>
		               		<li class="treeview" >
		               			<div style="font-size:14px; cursor: pointer;" ng-click="changePage('mail')">
		               				<span title="mail" class="debugTreeMenu"><i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;Mail</span>
		               			</div>
		               		</li>
		               		<li class="treeview" >
		               			<div style="font-size:14px; cursor: pointer;" ng-click="changePage('notifiche')">
		               				<span title="mail" class="debugTreeMenu"><i class="fa fa-comment" aria-hidden="true"></i>&nbsp;Notifiche</span>
		               			</div>
		               		</li>
		               		<li class="treeview" >
		               			<div style="font-size:14px; cursor: pointer;" ng-click="changePage('system')">
		               				<span title="mail" class="debugTreeMenu"><i class="fa fa-link" aria-hidden="true"></i>&nbsp;System</span>
		               			</div>
		               		</li>
		               		<li class="treeview" >
		               			<div style="font-size:14px; cursor: pointer;" ng-click="changePage('memory')">
		               				<span title="mail" class="debugTreeMenu"><i class="fa fa-hdd-o" aria-hidden="true"></i>&nbsp;Memory</span>
		               			</div>
		               		</li>
		               		<li class="treeview" >
		               			<div style="font-size:14px; cursor: pointer;" ng-click="changePage('thread')">
		               				<span title="mail" class="debugTreeMenu"><i class="fa fa-sitemap" aria-hidden="true"></i>&nbsp;Thread</span>
		               			</div>
		               		</li>
	               		</ul>
	              	</div>
				</div>
  				<div class="frameworkMainCell" style="padding: 0px;" id="main2"  >
 			
					<div class="qcol-md-12 qcol-lg-12" ng-include="scopeController.selectedPage">
					
					</div>
  						<script type="text/ng-template" id="mail"><jsp:include page="_mail.jsp"></jsp:include></script>
  						<script type="text/ng-template" id="notifiche"><jsp:include page="_notifiche.jsp"></jsp:include></script>
  						<script type="text/ng-template" id="system"><jsp:include page="_system.jsp"></jsp:include></script>
  						<script type="text/ng-template" id="memory"><jsp:include page="_memory.jsp"></jsp:include></script>
  						<script type="text/ng-template" id="thread"><jsp:include page="_thread.jsp"></jsp:include></script>
  						
  				</div>
  				
			</div>
  		 	<jsp:include page="_footer.jsp">
	  			<jsp:param name="menuActive" value="true"/>
	  		</jsp:include>
	  	</div>	
  	</body>
</html>



