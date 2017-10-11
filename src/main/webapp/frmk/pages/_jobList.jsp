<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="col-xs-12">
	<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-condensed">
				<div class="row">
					<div class="col-xs-3 text-left">
						<b><s:text name="scheduler.job.search.numRecord"/>&nbsp;<span class="label label-info"><s:property value="searchJob.getTotal()"/></span></b>
						<s:if test="listJob.size() > 0" >
							<br/><small><s:text name="scheduler.job.search.pageRecord"/>&nbsp;<span class="label label-info">
								<s:property value="searchJob.getRowPerPage()*(searchJob.getPage()-1) + 1"/>-
								<s:property value="listJob.size()+searchJob.getRowPerPage()*(searchJob.getPage()-1)"/>
							</span></small>
						</s:if>
					</div>
					<div class="col-xs-9 text-right">
						<ul class="group-list-icon">
							<li onclick="resetScheduler();">
								<span class="glyphicon glyphicon-refresh with-tooltip" data-title="<s:text name="scheduler.resetScheduler"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="scheduler.resetScheduler"/></span>
							</li>
							<li onclick="listaContext();">
								<span class="glyphicon glyphicon-th-list with-tooltip" data-title="<s:text name="button.toContextList"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="button.toContextList"/></span>
							</li>
							<li onclick="listaEsecuzioni();">
								<span class="glyphicon glyphicon-tasks with-tooltip" data-title="<s:text name="button.toRunningList"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="button.toRunningList"/></span>
							</li>
							<li onclick="createPage()">
								<span class="glyphicon glyphicon-plus-sign with-tooltip" data-title="<s:text name="button.createJob"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="button.createJob"/></span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="listJob.size() > 0" >
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table class="table table-hover table-striped table-bottom-border">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th><s:text name="scheduler.job.list.name"/></th>
								<th><s:text name="scheduler.job.list.context"/></th>
								<th><s:text name="scheduler.job.list.cronExpression"/></th>
								<th><s:text name="scheduler.job.list.className"/></th>
								<th><s:text name="scheduler.job.list.recovery"/></th>
								<th><s:text name="scheduler.job.list.stateful"/></th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="listJob" id="job" status="status">
								<tr id="jobDesc<s:property value="#status.index"/>">
									<td>
										<span id="jobToggle<s:property value="#status.index"/>"
											onclick="toggleRow('jobDetail<s:property value="#status.index"/>','jobToggle<s:property value="#status.index"/>');"
											class="glyphicon glyphicon-plus clickable"></span>
									</td>
									<td><s:property value="#job.name" /></td>
									<td><s:property value="#job.context_name" /></td>
									<td><s:property value="#job.cronExpression" /></td>
									<td><s:property value="#job.className" /></td>
									<td>
										<span class="glyphicon <s:if test="#job.recoveryYN">glyphicon-ok text-success</s:if>
											<s:else>glyphicon-remove text-danger</s:else>"/>
									</td>
									<td>
										<span class="glyphicon <s:if test="#job.statefulYN">glyphicon-ok text-success</s:if>
											<s:else>glyphicon-remove text-danger</s:else>"/>
									</td>
								</tr>
								<tr id="jobDetail<s:property value="#status.index"/>" class="hidden togglable">
									<td colspan="9">
										<ul class="list-icon">
											<s:url id="editUrl" action="scheduler" includeParams="none" escapeAmp="false">
												<s:param name="task">edit</s:param>
												<s:param name="job" value="%{#job.name}"/>
											</s:url>
											<li onclick="editJob('<s:property value="#editUrl" escape="false"/>');">
												<span class="glyphicon glyphicon-pencil with-tooltip" data-title="<s:text name="attributeType.image.edit"/>"></span>
												<br/><span class="glyphicon-descr"><s:text name="attributeType.image.edit"/></span>
											</li>
											<s:url id="fireJobUrl" action="scheduler" includeParams="none" escapeAmp="false">
												<s:param name="task">forceJobStart</s:param>
												<s:param name="jobName" value="%{#job.name}"/>
											</s:url>
											<li onclick="forceStartJob('<s:property value="#fireJobUrl" escape="false"/>');">
												<span class="glyphicon glyphicon-play with-tooltip" data-title="<s:text name="scheduler.job.action.fire"/>"></span>
												<br/><span class="glyphicon-descr"><s:text name="scheduler.job.action.fire"/></span>
											</li>
											<s:if test="jobDeletableList.get(#status.index)">
												<s:url id="deleteUrl" action="scheduler" includeParams="none" escapeAmp="false">
													<s:param name="task">delete</s:param>
													<s:param name="jobName" value="%{#job.name}"/>
												</s:url>
												<li onclick="deleteJob('<s:property value="#deleteUrl" escape="false"/>','<s:text name="scheduler.job.message.delete"><s:param value="#job.name"/></s:text>')">
													<span class="glyphicon glyphicon-remove with-tooltip" data-title="<s:text name="attributeType.image.delete"/>"></span>
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
		<s:if test="searchJob.getTotalPage() > 1">
			<div class="row">
				<div class="col-xs-12 text-center">
					<qs2:ajaxpager value="%{pagerJob}" functionName="listPage"></qs2:ajaxpager>
				</div>
			</div>
		</s:if>
	</s:if>
	<s:else><s:text name="scheduler.job.list.noResults"/></s:else>
</div>
<s:if test="%{!hasInternalScheduler()}">
<script type="text/javascript">
	$(function(){
		modal.alert('<s:text name="scheduler.external.title"/>',"<s:text name="scheduler.external.message"/>",'warning');
	});
</script>
</s:if>
