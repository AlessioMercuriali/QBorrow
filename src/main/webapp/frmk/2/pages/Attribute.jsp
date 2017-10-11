<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
  	<head>
  		<jsp:include page="_head.jsp"></jsp:include>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxAttributeController.js?_<jsp:include page='_version.jsp' />"></script>
		<qs2:attributeMapAngularFilter type="FR004_GenereAttributeType" />
  	</head>
  	<body ng-app="framework"> 
  		<div class="frameworkGlobalDiv"> 
  			
  			<s:if test="!embedded">
	  			<jsp:include page="_header.jsp">
		  			<jsp:param name="menuActive" value="false"/>
		  		</jsp:include>
		  	</s:if>
		  	
	  		<div class="frameworkRow"  >
		  		<div class="frameworkLeftMenuCell">
		  			
		  			<s:if test="!embedded">
						<jsp:include page="_left.jsp">
							<jsp:param name="menuActive" value="Attribute"/>
						</jsp:include>
					</s:if>
					
				</div>
  				<div class="frameworkMainCell" id="main2" ng-controller="qxAttributeController" ng-include="scopeController.selectedPage">
  					
				</div>
				<script type="text/ng-template" id="list"><jsp:include page="_attributeType.jsp"></jsp:include></script>
				<script type="text/ng-template" id="attribute"><jsp:include page="_attribute.jsp"></jsp:include></script>
				<script type="text/ng-template" id="edit"><jsp:include page="_attributeTypeEdit.jsp"></jsp:include></script>
				<script type="text/ng-template" id="detail"><jsp:include page="_attributeTypeDetail.jsp"></jsp:include></script>
				<script type="text/ng-template" id="editAttribute"><jsp:include page="_attributeEdit.jsp"></jsp:include></script>
				<script type="text/ng-template" id="detailAttribute"><jsp:include page="_attributeDetail.jsp"></jsp:include></script>
	  		</div>
	  		
	  		<s:if test="!embedded">	
		  		<jsp:include page="_footer.jsp">
			  		<jsp:param name="menuActive" value="false"/>
			  	</jsp:include>
		  	</s:if>
	  	</div>
  	</body>
</html>
