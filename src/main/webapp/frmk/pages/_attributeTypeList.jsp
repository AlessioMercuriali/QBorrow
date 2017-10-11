<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="col-xs-12">
	<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-condensed">
				<div class="row">
					<div class="col-xs-3 text-left">
						<b><s:text name="attributeType.search.numRecord"/>&nbsp;<span class="label label-info"><s:property value="attributeTypeSearch.getTotal()"/></span></b>
						<s:if test="attributeTypeList.size() > 0" >
							<br/><small>
								<s:text name="attributeType.search.pageRecord"/>&nbsp;<span class="label label-info">
									<s:property value="attributeTypeSearch.getRowPerPage()*(attributeTypeSearch.getPage()-1) + 1"/>-
									<s:property value="attributeTypeList.size()+attributeTypeSearch.getRowPerPage()*(attributeTypeSearch.getPage()-1)"/>
								</span>
							</small>
						</s:if>
					</div>
					<div class="col-xs-9 text-right">
						<s:if test="!popUp">
							<ul class="group-list-icon">
								<s:if test="getConfigAsBoolean('Framework','DEFAULT','FRMK028_EnableSysAttImportXmlButton')">
									<li onclick="importFormXmlPopup();">
										<span class="filetype xml with-tooltip" data-title="<s:text name="attributeType.image.importFromXml"/>"></span><br/>
										<span class="glyphicon-descr"><s:text name="attributeType.image.importFromXml"/></span>
									</li>
								</s:if>
								<li onclick="createExcel()">
									<span class="filetype xls with-tooltip" data-title="<s:text name="attributeType.image.completeExcel"/>"></span><br/>
									<span class="glyphicon-descr">Complete Excel</span>
								</li>
								<li onclick="emptyCache();">
									<span class="glyphicon glyphicon-trash with-tooltip" data-title="<s:text name="attributeType.image.emptyAllCache"/>"></span><br/>
									<span class="glyphicon-descr"><s:text name="attributeType.image.emptyAllCache"/></span>
								</li>
								<li onclick="createPage()">
									<span class="glyphicon glyphicon-plus-sign with-tooltip" data-title="<s:text name="button.createAttribute"/>"></span><br/>
									<span class="glyphicon-descr"><s:text name="button.createAttributeType"/></span>
								</li>
							</ul>
						</s:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="attributeTypeList.size() > 0" >
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table class="table table-hover table-striped table-bottom-border">
						<thead>
							<tr>
								<th witdh="1%">
									<img id="totalCheckLoader" src="<qs2:imagesPath framework="true" nome="/mini-ajax-loader.gif"/>" class="hidden">
									<input id="selectAllCheck" type="checkbox" onclick="selectAllRows();"/>
								</th>
								<th witdh="1%">&nbsp;</th>
								<th witdh="1%">&nbsp;</th>
								<th><s:text name="attributeType.list.tipo"/></th>
								<th><s:text name="attributeType.list.description"/></th>							
<%-- 								<th><s:text name="attributeType.list.multilingua"/></th> --%>
<%-- 								<th><s:text name="attributeType.list.multisocieta"/></th> --%>
<%-- 								<th><s:text name="attributeType.list.ordinabile"/></th> --%>
								<th><s:text name="attributeType.list.cacheble"/></th>
								<th><s:text name="attributeType.list.genere"/></th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="attributeTypeList" id="attributeType" status="status">
								<tr id="attrDesc<s:property value="#status.index"/>">
									<td>
										<img id="checkLoader<s:property value="#status.index"/>" src="<qs2:imagesPath framework="true" nome="/mini-ajax-loader.gif"/>" class="hidden row-loader">
										<input id="select<s:property value="#status.index"/>Check" class="row-check" type="checkbox" onclick="selectDeselectRow(this, '<s:property value="%{#attributeType.id}"/>', '<s:property value="%{#status.index}"/>');"/>
									</td>
									<td>
										<span id="attrToggle<s:property value="#status.index"/>"
											onclick="toggleRow('attrDetail<s:property value="#status.index"/>','attrToggle<s:property value="#status.index"/>');"
											class="glyphicon glyphicon-plus clickable"></span>
									</td>
									<td>
										<s:url id="getAttributeListUrl" action="attribute" includeParams="none" escapeAmp="false">
												<s:param name="task">list</s:param>
												<s:param name="reset">true</s:param>
												<s:param name="attributeType" value="%{#attributeType.id}"></s:param>
										</s:url>
										<span onclick="document.location.href='<s:property value="#getAttributeListUrl" escape="false"/>';"
											class="glyphicon glyphicon-th-list with-tooltip clickable"
											data-title="<s:text name="attributeType.image.getAttributeList"/>"/>
									</td>									
									<td><s:property value="#attributeType.tipo" /></td>
									<td class="long-descr"><s:property value="#attributeType.tipo_descrizione" /></td>
