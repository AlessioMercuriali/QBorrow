<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<div class="modal modal-embedded fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body hidden">
			</div>
			<div class="modal-footer">
				<img class="center-block img-responsive" src="<qs2:imagesPath framework="true" nome="/gif-load.gif"/>" alt="<s:text name="loading.text"/>"/>
			</div>
		</div>
	</div>
</div>