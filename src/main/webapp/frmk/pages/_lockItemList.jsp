<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<table class="table table-condensed table-striped table-bordered">
	<thead>
		<tr>
			<th><s:text name="lockManager.item.list.name" /></th>
			<th><s:text name="lockManager.item.list.description" /></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator id="item" value="lockGroupItemsMap.get(#lockGroup.id)" status="status2">
			<tr>
				<td><s:property value="#item.name"/></td>
				<td><s:property value="#item.description"/></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
