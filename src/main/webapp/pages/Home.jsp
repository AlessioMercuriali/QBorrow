<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="_head.jsp"></jsp:include>
</head>
<body ng-app="qborrow">
	<div class="qcontainer-fluid">
		<jsp:include page="_header.jsp" />
		<div class="qcontainer">
			<div class="qrow">
				<div class="frameworkMainCell">
					<div class="qcol">
						<div class="qpage-header">
							<h1>
								Benvenuto,
								<s:property value="userContext.realUserDn" />
							</h1>
						</div>
						<div class="qrow">
							<ul class="qnav qnav-pills qnav-stacked">
								<s:url id="oggettiUrl" action="oggetti" escapeAmp="false"
									includeParams="none">
									<s:param name="task">mainPage</s:param>
								</s:url>
								<div class="qcol-sm-3">
									<div class="bottonimain">
										<i class="fa fa-futbol-o" aria-hidden="true"></i>
										<li class="i"><s:a href="%{#oggettiUrl}">Oggetti</s:a></li>
										<s:url id="prestitiUrl" action="prestiti" escapeAmp="false"
											includeParams="none">
											<s:param name="task">mainPage</s:param>
										</s:url>
									</div>
								</div>
								<div class="qcol-sm-3">
									<div class="bottonimain">
										<i class="fa fa-gift" aria-hidden="true"></i>
										<li class="i"><s:a href="%{#prestitiUrl}">Prestiti</s:a></li>
										<s:url id="soggettiUrl" action="soggetti" escapeAmp="false"
											includeParams="none">
											<s:param name="task">mainPage</s:param>
										</s:url>
									</div>
								</div>
								<div class="qcol-sm-3">
									<div class="bottonimain">
										<i class="fa fa-male" aria-hidden="true"></i>

										<li class="i"><s:a href="%{#soggettiUrl}">Soggetti</s:a></li>
										<s:url id="frmkUrl" namespace="/framework" action="admin"
											escapeAmp="false" includeParams="none">
											<s:param name="version">2</s:param>
										</s:url>
									</div>
								</div>
								<div class="qcol-sm-3">
									<div class="bottonimain">
										<i class="fa fa-money" aria-hidden="true"></i>
										<li class="i"><s:a href="%{#frmkUrlUrl}">Amministrazione</s:a></li>
									</div>
								</div>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="_footer.jsp" />
	</div>
</body>
</html>
