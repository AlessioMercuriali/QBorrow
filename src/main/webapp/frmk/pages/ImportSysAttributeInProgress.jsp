<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<script type="text/javascript">
function checkFinishThread(){
	var params = [{name:'task',value:'progress2'},
		{name:'foo',value:new Date()}];
	qamCall('<%= request.getContextPath() %>/attributeType.action',params,checkUploadReturn,'json','get');
}
function checkUploadReturn(data) {
	if(data.terminated) {
		clearInterval(timerIDProgress);
		delete timerIDProgress;
		modal.closeNsearch();
	}else{
		var st = $('#importStatus'), sp = $('#progStatus');
		switch(data.status){
		case 0: st.text(data.msg); break;
		case 1: st.text(data.msg+' '+data.pType+'/'+data.tType);
			var val = (data.pType/data.tType*100).toFixed(2);
			console.log(val);
			sp.css('width',val+'%');
			sp.attr('aria-valuenow',val);
			break;
		case 2: st.text(data.msg+' '+data.pAttr+'/'+data.tAttr);
			var val = (data.pAttr/data.tAttr*100).toFixed(2);
			console.log(val);
			sp.css('width',val+'%');
			sp.attr('aria-valuenow',val);
			break;
		default: st.text('Error'); break;
		}
	}
}
var timerIDProgress = 0;
$(function(){
	timerIDProgress = setInterval(checkFinishThread, 1000);
});
</script>
<div class="row">
	<div class="col-xs-12 col-sm-offset-2 col-sm-8 text-center">
		<p class="text-info"><span class="glyphicon glyphicon-cog"></span>&nbsp;<b id="importStatus"><s:text name="attributeType.importInProgress"/></b>&nbsp;<span class="glyphicon glyphicon-cog"></span></p>
		<div class="progress progress-striped active">
			<div id="progStatus" class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:100%"></div>
		</div>
		<button type="button" class="btn btn-default" data-dismiss="modal"><s:text name="button.close"/></button>
	</div>
</div>