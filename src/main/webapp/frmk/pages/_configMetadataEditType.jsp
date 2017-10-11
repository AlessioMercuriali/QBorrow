<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="configMetadata.type == 'SysAttribute' ">
	<div class="control-group col-xs-12 col-sm-6 <qs2:inputErrorClass property="configMetadata.typeDomain" />">
		<label for="confDomain"><s:text name="configMetadata.list.typeDomain"/></label>
		<s:if test="!readonly && !configMetadata.systemYN">
			<input type="text" name="configMetadata.typeDomain" value="<s:property value="configMetadata.typeDomain"/>"
				id="confDomain" maxlength="50" class="form-control" required data-required-error="<s:text name="configMetadata.error.domain"/>"/>
		</s:if>
		<s:else><p class="form-control-static"><s:property value="configMetadata.typeDomain" /></p></s:else>
		<div class="help-block with-errors"><qs2:errors property="configMetadata.typeDomain" /></div>
	</div>
</s:if>
<s:elseif test="configMetadata.type == 'String' || configMetadata.type == 'URL' || configMetadata.type == 'Email'">
	<div class="col-xs-12 col-sm-6 <qs2:inputErrorClass property="configMetadata.multipleYN" />">
		<label for="confMultiple" class="checkbox">
			<s:if test="!readonly && !configMetadata.systemYN">
				<s:checkbox id="confMultiple" name="configMetadata.multipleYN" onclick="setResetMultipleMap('multiple');"/>
			</s:if>
			<s:else>
				<p id="confMultiple" class="form-control-static">
					<span class="glyphicon glyphicon-<s:if test="configMetadata.multipleYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
				</p>
			</s:else>
			<s:text name="configMetadata.list.multipleYN"/>
		</label>
		<div class="help-block"><qs2:errors property="configMetadata.multipleYN" /></div>
	</div>
	<div class="col-xs-12 col-sm-6 <qs2:inputErrorClass property="configMetadata.mapYN" />">
		<label for="confMap" class="checkbox">
			<s:if test="!readonly && !configMetadata.systemYN">
				<s:checkbox id="confMap" name="configMetadata.mapYN" onclick="setResetMultipleMap('map');"/>
			</s:if>
			<s:else>
				<p id="confMap" class="form-control-static">
					<span class="glyphicon glyphicon-<s:if test="configMetadata.mapYN">ok text-success</s:if><s:else>remove text-danger</s:else>"></span>
				</p>
			</s:else>
			<s:text name="configMetadata.list.mapYN"/>
		</label>
		<div class="help-block"><qs2:errors property="configMetadata.mapYN" /></div>
	</td>
</div>
</s:elseif>