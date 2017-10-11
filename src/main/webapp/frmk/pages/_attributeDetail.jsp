<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="qf" uri="/quix-framework-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:iterator id="atAttribute" value="attributeTypeAttributes" status="atAttributeStatus">
	<s:if test="#atAttribute.visibileYN">
		<s:set var="index" value="#atAttributeStatus.index + 1"/>
		<tr>	
			<td class="label" width="1%">
				<s:property value="labelsAndHelpersAttributesForEditMap.get('ATT'+#index+'_LABEL')" />
			</td>
			<td class="data" colspan="2">
				<s:if test="#atAttribute.tipo == @it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Vero_Falso.name()">
					<s:if test="#index == 1">
						<s:if test="attribute.attribute1 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>				
					</s:if>
					<s:if test="#index == 2">
						<s:if test="attribute.attribute2 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>
					</s:if>
					<s:if test="#index == 3">
						<s:if test="attribute.attribute3 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>
					</s:if>
					<s:if test="#index == 4">
						<s:if test="attribute.attribute4 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>
					</s:if>
					<s:if test="#index == 5">
						<s:if test="attribute.attribute5 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>
					</s:if>
					<s:if test="#index == 6">
						<s:if test="attribute.attribute6 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>
					</s:if>
					<s:if test="#index == 7">
						<s:if test="attribute.attribute7 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>
					</s:if>
					<s:if test="#index == 8">
						<s:if test="attribute.attribute8 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>
					</s:if>
					<s:if test="#index == 9">
						<s:if test="attribute.attribute9 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>
					</s:if>
					<s:if test="#index == 10">
						<s:if test="attribute.attribute10 == 'true'">
							<img border="0" title="<s:text name="image.yes"/>" alt="<s:text name="image.yes"/>" src="<qs2:imagesPath framework="true" nome="/tick.png" />">
						</s:if>
						<s:else>
							<img border="0" title="<s:text name="image.no"/>" alt="<s:text name="image.no"/>" src="<qs2:imagesPath framework="true" nome="/cross.png" />">
						</s:else>
					</s:if>
				</s:if>
				<s:elseif test="#atAttribute.tipo == @it.quix.framework.core.model.enumeration.AttributeTypeEnumTipo@Color_Picker.name()">
					<s:if test="#index == 1">
						<div style="width:12px;height:12px;border:1px solid;background-color:<s:property value="attribute.attribute1"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>				
					</s:if>
					<s:if test="#index == 2">
						<div style="width:12px;height:12px;border:1px solid;backgroung-color:<s:property value="attribute.attribute2"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>
					</s:if>
					<s:if test="#index == 3">
						<div style="width:12px;height:12px;border:1px solid;backgroung-color:<s:property value="attribute.attribute3"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>
					</s:if>
					<s:if test="#index == 4">
						<div style="width:12px;height:12px;border:1px solid;backgroung-color:<s:property value="attribute.attribute4"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>
					</s:if>
					<s:if test="#index == 5">
						<div style="width:12px;height:12px;border:1px solid;backgroung-color:<s:property value="attribute.attribute5"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>
					</s:if>
					<s:if test="#index == 6">
						<div style="width:12px;height:12px;border:1px solid;backgroung-color:<s:property value="attribute.attribute6"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>
					</s:if>
					<s:if test="#index == 7">
						<div style="width:12px;height:12px;border:1px solid;backgroung-color:<s:property value="attribute.attribute7"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>
					</s:if>
					<s:if test="#index == 8">
						<div style="width:12px;height:12px;border:1px solid;backgroung-color:<s:property value="attribute.attribute8"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>
					</s:if>
					<s:if test="#index == 9">
						<div style="width:12px;height:12px;border:1px solid;backgroung-color:<s:property value="attribute.attribute9"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>
					</s:if>
					<s:if test="#index == 10">
						<div style="width:12px;height:12px;border:1px solid;backgroung-color:<s:property value="attribute.attribute10"/>" id="<s:property value="%{'colorPickerDiv_id'+#atAttributeStatus.index}"/>"></div>
					</s:if>
				</s:elseif>
				<s:else>
					<s:if test="#index == 1">
						<s:property value="attribute.attribute1"/>				
					</s:if>
					<s:if test="#index == 2">
						<s:property value="attribute.attribute2"/>
					</s:if>
					<s:if test="#index == 3">
						<s:property value="attribute.attribute3"/>
					</s:if>
					<s:if test="#index == 4">
						<s:property value="attribute.attribute4"/>
					</s:if>
					<s:if test="#index == 5">
						<s:property value="attribute.attribute5"/>
					</s:if>
					<s:if test="#index == 6">
						<s:property value="attribute.attribute6"/>
					</s:if>
					<s:if test="#index == 7">
						<s:property value="attribute.attribute7"/>
					</s:if>
					<s:if test="#index == 8">
						<s:property value="attribute.attribute8"/>
					</s:if>
					<s:if test="#index == 9">
						<s:property value="attribute.attribute9"/>
					</s:if>
					<s:if test="#index == 10">
						<s:property value="attribute.attribute10"/>
					</s:if>
				</s:else>
			</td>
			<td class="data helper" colspan="3">
				<s:property value="labelsAndHelpersAttributesForEditMap.get('ATT'+#index+'_HELPER')"/>
			</td>
		</tr>
		<tr>
			<td class="boxSeparator" colspan="6"><img border="0" src="<qs2:imagesPath framework="true" />" width="1" height="1"></td>
		</tr>
	</s:if>
</s:iterator>