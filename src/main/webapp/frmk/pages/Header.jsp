<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:url id="adminActionUrl" action="admin" escapeAmp="false" includeParams="none">
</s:url>
<script type="text/javascript">
	function adminAction(){document.location.href = '<s:property value="#adminActionUrl" escape="false" />?foo='+ new Date().getTime();}
</script>
<s:if test="!embedded">

	<STYLE>
			.banner-bg-logo{
			    padding:10px 10px;
			    height:auto;
			    background-color: #d5d5d5;
			    background-image: linear-gradient(to bottom, #f2f2f2 0px, #d5d5d5 100%);
			    background-repeat: repeat-x;
			    text-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
			}
			
			.banner-bg-gray {
			    background-color: #d5d5d5;
			    background-image: linear-gradient(to bottom, #f2f2f2 0px, #d5d5d5 100%);
			    background-repeat: repeat-x;
			    text-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
			    height:auto;
			}
			.banner-bg-blue {
			    background-color: #d5d5d5;
			    background-image: linear-gradient(to bottom, #f2f2f2 0px, #d5d5d5 100%);
			    background-repeat: repeat-x;
			    text-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
			    color: #36405C;
			    font-family: Arial,Verdana,Sans-Serif;
			    font-size: 12px;
			    padding-right:10px;
			    height:auto;
			}
			.banner-bg-logout {
			    background-color: #f2f2f2;
			    height:auto;
			    margin-bottom:30px;
			    -moz-box-shadow:  0px  5px 5px #dedede;
			  -webkit-box-shadow:  0px  5px 5px #dedede;
			  filter: progid:DXImageTransform.Microsoft.Shadow(color='#dedede', Direction=135, Strength=10);
			  box-shadow: 0px 5px 5px #dedede;
			}
			.row-banner {
				display: flex;
				flex-direction: row;
			}
	  </STYLE>

	<!-- START HEADER -->
	<div class="row row-banner">
		<div class="col-xs-5 col-banner banner-bg-logo"><img class="img-responsive" src="<qs2:imagesPath framework="true" nome="/logo_quix.png"/>" /></div>
		<div class="col-xs-7 col-banner banner-bg-blue text-right">
			<s:if test="userContext.realUser != null"><s:property value="userContext.realUser.name"/></s:if>
			<br>
			<small class="small text-muted"><s:text name="header.version"/>:&nbsp;<jsp:include page="_version.jsp" /></small>
			<br>
			<qs2:flags/>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6 text-left banner-bg-logout">
			<s:url id="homeUrl" action="home" includeParams="none" escapeAmp="false" >
				<s:param name="task">execute</s:param>
				<s:param name="linkBarReset">true</s:param>
			</s:url>
			<a href="<s:property value="#homeUrl"/>" class="banner-link">
				<span class="glyphicon glyphicon-home"></span>&nbsp;<s:text name="header.home"/>
			</a>
		</div>
		<div class="col-xs-6 text-right banner-bg-logout">
			 <s:if test="userContext.realUser != null" > 
				<s:url id="logoutUrl" action="logout" includeParams="none"/>
				<a href="<s:property value="#logoutUrl" />" class="banner-link">
					<s:text name="header.logout"/>&nbsp;<span class="glyphicon glyphicon-log-out"></span>
				</a>
			</s:if>
			<s:else>
				<s:url id="loginUrl" action="login" includeParams="none"/>
				<a href="<s:property value="#loginUrl" />" class="bannerLink">
					<s:text name="header.login"/>&nbsp;<span class="glyphicon glyphicon-log-in"></span>
				</a>
			</s:else>
			
		</div>
	</div>
	<qs2:messagesDisplay/>
	<!-- END HEADER -->
</s:if>