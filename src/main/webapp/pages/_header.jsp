<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:url id="homeUrl" namespace="/" action="home" escapeAmp="false" includeParams="none">
</s:url>
<s:url id="logoutUrl" action="logout" includeParams="none" escapeAmp="false">
</s:url>

		<div class="frameworkRow">
	  			<div class="frameworkLogoCell">
  		 			<img onclick="document.location.href='<s:property value="#homeUrl"/>';" src="<qs2:imagesPath nome="/logo-qfrmk.png" version="2"/>">
  		 		</div>
  		 		<div class="frameworkHeaderRightCell">
  		 			<a href="" class="frameworkBottoneMenu" onclick="showMainMenu();" ng-hide="showProjectMenu()" style="bac">
			            <span class="qsr-only"><s:text name="header.togglenavigation" /></span>
			     	</a>
  		 			<div class="frameworkHeaderRightCellUserDiv qpull-right" style=" background: url('<qs2:imagesPath nome="/user.jpg" version="2"/>') left center no-repeat; background-size: 30px 30px; min-width: 30px;">
  		 				<a href="#" class="qdropdown-toggle user-menu-link" data-toggle="qdropdown">
	               			<div style="display: inline-block;padding-left: 30px;padding-top: 10px;">
	                  			<span class="hidden-xs"><s:property value="userContext.getUserText()"/></span>
	                  		</div>
	               		</a>
	               		<ul class="qdropdown-menu user-dropdown-menu">
	                   		<li class="user-header">
	                        	<img src="<qs2:imagesPath nome="/user.jpg" version="2"/>" class="qimg-circle" alt="<s:text name="header.userimage"/>" />
	                            <p class="user-header-p">
	                              	<br>
	                              	<s:property value="userContext.getUserText()"/> - 
	                              	<s:if test="userContext.isUserInRole('framework-admin')"><s:text name="header.adminRole"/></s:if>
	                              	<s:else><s:text name="header.userRole"/></s:else><BR>
	                              	<small><s:text name="header.membersince" /> <s:property value="userContext.getUserCreateDate(getText('format.date'))" /></small>
	                            </p>
	                     	</li>
	                     	<li class="user-footer">
	                        	<div class="qpull-left">
	                            	<a href="" onclick="javascript:window.open('/puma/mydetailedit.do?dn=<s:property value="userContext.realUserDn"/>', 'detailPuma', 'width=600,height=600,statusbar=no,toolbar=no,scrollbars=no,resizable=yes')" class="qbtn qbtn-default qbtn-flat"><s:text name="header.profile" /></a>
	                            </div>
	                            <div class="qpull-right">
	                              	<a href="<s:property value="#logoutUrl" escape="false" />" class="qbtn qbtn-default qbtn-flat"><s:text name="header.signout" /></a>
	                            </div>
	                     	</li>
	                  	</ul>
  		 			</div>
  		 		</div>
	  		</div>
