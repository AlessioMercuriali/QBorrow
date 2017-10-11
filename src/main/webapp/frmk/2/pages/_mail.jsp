<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="box box-framework" style="margin-top:25px;">
<tabset>
	<tab>
	 	<tab-heading>
	      Mail
	    </tab-heading> 
	    <div class="qrow">
	   		<div class="qcol-md-6">
				<div class="box-header with-border mail-header">
					<h3 class="qh3 box-title"><i class="fa fa-lg fa-wrench" aria-hidden="true"></i>&nbsp;Smtp Configurato</h3>
					<i-check id="selectItem" class="qpull-right" ng-init="scopeController.mail.frmkSmtpConfig=true"  style="cursor:pointer;"  ng-model="scopeController.mail.frmkSmtpConfig"  ng-disabled="scopeController.mail.clientSmtpConfig">
					</i-check>
				</div>
				<div class="box-body" >
					<label>Server:</label>&nbsp;<input type="text" class="qform-control" placeholder="<s:property value="getConfig('FRMK019_SmtpServerName')"/>" disabled="disabled">
					<label>Porta:</label>&nbsp;<input type="text" class="qform-control" placeholder="<s:property value="getConfig('FRMK020_SmtpServerPort')"/>" disabled="disabled">
					<label>User:</label>&nbsp;<input type="text" class="qform-control" placeholder="<s:property value="getConfig('FRMK021_SmtpServerUsername')"/>" disabled="disabled">
					<label>Password:</label>&nbsp;<input type="text" class="qform-control" placeholder="<s:property value="getConfig('FRMK022_SmtpServerPassword')"/>" disabled="disabled">
					<label>Protocol:</label>&nbsp;<input type="text" class="qform-control" placeholder="<s:property value="getConfig('FRMK023_SmtpServerProtocol')"/>" disabled="disabled">
					<label>Properties:</label>&nbsp;<input type="text" class="qform-control" placeholder="<s:property value="getConfig('FRMK024_SmtpServerMailProperties')"/>" disabled="disabled">
				</div><br>
			</div>
		
			<div class="qcol-md-6">
				<div class="box-header with-border mail-header" >
					<h3 class="qh3 box-title"><i class="fa fa-lg fa-wrench" aria-hidden="true"></i><i style="font-size: 10px;" class="fa fa-asterisk" aria-hidden="true"></i>&nbsp;Nuovo Smtp</h3>
					<i-check id="selectItem" class="qpull-right" style="cursor:pointer;" ng-init="scopeController.mail.clientSmtpConfig=false"  ng-model="scopeController.mail.clientSmtpConfig"  >
					</i-check>
				</div>
				<div class="box-body" >
					<label>Server:</label><input type="text" class="qform-control" ng-model="scopeController.mail.server">
					<label>Porta:</label><input type="text" class="qform-control" ng-model="scopeController.mail.port">
					<label>User:</label><input type="text" class="qform-control" ng-model="scopeController.mail.user">
					<label>Password:</label><input type="text"  class="qform-control" ng-model="scopeController.mail.pwd">
					<label>Protocol:</label><input type="text" class="qform-control" ng-model="scopeController.mail.protocol">
					<label>Properties:</label><input type="text" class="qform-control" ng-model="scopeController.mail.properties">
				</div><br>
			</div>
		</div>
		<div class="qrow">
			<div class="qcol-md-12" ng-init="scopeController.mail.type='text'">
				<div class="box-header with-border mail-header">
					<h3 class="qh3 box-title"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;Mail</h3>
				</div>
				<div class="box-body" >
					<label>To:</label><input type="text" class="qform-control" ng-model="scopeController.mail.to">
					<label>From:</label><input type="text" class="qform-control" ng-model="scopeController.mail.from">
					<label>Oggetto:</label><input type="text" class="qform-control" ng-model="scopeController.mail.object"><br>
					<label>Invia:</label><input type="radio" name="type" value="text" class="" ng-model="scopeController.mail.type" checked/>Testo<input name="type" type="radio" value="template" class="" ng-model="scopeController.mail.type"/>Template<br><br>
					<div ng-if="scopeController.mail.type=='text'">
						<label>Testo:</label><textarea type="text" class="qform-control" ng-model="scopeController.mail.text" style="height:250px;"></textarea><br>
					</div>
					<div ng-if="scopeController.mail.type=='template'">
						<label>Opzioni:</label>
						<select class="qform-control">
						  <option value="opt1">Option1</option>
						  <option value="opt2">Option2</option>
						  <option value="opt3">Option3</option>
						  <option value="opt4">Option4</option>
						</select><br>
						<label>Template:</label><textarea type="text" class="qform-control" ng-model="scopeController.mail.template" style="height:250px;"></textarea><br>
					</div>
					<div class="qtext-center">
						<button class="qbtn btn-framework-color" ng-click="send()" type="button">
							<i class="fa fa-paper-plane"></i>&nbsp;Invia
						</button>
					</div><br>
				</div>
			</div>
		</div>
	</tab>
	<tab>
	 	<tab-heading>
	      Mail Inviate
	    </tab-heading> 
	</tab>
</tabset>
</div>