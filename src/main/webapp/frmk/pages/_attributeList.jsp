<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="col-xs-12">
	<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-condensed">
				<div class="row">
					<div class="col-xs-3 text-left">
						<b><s:text name="attribute.search.numRecord"/>&nbsp;<span class="label label-info"><s:property value="attributeSearch.getTotal()"/></span></b>
						<s:if test="attributeList.size() > 0" >
							<br/><small>
								<s:text name="attribute.search.pageRecord"/>&nbsp;<span class="label label-info">
									<s:property value="attributeSearch.getRowPerPage()*(attributeSearch.getPage()-1) + 1"/>-
									<s:property value="attributeList.size()+attributeSearch.getRowPerPage()*(attributeSearch.getPage()-1)"/>
								</span>
							</small>
						</s:if>
					</div>
					<div class="col-xs-9 text-right">
						<s:if test="!popUp">
							<ul class="group-list-icon">
								<s:if test="!noBack">
									<li onclick="backAttrTypeList();">
										<span class="glyphicon glyphicon-arrow-left with-tooltip" data-title="<s:text name="button.backAttrTypeList"/>"></span><br/>
										<span class="glyphicon-descr"><s:text name="button.backAttrTypeList"/></span>
									</li>
								</s:if>
								<li onclick="downloadExcelTemplate(<s:property value="attributeSearch.getTotal()"/>);">
									<span class="filetype xls with-tooltip" data-title="<s:text name="attributeImportExcel.fileExcel"/>"></span><br/>
									<span class="glyphicon-descr"><s:text name="attributeImportExcel.fileExcel"/></span>
								</li>
								<li onclick="createPage()">
									<span class="glyphicon glyphicon-plus-sign with-tooltip" data-title="<s:text name="button.createAttribute"/>"></span><br/>
									<span class="glyphicon-descr"><s:text name="button.createAttribute"/></span>
								</li>
							</ul>
						</s:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="attributeList.size() > 0" >
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table class="table table-hover table-striped table-bottom-border">
						<thead>
							<tr>
								<th style="width:1%;">&nbsp;</th>
								<th style="width:1%;">&nbsp;</th>
								<th><s:text name="attribute.list.description"/></th>
								<th><s:text name="attribute.list.code"/></th>
								<th><s:text name="attribute.list.organization"/></th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="attributeList" id="attribute" status="status">
								<tr id="attrDesc<s:property value="#status.index"/>">
									<td>
										<span id="attrToggle<s:property value="#status.index"/>"
											onclick="toggleRow('attrDetail<s:property value="#status.index"/>','attrToggle<s:property value="#status.index"/>');"
											class="glyphicon glyphicon-plus clickable"></span>
									</td>
									<td>
										<s:if test="#attribute.activeFlag">
											<s:url id="editUrl" action="attribute" includeParams="none" escapeAmp="false">
												<s:param name="task">edit</s:param>
												<s:param name="detailMode">false</s:param>
												<s:param name="attribute" value="%{#attribute.id}"></s:param>
												<s:param name="noBack"><s:property value="noBack" /></s:param>
											</s:url>
											<span class="glyphicon clickable glyphicon-pencil with-tooltip" data-title="<s:text name="attribute.image.edit"/>" onclick="editAttribute('<s:property value="#editUrl" escape="false"/>')"></span>
										</s:if>
										<s:else>
											<span class="glyphicon glyphicon glyphicon glyphicon-ban-circle with-tooltip" data-title="<s:text name="attribute.image.noEdit"/>">
										</s:else>
									</td>
									<td class="long-descr"><s:property value="#attribute.description" /></td>
									<td><s:property value="#attribute.code" /></td>
									<td><s:property value="#attribute.organization" /></td>
								</tr>
								<tr id="attrDetail<s:property value="#status.index"/>" class="hidden togglable">
									<td colspan="5">
										<ul class="list-icon">
											<s:if test="#attribute.activeFlag">
												<s:url id="deleteUrl" action="attribute" includeParams="none" escapeAmp="false">
													<s:param name="task">delete</s:param>
													<s:param name="attribute" value="%{#attribute.id}"></s:param>
													<s:param name="noBack"><s:property value="noBack" /></s:param>
												</s:url>
												<li onclick="askConfirm('<s:property value="#deleteUrl" escape="false"/>','<s:text name="attribute.list.askConfirmDelete"><s:param value="#attribute.code"/><s:param value="#attribute.description"/></s:text>')">
													<span class="glyphicon glyphicon-remove with-tooltip" data-title="<s:text name="attribute.image.delete"/>"></span><br/>
													<span class="glyphicon-descr"><s:text name="attribute.image.delete"/></span>
												</li>
											</s:if>
											<s:else>
												<s:url id="restoreUrl" action="attribute" includeParams="none" escapeAmp="false">
													<s:param name="task">restore</s:param>
													<s:param name="attribute" value="%{#attribute.id}"></s:param>
													<s:param name="noBack"><s:property value="noBack" /></s:param>
												</s:url>
												<li onclick="askConfirm('<s:property value="#restoreUrl" escape="false"/>','<s:text name="attribute.list.askConfirmRestore"><s:param value="#attribute.code"/><s:param value="#attribute.description"/></s:text>')">
													<span class="glyphicon glyphicon-refresh with-tooltip" data-title="<s:text name="attribute.image.restore"/>"></span><br/>
													<span class="glyphicon-descr"><s:text name="attribute.image.restore"/></span>
												</li>
											</s:else>
										</ul>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<s:if test="attributeSearch.getTotalPage() > 1">
			<div class="row">
				<div class="col-xs-12 text-center">
					<qs2:ajaxpager value="%{pager}" functionName="listPage"></qs2:ajaxpager>
				</div>
			</div>
		</s:if>
	</s:if>
	<s:else><s:text name="attribute.list.noResults"/></s:else>
</div>
