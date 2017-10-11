<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
  	<head>
  		<jsp:include page="_head.jsp"></jsp:include>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxLabelController.js?_<jsp:include page='_version.jsp' />"></script>
  	</head>
  	<body ng-app="framework"> 
  		<div class="frameworkGlobalDiv"> 
  			<jsp:include page="_header.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  		<div class="frameworkRow"  >
		  		<div class="frameworkLeftMenuCell">
					<jsp:include page="_left.jsp">
						<jsp:param name="menuActive" value="Label"/>
					</jsp:include>
				</div>
  				<div class="frameworkMainCell" id="main2" ng-controller="qxLabelController" ng-include="scopeController.selectedPage">				
			    		
  				</div>
				<script type="text/ng-template" id="list"><jsp:include page="_label.jsp" /></script>
				<script type="text/ng-template" id="modalImportLabelFromExcel.html"><jsp:include page="_modalImportLabelFromExcel.jsp" /></script>
  				<script type="text/ng-template" id="modalUpdateLabel.html"><jsp:include page="_modalUpdateLabel.jsp" /></script>
			</div>
  		 	<jsp:include page="_footer.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  	</div>	
  	</body>
</html>
