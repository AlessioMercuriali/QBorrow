<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
  	<head>
  		<jsp:include page="_head.jsp"></jsp:include>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/frmk/2/scripts/controller/qxJobController.js?_<jsp:include page='_version.jsp' />"></script>
  	</head>
  	<body ng-app="framework"> 
  		<div class="frameworkGlobalDiv"> 
  			<jsp:include page="_header.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  		<div class="frameworkRow"  >
		  		<div class="frameworkLeftMenuCell">
					<jsp:include page="_left.jsp">
						<jsp:param name="menuActive" value="Job"/>
					</jsp:include>
				</div>
  				<div class="frameworkMainCell" id="main2" ng-controller="qxJobController" ng-include="scopeController.selectedPage">
  				
  				</div>
  				<script type="text/ng-template" id="list"><jsp:include page="_job.jsp"></jsp:include></script>
  				<script type="text/ng-template" id="history"><jsp:include page="_history.jsp"></jsp:include></script>
			</div>
  		 	<jsp:include page="_footer.jsp">
	  			<jsp:param name="menuActive" value="false"/>
	  		</jsp:include>
	  	</div>	
  	</body>
	<script type="text/ng-template" id="editJobContent.html">
        <jsp:include page="_jobEditContent.jsp"/>
    </script>
    <script type="text/ng-template" id="jobContextList.html">
        <div class="qmodal-header" style="border-bottom: 0px;">
            <h3 class="qmodal-title">
				<i class="fa fa-list"></i>&nbsp;<s:text name="job.list.title" />
				<button class="qbtn btn-framework-color qpull-right" type="button" ng-click="addContext()"><i class="fa fa-plus"></i>&nbsp;Aggiungi</button>
			</h3>
		</div>
        <div class="qmodal-body" style="padding: 0px 0px 10px 0px;">
			<table class="qtable qtable-hover">
				<thead>
					<th class="qtext-left">Nome</th>
					<th class="qtext-left">Url</th>
					<th class="qtext-center">&nbsp;</th>
				</thead>
				<tbody>
					<tr ng-repeat="context in scopeController.contextList">
						<td>
							<label ng-if="scopeController.modifyName != true">{{context.name}}</label>
							<input type="text" class="qform-control" ng-if="context.modifyName" ng-model="context.name"/>
						</td>
						<td>
							<label ng-if="scopeController.modifyUrl != true">{{context.url}}</label>
							<input type="text" class="qform-control" ng-if="context.modifyUrl" ng-model="context.url"/>
						</td>
						<td class="qtext-center">
							<i ng-click="context.modifyUrl=true" ng-show="context.modifyUrl!=true" class="fa fa-lg fa-pencil-square-o cursor"></i>&nbsp;
							<i ng-show="context.modifyUrl" ng-click="saveContext(context)" class="fa fa-lg fa-floppy-o cursor"></i>
							<i class="fa fa-lg fa-trash-o cursor" ng-click="removeContext($index)"></i>
						</td>
					</tr>
				</tbody>
			</table>
        </div>
        <div class="qmodal-footer">
			<button class="qbtn btn-framework-color" type="button" ng-click="cancel()"><i class="fa fa-check"></i>&nbsp;<s:text name="button.ok" /></button>
        </div>
    </script>
    <jsp:include page="_configTemplate.jsp" />
</html>
