<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="qf" uri="/quix-framework-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<table border="0" cellspacing="0" cellpadding="0" style="margin-top: 2px;border:1px solid #9E9E9E;" width="100%" >
	<tr>
		<s:iterator id="language" value="languages" status="code_status">
			<td class="label" style="text-align:center;" width="<s:property value="100/language.size()"/>%">
				<s:property value="#language"/>&nbsp;
			</td>
		</s:iterator>
	</tr>
	<tr>
		<td class="boxSeparator" colspan="<s:property value="languages.size() + 1"/>"><img border="0" src="<qs2:imagesPath framework="true" />" width="1" height="1"></td>
	</tr>
	<tr>
		<s:iterator id="language" value="languages" status="code_status">
			<td class="data" nowrap="nowrap" width="<s:property value="100/language.size()"/>%" <s:if test="detail && #code_status.index != languages.size() - 1">style="margin-top: 2px;border-right:1px solid #9E9E9E;"</s:if>>
				<s:if test="!detail">
					<s:textarea name="%{'attributeDescriptionInLanguage.'+#language}" theme="quixbasic" rows="5" cssClass="textInput" cssStyle="width:95%;"/>
					<qs2:errors property="%{'attribute.description_'+#language}" />
				</s:if>
				<s:else>
					<s:property value="attributeDescriptionInLanguage.get(#language)" />
				</s:else>
			
		</s:iterator>
	</tr>
</table>