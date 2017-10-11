<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="col-xs-12">
	<div class="row">
		<div class="col-xs-12">
			<div class="alert alert-info alert-collapsed">
				<div class="row">
					<div class="col-xs-3 text-left">
						<b><s:text name="lockManager.list.numRecord"/>&nbsp;<span class="label label-info"><s:property value="lockGroupSearch.getTotal()"/></span></b>
						<s:if test="lockGroupList.size() > 0" >
							<br/><small><s:text name="lockManager.list.pageRecord"/>&nbsp;<span class="label label-info">
								<s:property value="lockGroupSearch.getRowPerPage()*(lockGroupSearch.getPage()-1) + 1"/>-
								<s:property value="lockGroupList.size()+lockGroupSearch.getRowPerPage()*(lockGroupSearch.getPage()-1)"/>
							</span></small>
						</s:if>
					</div>
					<div class="col-xs-9 text-right"></div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="lockGroupList.size() > 0" >
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table class="table table-hover table-striped table-bottom-border">
						<thead>
							<tr>
								<th witdh="1%">&nbsp;</th>
								<th><s:text name="lockManagerGroup.list.lockUser"/></th>
								<th><s:text name="lockManagerGroup.list.numLock"/></th>
								<th><s:text name="lockManagerGroup.list.lockTime"/></th>
								<th><s:text name="lockManagerGroup.list.checkTime"/></th>
								<th><s:text name="lockManagerGroup.list.machineName"/></th>
								<th><s:text name="lockManagerGroup.list.system"/></th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="lockGroupList" id="lockGroup" status="status">
								<tr id="lockGroupDesc<s:property value="#status.index"/>">
									<td>
									<s:if test="lockGroupItemsMap.get(#lockGroup.id) != null && lockGroupItemsMap.get(#lockGroup.id).size() != 0">
										<span id="lockGroupToggle<s:property value="#status.index"/>"
											onclick="toggleRow('lockGroupDetail<s:property value="#status.index"/>','lockGroupToggle<s:property value="#status.index"/>');"
											class="glyphicon glyphicon-plus clickable"/>
									</s:if>
									</td>
									<td><s:property value="#lockGroup.lockUser" /></td>
									<td><s:property value="#lockGroup.numLock" /></td>
									<td><s:property value="#lockGroup.lockTime" /></td>
									<td><s:property value="#lockGroup.checkTime" /></td>
									<td><s:property value="#lockGroup.machineName" /></td>
									<td>
										<span class="glyphicon <s:if test="#lockGroup.system">glyphicon-ok text-success</s:if>
											<s:else>glyphicon-remove text-danger</s:else>"/>
									</td>
								</tr>
								<tr id="lockGroupDetail<s:property value="#status.index"/>" class="hidden togglable">
									<td colspan="9">
										<div class="row">
											<div class="col-xs-8" id="itemDiv<s:property value="#status.index"/>">
												<s:property value="setStatusIndex(#status.index)"/>
												<jsp:include page="_lockItemList.jsp" />
											</div>
											<div class="col-xs-4">
												<ul class="list-icon">
													<s:url id="unlockUrl" action="lockManager" includeParams="none" escapeAmp="false">
														<s:param name="task">unlock</s:param>
														<s:param name="lockGroupId" value="%{#lockGroup.id}"></s:param>
													</s:url>
													<li onclick="askConfirmUnlock('<s:property value="#unlockUrl" escape="false"/>', '<s:property value="#lockGroup.numLock"/>');"">
														<span class="glyphicon glyphicon-lock with-tooltip" data-title="<s:text name="lockManager.image.unlock"/>"></span>
															<br/><span class="glyphicon-descr"><s:text name="lockManager.image.unlock"/></span>
													</>
													<s:if test="#lockGroup.system">
														<s:url id="forceUnlockUrl" action="lockManager" includeParams="none" escapeAmp="false">
															<s:param name="task">forceUnlockSystem</s:param>
															<s:param name="lockGroupId" value="%{#lockGroup.id}"></s:param>
														</s:url>
														<li onclick="askConfirmForceUnlock('<s:property value="#forceUnlockUrl" escape="false"/>', '<s:property value="#lockGroup.numLock"/>');">
															<span class="glyphicon glyphicon-lock with-tooltip" data-title="<s:text name="lockManager.image.forceUnlock"/>"></span>
															<br/><span class="glyphicon-descr"><s:text name="lockManager.image.forceUnlock"/></span>
														</li>
													</s:if>
												</ul>
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
		<s:if test="lockGroupSearch.getTotalPage() > 1">
			<div class="row">
				<div class="col-xs-12 text-center">
					<qs2:ajaxpager value="%{pager}" functionName="listPage"></qs2:ajaxpager>
				</div>
			</div>
		</s:if>
	</s:if>
	<s:else><s:text name="lockManager.list.noResults"/></s:else>
</div>