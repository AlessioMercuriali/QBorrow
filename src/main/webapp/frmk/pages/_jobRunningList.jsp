<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">

	$(function () {
	  $('[data-toggle="tooltip"]').tooltip();
	});
	
</script>

<div class="col-xs-12">
	<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-condensed">
				<div class="row">
					<div class="col-xs-3 text-left">
						<b><s:text name="scheduler.running.list.title"/></b><br/>
						<b><s:text name="scheduler.job.search.numRecord"/>&nbsp;<span class="label label-info"><s:property value="searchJobRunning.getTotal()"/></span></b>
					</div>
					<div class="col-xs-9 text-right">
						<ul class="group-list-icon">
							<li onclick="updateJobRunningList();">
								<span class="glyphicon glyphicon-repeat with-tooltip" data-title="<s:text name="button.refresh"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="button.refresh"/></span>
							</li>
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
	<s:if test="listJobRunning.size() > 0" >
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
								<th class="narrow"><s:text name="scheduler.running.list.pct"/></th>
								<th class="narrow" nowrap="nowrap">Stop job</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="listJobRunning" id="job" status="status">
								<tr id="jobRunDesc<s:property value="#status.index"/>">
									<td class="narrow">
										<span id="jobRunToggle<s:property value="#status.index"/>"
											onclick="toggleRow('jobRunDetail<s:property value="#status.index"/>','jobRunToggle<s:property value="#status.index"/>');"
											class="glyphicon glyphicon-plus clickable"></span>
									</td>
									<td><s:property value="#job.name" />(<s:property value="#job.nodeName" />)</td>
									<td><s:property value="#job.context" /></td>
									<td><s:property value="#job.state" /></td>
									<td>
										<s:if test="#job.result != null">
											<s:if test="%{'true'.equalsIgnoreCase(#job.result)}">
												<s:property value="@it.quix.framework.core.model.enumeration.JobRunningStateEnum@SUCCESS.toString()" />
											</s:if>
											<s:else>
												<s:property value="@it.quix.framework.core.model.enumeration.JobRunningStateEnum@FAILURE.toString()" />
											</s:else>
										</s:if>
									</td>
									<td class="narrow text-right"><s:property value="#job.percentage"/> %</td>
									<td class="narrow text-right">
										<s:if test="!#job.stopped">
											<span data-toggle="tooltip" data-placement="left" title="Stop it!" 
											onclick="stopJob('<s:property value="#job.name"/>','<s:property value="#job.context"/>');" class="glyphicon glyphicon-stop clickable" style="color:#E41B17;"></span></td>
										</s:if>
										<s:else>
											Already stopped
										</s:else>	
								</tr>
								<tr id="jobRunDetail<s:property value="#status.index"/>" class="hidden togglable">
									<td colspan="7">
										<div class="row">
											<div class="col-xs-12 col-sm-4 col-md-3">
												<%-- <s:if test="#job.startDate != null"> --%>
													<label for="jobRunStart<s:property value="#status.index"/>"><s:text name="scheduler.history.list.dateStart"/></label>
													<p id="jobRunStart<s:property value="#status.index"/>"><s:property value="#job.startDate"/>&nbsp;</p>
												<%-- </s:if>
												<s:if test="#job.endDate != null"> --%>
													<label for="jobRunEnd<s:property value="#status.index"/>"><s:text name="scheduler.history.list.dateEnd"/></label>
													<p id="jobRunEnd<s:property value="#status.index"/>"><s:property value="#job.endDate"/>&nbsp;</p>
												<%-- </s:if> --%>
											</div>
											<div class="col-xs-12 col-sm-4 col-md-3">
												<label for="jobRunNum<s:property value="#status.index"/>"><s:text name="scheduler.history.list.counter"/></label>
												<p id="jobRunNum<s:property value="#status.index"/>"><s:property value="#job.counter"/>&nbsp;</p>
												<label for="jobRunNode<s:property value="#status.index"/>"><s:text name="scheduler.history.list.nodeName"/></label>
												<p id="jobRunNode<s:property value="#status.index"/>"><s:property value="#job.nodeName"/>&nbsp;</p>
											</div>
											<div class="col-xs-12 col-sm-6">
												<label for="jobRunMsg<s:property value="#status.index"/>"><s:text name="scheduler.history.list.message"/></label>
												<p id="jobRunMsg<s:property value="#status.index"/>"><s:property value="#job.message"/>&nbsp;</p>
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
	</s:if>
	<s:else><s:text name="scheduler.job.list.noResults"/></s:else>
</div>