<%-- 									<td> --%>
<%-- 										<span class="glyphicon <s:if test="#attributeType.multilinguaYN">glyphicon-ok text-success</s:if> --%>
<%-- 											<s:else>glyphicon-remove text-danger</s:else>"/> --%>
<%-- 									</td> --%>
<%-- 									<td> --%>
<%-- 										<span class="glyphicon <s:if test="#attributeType.multisocietaYN">glyphicon-ok text-success</s:if> --%>
<%-- 											<s:else>glyphicon-remove text-danger</s:else>"/> --%>
<%-- 									</td> --%>
<%-- 									<td> --%>
<%-- 										<span class="glyphicon <s:if test="#attributeType.ordinabileYN">glyphicon-ok text-success</s:if> --%>
<%-- 											<s:else>glyphicon-remove text-danger</s:else>"/> --%>
<%-- 									</td> --%>
									<td>
										<span class="glyphicon <s:if test="#attributeType.cachebleYN">glyphicon-ok text-success</s:if>
											<s:else>glyphicon-remove text-danger</s:else>"/>
									</td>
									<td><qs2:attribute2Output name="#attributeType.genere" type="FR004_GenereAttributeType"/></td>
								</tr>
								<tr id="attrDetail<s:property value="#status.index"/>" class="hidden togglable">
									<td colspan="7">
										<ul class="list-icon">
											<s:url id="editUrl" action="attributeType" includeParams="none" escapeAmp="false">
												<s:param name="task">edit</s:param>
												<s:param name="popUp">true</s:param>
												<s:param name="attributeType" value="%{#attributeType.id}"></s:param>
											</s:url>
											<li onclick="editAttType('<s:property value="#editUrl" escape="false"/>');">
												<span class="glyphicon glyphicon-pencil with-tooltip" data-title="<s:text name="attributeType.image.edit"/>"></span>
												<br/><span class="glyphicon-descr"><s:text name="attributeType.image.edit"/></span>
											</li>
											<s:if test="!#attributeType.haveAttributes">
												<s:url id="deleteUrl" action="attributeType" includeParams="none" escapeAmp="false">
													<s:param name="task">delete</s:param>
													<s:param name="attributeType" value="%{#attributeType.id}"></s:param>
												</s:url>
												<li onclick="askConfirm('<s:property value="#deleteUrl" escape="false"/>','<s:text name="attributeType.list.askConfirmDelete"><s:param value="#attributeType.tipo"/><s:param value="#attributeType.tipo_descrizione"/></s:text>')">
													<span class="glyphicon glyphicon-floppy-remove with-tooltip" data-title="<s:text name="attributeType.image.delete"/>"></span>
													<br/><span class="glyphicon-descr"><s:text name="attributeType.image.delete"/></span>
												</li>
											</s:if>
											<s:url id="emptyCacheByTypeUrl" action="attributeType" includeParams="none" escapeAmp="false">
												<s:param name="task">emptyCacheByType</s:param>
												<s:param name="emptyCacheType" value="%{#attributeType.tipo}"></s:param>
											</s:url>
											<li onclick="emptyCacheByType('<s:property value="#emptyCacheByTypeUrl" escape="false"/>','<s:property value="#attributeType.tipo" />');">
												<span id="emptyCache<s:property value="#status.index"/>" class="glyphicon glyphicon-trash with-tooltip" data-title="<s:text name="attributeType.image.emptyCache"/>"></span>
												<br/><span class="glyphicon-descr"><s:text name="attributeType.image.emptyCache"/></span>
											</li>
										</ul>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 text-right">
				<ul class="group-list-icon">
					<s:if test="getConfigAsBoolean('Framework','DEFAULT','FRMK029_EnableSysAttExportXmlButton')">
						<s:url action="attributeType" id="attributeTypeXmlExportPopupUrl" escapeAmp="false" includeParams="none">
							<s:param name="task">attributeTypeXmlExportPopup</s:param>
						</s:url>
						<li onclick="exportToXmlPopup();">
							<span class="filetype xml with-tooltip" data-title="<s:text name="attributeType.image.exportToXml"/>"></span><br/>
							<span class="glyphicon-descr"><s:text name="attributeType.image.exportToXml"/></span>
						</li>
					</s:if>
					<s:if test="getConfigAsBoolean('Framework','DEFAULT','FRMK030_EnableSysAttGenerateScriptsButton')">
						<li onclick="checkAndGenerateScripts();">
							<span class="filetype sql with-tooltip" data-title="<s:text name="attributeType.image.generateScripts"/>"></span><br/>
							<span class="glyphicon-descr"><s:text name="attributeType.image.generateScripts"/></span>
						</li>
					</s:if>
				</ul>
			</div>
		</div>
		<s:if test="attributeTypeSearch.getTotalPage() > 1">
			<div class="row">
				<div class="col-xs-12 text-center">
					<qs2:ajaxpager value="%{pager}" functionName="listPage"></qs2:ajaxpager>
				</div>
			</div>
		</s:if>
	</s:if>
	<s:else><s:text name="attributeType.list.noResults"/></s:else>
</div>