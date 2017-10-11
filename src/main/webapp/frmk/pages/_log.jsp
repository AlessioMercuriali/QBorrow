<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<div class="col-xs-12">
	<div class="row spacer-top">
		<div class="col-xs-12">
			<div class="alert alert-info alert-condensed">
				<div class="row">
					<div class="col-xs-3">
						<b><s:text name="logger.search.numRecord"/>&nbsp;<span class="label label-info"><s:property value="total"/></span></b>
						<s:if test="listResult.size() > 0" >
							<br/><small>
								<s:text name="logger.search.pageRecord"/>&nbsp;<span class="label label-info">
									<s:property value="rowPerPage*(page-1) + 1"/>-
									<s:property value="listResult.size()+rowPerPage*(page-1)"/>
								</span>
							</small>
						</s:if>
					</div>
					<div class="col-xs-9 text-right">
						<ul class="group-list-icon">
							<li onclick="systemLogList()">
								<span class="glyphicon glyphicon-th-list with-tooltip" data-title="<s:text name="button.systemLogs"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="button.systemLogs"/></span>
							</li>
							<li onclick="createPage()">
								<span class="glyphicon glyphicon-plus-sign with-tooltip" data-title="<s:text name="button.createLogger"/>"></span><br/>
								<span class="glyphicon-descr"><s:text name="button.createLogger"/></span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<s:if test="listResult.size() != 0">
		<div class="row">
			<div class="col-xs-12 table-responsive">
				<table class="table table-striped table-hover table-condensed table-bottom-border">
					<thead>
						<tr>
							<th><s:text name="logger.list.name"/></th>
							<th><s:text name="logger.list.level"/></th>
							<th width="20%">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator id="logNode" value="listResult" status="status">
							<tr>
								<td>&raquo;&nbsp;<s:property value="#logNode.logger.name"/></td>
								<td><b id="logLevel_<s:property value="#status.index"/>"><s:property value="#logNode.logger.level"/></b></td>
								<td>
									<div class="input-group">
									<select id="selLevel<s:property value="#status.index"/>" name="level" class="form-control">
										<option value="">&nbsp;</option>
										<option value="DEBUG">DEBUG</option>
										<option value="INFO">INFO</option>
										<option value="WARN">WARN</option>
										<option value="ERROR">ERROR</option>
										<option value="FATAL">FATAL</option>
									</select>
									<span class="input-group-addon clickable" onclick="updateLog('<s:property value="#logNode.logger.name"/>',<s:property value="#status.index"/>);"><span class="glyphicon glyphicon-refresh"></span></span> 
									</div>
								</td>
							</tr>
						</s:iterator>
					</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 text-center"><qs2:ajaxpager value="%{pager}" functionName="listPage"/></div>
	</div>
	</s:if>
</div>