<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="col-xs-12">
	<div class="row spacer-top">
		<div class="col-xs-12">
			<div class="panel panel-info">
				<div class="panel-heading"><h4 class="panel-title"><s:text name="message.list.title"/></h4></div>
				<div class="panel-footer">
					<div class="row">
						<div class="col-xs-3"><s:text name="message.list.total"/>&nbsp;<span class="badge"><s:property value="%{total}" /></span></div>
						<div class="col-xs-9 text-right">
							<ul class="group-list-icon">
								<li onclick="newMessage();">
									<span class="glyphicon glyphicon-plus-sign with-tooltip" data-title="<s:text name="button.newMessage"/>"></span><br/>
									<span class="glyphicon-descr"><s:text name="button.newMessage"/></span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="messageList.size() > 0">
		<div class="row">
			<div class="col-xs-12 table-responsive">
				<table class="table table-striped table-hover table-condensed table-bottom-border">
					<thead>
						<tr>
							<th width="1%"></th>
							<th width="1%"></th>
							<th><s:text name="message.list.content"/></th>
							<th><s:text name="message.list.expiration"/></th>
					</thead>
					<tbody>
						<s:iterator id="message" value="messageList" status="status">
							<tr>
								<td>
									<s:url id="editMessageUrl" action="message" escapeAmp="false" includeParams="none">
										<s:param name="task">edit</s:param>
										<s:param name="message" value="%{#message.messageId}"></s:param>
									</s:url>
									<span class="glyphicon glyphicon-pencil with-tooltip clickable" onclick="editMessage('<s:property value="#editMessageUrl" escape="false"/>')"
										data-title="<s:text name="message.image.modify"/>"></span>
								</td>
								<td><%-- cancel --%>
									<s:url id="delMessageUrl" action="message" includeParams="none" escapeAmp="false">
										<s:param name="task">delete</s:param>
										<s:param name="message" value="%{#message.messageId}"></s:param>
									</s:url>
									<span class="glyphicon glyphicon-remove with-tooltip clickable" onclick="deleteMessage('<s:property value="#delMessageUrl" escape="false"/>')"
										data-title="<s:text name="message.image.delete"/>"></span>
								</td>
								<td>
									<s:if test="isOutOfDate(#message.expiration)"><i></s:if>
									<s:property value="#message.content"/>
									<s:if test="isOutOfDate(#message.expiration)"></i></s:if>
								</td>
								<td>
									<s:if test="isOutOfDate(#message.expiration)"><i></s:if>
									<s:property value="#message.expiration"/>
									<s:if test="isOutOfDate(#message.expiration)"></i></s:if>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
		<s:if test="total > rowPerPage">
			<div class="row"><%-- pager --%>
				<div class="col-xs-12 text-center">
					<qs2:ajaxpager value="%{pager}" functionName="listPage"></qs2:ajaxpager>
				</div>
			</div>
		</s:if>
	</s:if>
	<s:else>
		<s:text name="message.list.nomessage"/>
	</s:else>
</div>