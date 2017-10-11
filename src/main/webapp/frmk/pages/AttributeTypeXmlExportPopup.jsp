<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<script type="text/javascript">
function expo(){
	var expoAttrs = $('#expoAttrs').prop('checked');
	exportToXml(expoAttrs);
}
</script>
<s:form action="attributeType" role="form" cssClass="form-horizontal">
	<s:if test="selectedAttributeTypes != null && selectedAttributeTypes.size() > 0">
		<div class="form-group">
			<div class="col-xs-12 col-sm-offset-4 col-sm-8">
				<label class="checkbox"><input type="checkbox" id="expoAttrs"><s:text name="attributeType.exportXml.exportAttributes"/></label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-xs-12 text-center">
				<button type="button" class="btn btn-primary" onclick="expo();" data-dismiss="modal"><s:text name="button.exportXml"/></button>
				<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.cancel"/></button>
			</div>
		</div>
	</s:if>
	<s:else>
		<div class="row">
			<div class="col-xs-12 text-center">
				<s:text name="attributeType.export.selectAtLeastOne"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-xs-12 text-center">
				<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.cancel"/></button>
			</div>
		</div>
	</s:else>
</s:form>