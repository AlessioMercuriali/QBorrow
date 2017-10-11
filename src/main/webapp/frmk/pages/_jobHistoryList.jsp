<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="col-xs-12">
	<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-condensed">
				<div class="row">
					<div class="col-xs-3 text-left">
						<b><s:text name="scheduler.job.search.numRecord"/>&nbsp;<span class="label label-info"><s:property value="searchJobHistory.getTotal()"/></span></b>
						<s:if test="listJobHistory.size() > 0" >
							<br/><small><s:text name="scheduler.job.search.pageRecord"/>&nbsp;<span class="label label-info">
								<s:property value="searchJobHistory.getRowPerPage()*(searchJobHistory.getPage()-1) + 1"/>-
								<s:property value="listJobHistory.size()+searchJobHistory.getRowPerPage()*(searchJobHistory.getPage()-1)"/>
							</span></small>
						</s:if>
					</div>
					<div class="col-xs-9 text-right">
						<ul class="group-list-icon">
							<li onclick="backToJobList();">
								<span class="glyphicon glyphicon-arrow-left with-tooltip" data-title="<s:text name="button.backJobList"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="button.backJobList"/></span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="listJobHistory.size() > 0" >
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table class="table table-hover table-striped table-bottom-border;">
						<thead>
							<tr>
								<th class="narrow">&nbsp;</th>
								<th><s:text name="scheduler.history.list.name"/></th>
								<th><s:text name="scheduler.history.list.context"/></th>
								<th><s:text name="scheduler.history.list.state"/></th>
								<th><s:text name="scheduler.history.list.result"/></th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="listJobHistory" id="job" status="status">
								<tr id="jobDesc<s:property value="#status.index"/>">
									<td class="narrow">
										<span id="jobToggle<s:property value="#status.index"/>"
											onclick="toggleRow('jobDetail<s:property value="#status.index"/>','jobToggle<s:property value="#status.index"/>');"
											class="glyphicon glyphicon-plus clickable"></span>
									</td>
									<td><s:property value="#job.name" /></td>
									<td><s:property value="#job.context" /></td>
									<td><s:property value="#job.state" /></td>
									<td><s:property value="#job.result" /></td>
								</tr>
								<tr id="jobDetail<s:property value="#status.index"/>" class="hidden togglable">
									<td colspan="9">
										<div class="row">
											<div class="col-xs-12 col-sm-6 col-md-3">
												<label for="jobDuration<s:property value="#status.index"/>"><s:text name="scheduler.history.list.duration"/></label>
												<p id="jobDuration<s:property value="#status.index"/>"><s:property value="#job.duration"/></p>
												<s:if test="#job.dateStart != null">
													<label for="jobStart<s:property value="#status.index"/>"><s:text name="scheduler.history.list.dateStart"/></label>
													<p id="jobStart<s:property value="#status.index"/>"><s:property value="#job.dateStart"/></p>
												</s:if>
												<s:if test="#job.dateEnd != null">
													<label for="jobEnd<s:property value="#status.index"/>"><s:text name="scheduler.history.list.dateEnd"/></label>
													<p id="jobEnd<s:property value="#status.index"/>"><s:property value="#job.dateEnd"/></p>
												</s:if>
											</div>
											<div class="col-xs-12 col-sm-6 col-md-3">
												<label for="jobNum<s:property value="#status.index"/>"><s:text name="scheduler.history.list.counter"/></label>
												<p id="jobNum<s:property value="#status.index"/>"><s:property value="#job.counter"/></p>
												<label for="jobNode<s:property value="#status.index"/>"><s:text name="scheduler.history.list.nodeName"/></label>
												<p id="jobNode<s:property value="#status.index"/>"><s:property value="#job.nodeName"/></p>
											</div>
											<div class="col-xs-12 col-sm-6">
												<label for="jobMsg<s:property value="#status.index"/>"><s:text name="scheduler.history.list.message"/></label>
												<p id="jobMsg<s:property value="#status.index"/>"><s:property value="#job.message"/></p>
											</div>
										</div>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<s:if test="searchJobHistory.getTotalPage() > 1">
			<div class="row">
				<div class="col-xs-12 text-center">
					<qs2:ajaxpager value="%{pagerJob}" functionName="listPage"></qs2:ajaxpager>
				</div>
			</div>
		</s:if>
	</s:if>
	<s:else><s:text name="scheduler.job.list.noResults"/></s:else>
</div>
