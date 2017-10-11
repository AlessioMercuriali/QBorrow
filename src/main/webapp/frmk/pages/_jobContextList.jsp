<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="col-xs-12">
	<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-condensed">
				<div class="row">
					<div class="col-xs-3 text-left">
						<b><s:text name="scheduler.job.search.numRecord"/>&nbsp;<span class="label label-info"><s:property value="searchJobContext.getTotal()"/></span></b>
						<s:if test="listJobContext.size() > 0" >
							<br/><small><s:text name="scheduler.job.search.pageRecord"/>&nbsp;<span class="label label-info">
								<s:property value="searchJobContext.getRowPerPage()*(searchJobContext.getPage()-1) + 1"/>-
								<s:property value="listJobContext.size()+searchJobContext.getRowPerPage()*(searchJobContext.getPage()-1)"/>
							</span></small>
						</s:if>
					</div>
					<div class="col-xs-9 text-right">
						<ul class="group-list-icon">
							<li onclick="backToJobList();">
								<span class="glyphicon glyphicon-arrow-left with-tooltip" data-title="<s:text name="button.backJobList"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="button.backJobList"/></span>
							</li>
							<li onclick="createPage()">
								<span class="glyphicon glyphicon-plus-sign with-tooltip" data-title="<s:text name="button.createJobContext"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="button.createJobContext"/></span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="listJobContext.size() > 0" >
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table class="table table-hover table-striped table-bottom-border">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th><s:text name="scheduler.context.list.name"/></th>
								<th><s:text name="scheduler.context.list.url"/></th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="listJobContext" id="jobContext" status="status">
								<tr id="contextDesc<s:property value="#status.index"/>">
									<td>
										<span id="contextToggle<s:property value="#status.index"/>"
											onclick="toggleRow('contextDetail<s:property value="#status.index"/>','contextToggle<s:property value="#status.index"/>');"
											class="glyphicon glyphicon-plus clickable"></span>
									</td>
									<td><s:property value="#jobContext.name" /></td>
									<td><s:property value="#jobContext.url" /></td>
								</tr>
								<tr id="contextDetail<s:property value="#status.index"/>" class="hidden togglable">
									<td colspan="9">
										<ul class="list-icon">
											<s:if test="jobContextEditableList.get(#status.index)">
												<s:url id="editUrl" action="scheduler" includeParams="none" escapeAmp="false">
													<s:param name="task">editContext</s:param>
												</s:url>
												<li onclick="editContext('<s:property value="#editUrl" escape="false"/>&jobContext=<s:property value="%{#jobContext.name}"/>');">
													<span class="glyphicon glyphicon-pencil with-tooltip" data-title="<s:text name="attributeType.image.edit"/>"></span>
													<br/><span class="glyphicon-descr"><s:text name="attributeType.image.edit"/></span>
												</li>
											</s:if>
											<s:if test="jobContextDeletableList.get(#status.index)">
												<s:url id="deleteUrl" action="scheduler" includeParams="none" escapeAmp="false">
													<s:param name="task">deleteContext</s:param>
													<s:param name="jobContext" value="%{#jobContext.name}"/>
												</s:url>
												<li onclick="deleteContext('<s:property value="#deleteUrl" escape="false"/>')">
													<span class="glyphicon glyphicon-floppy-remove with-tooltip" data-title="<s:text name="attributeType.image.delete"/>"></span>
													<br/><span class="glyphicon-descr"><s:text name="attributeType.image.delete"/></span>
												</li>
											</s:if>
										</ul>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<s:if test="searchJobContext.getTotalPage() > 1">
			<div class="row">
				<div class="col-xs-12 text-center">
					<qs2:ajaxpager value="%{pagerJob}" functionName="listPage"></qs2:ajaxpager>
				</div>
			</div>
		</s:if>
	</s:if>
	<s:else><s:text name="scheduler.job.list.noResults"/></s:else>
</div>
