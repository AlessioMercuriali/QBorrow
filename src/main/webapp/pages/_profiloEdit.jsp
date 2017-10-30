<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<form name="forms.soggettiEditForm" novalidate ng-init="listProfilo()">
	<div class="box-header with-border">
		<h3 class="qh3 box-title">
			<s:text name="profilo.edit.title" />
		</h3>
	</div>
	<div class="qcol-md-12">
		<div class="qrow">
			<!-- <	div ng-class="{'qhas-error': forms.soggettiEditForm.ragione_sociale.$invalid}"> -->
			<label for="ragione_sociale"><s:text
					name="soggetti.edit.ragione_sociale" /></label> <input type="text"
				ng-model="scopeController.result.ragione_sociale"
				id="ragione_sociale" name="ragione_sociale" class="qform-control" />
			<div ng-messages="forms.soggettiEditForm.ragione_sociale.$error"
				role="alert">
				<div ng-message="notNull">
					<s:text name="error.notNull" />
				</div>
				<div ng-message="invalidAK">
					<s:text name="error.invalidAK" />
				</div>
				<div ng-message="notValid">
					<s:text name="error.notValid" />
				</div>
				<div ng-message="lenght">
					<s:text name="error.lenght" />
				</div>
				<div ng-message="dateToBeforeDateFrom">
					<s:text name="error.dateToBeforeDateFrom" />
				</div>
				<div ng-message="fieldToBeforeFieldFrom">
					<s:text name="error.fieldToBeforeFieldFrom" />
				</div>
				<div ng-message="notUnique">
					<s:text name="error.notUnique" />
				</div>
				<div ng-message="min">
					<s:text name="error.min" />
				</div>
				<div ng-message="max">
					<s:text name="error.max" />
				</div>
				<div ng-message="ognl">
					<s:text name="error.ognl" />
				</div>
				<div ng-message="pattern">
					<s:text name="error.pattern" />
				</div>
				<div ng-message="notBlank">
					<s:text name="error.notBlank" />
				</div>
				<div ng-message="qvpattern.message">
					<s:text name="error.qvpattern.message" />
				</div>
				<div ng-message="string.length">
					<s:text name="error.string.length" />
				</div>
			</div>
		</div>
		<div class="qrow">
			<div ng-class="{'qhas-error': forms.soggettiEditForm.nome.$invalid}">
				<label for="nome"><s:text name="soggetti.edit.nome" /></label> <input
					type="text" ng-model="scopeController.result.nome" id="nome"
					name="nome" class="qform-control" />
				<div ng-messages="forms.soggettiEditForm.nome.$error" role="alert">
					<div ng-message="notNull">
						<s:text name="error.notNull" />
					</div>
					<div ng-message="invalidAK">
						<s:text name="error.invalidAK" />
					</div>
					<div ng-message="notValid">
						<s:text name="error.notValid" />
					</div>
					<div ng-message="lenght">
						<s:text name="error.lenght" />
					</div>
					<div ng-message="dateToBeforeDateFrom">
						<s:text name="error.dateToBeforeDateFrom" />
					</div>
					<div ng-message="fieldToBeforeFieldFrom">
						<s:text name="error.fieldToBeforeFieldFrom" />
					</div>
					<div ng-message="notUnique">
						<s:text name="error.notUnique" />
					</div>
					<div ng-message="min">
						<s:text name="error.min" />
					</div>
					<div ng-message="max">
						<s:text name="error.max" />
					</div>
					<div ng-message="ognl">
						<s:text name="error.ognl" />
					</div>
					<div ng-message="pattern">
						<s:text name="error.pattern" />
					</div>
					<div ng-message="notBlank">
						<s:text name="error.notBlank" />
					</div>
					<div ng-message="qvpattern.message">
						<s:text name="error.qvpattern.message" />
					</div>
					<div ng-message="string.length">
						<s:text name="error.string.length" />
					</div>
				</div>
			</div>
		</div>
		<div class="qrow">
			<div
				ng-class="{'qhas-error': forms.soggettiEditForm.cognome.$invalid}">
				<label for="cognome"><s:text name="soggetti.edit.cognome" /></label>
				<input type="text" ng-model="scopeController.result.cognome"
					id="cognome" name="cognome" class="qform-control" />
				<div ng-messages="forms.soggettiEditForm.cognome.$error"
					role="alert">
					<div ng-message="notNull">
						<s:text name="error.notNull" />
					</div>
					<div ng-message="invalidAK">
						<s:text name="error.invalidAK" />
					</div>
					<div ng-message="notValid">
						<s:text name="error.notValid" />
					</div>
					<div ng-message="lenght">
						<s:text name="error.lenght" />
					</div>
					<div ng-message="dateToBeforeDateFrom">
						<s:text name="error.dateToBeforeDateFrom" />
					</div>
					<div ng-message="fieldToBeforeFieldFrom">
						<s:text name="error.fieldToBeforeFieldFrom" />
					</div>
					<div ng-message="notUnique">
						<s:text name="error.notUnique" />
					</div>
					<div ng-message="min">
						<s:text name="error.min" />
					</div>
					<div ng-message="max">
						<s:text name="error.max" />
					</div>
					<div ng-message="ognl">
						<s:text name="error.ognl" />
					</div>
					<div ng-message="pattern">
						<s:text name="error.pattern" />
					</div>
					<div ng-message="notBlank">
						<s:text name="error.notBlank" />
					</div>
					<div ng-message="qvpattern.message">
						<s:text name="error.qvpattern.message" />
					</div>
					<div ng-message="string.length">
						<s:text name="error.string.length" />
					</div>
				</div>
			</div>
		</div>
		<div class="qrow">
			<div
				ng-class="{'qhas-error': forms.soggettiEditForm.data_compleanno.$invalid}">
				<label for="Data Compleanno"><s:text
						name="soggetti.edit.data_compleanno" /></label> 
				<div class="qdropdown">
					<a class="qdropdown-toggle" id="dropdown2" role="qbutton" data-toggle="qdropdown" data-target="#" href="#">
						<div class="qinput-group">
				    		<input type="text" name="data_compleanno" id="data_compleanno" class="qform-control box-input-calendar" data-ng-model="scopeController.result.data_compleanno" presetDate="true" dateformat="DD/MM/YYYY">
				    		<span class="qinput-group-addon"><i class="fa fa-calendar"></i></span>
				    	</div>
				  	</a>
				  	<ul class="qdropdown-menu" role="qmenu" aria-labelledby="dLabel">
				    	<datetimepicker data-ng-model="scopeController.result.data_compleanno" data-datetimepicker-config="{ minView:'day', modelType: 'Date' }"/>
				  	</ul>
				</div>
				<div ng-messages="forms.soggettiEditForm.data_compleanno.$error"
					role="alert">
					<div ng-message="notNull">
						<s:text name="error.notNull" />
					</div>
					<div ng-message="invalidAK">
						<s:text name="error.invalidAK" />
					</div>
					<div ng-message="notValid">
						<s:text name="error.notValid" />
					</div>
					<div ng-message="lenght">
						<s:text name="error.lenght" />
					</div>
					<div ng-message="dateToBeforeDateFrom">
						<s:text name="error.dateToBeforeDateFrom" />
					</div>
					<div ng-message="fieldToBeforeFieldFrom">
						<s:text name="error.fieldToBeforeFieldFrom" />
					</div>
					<div ng-message="notUnique">
						<s:text name="error.notUnique" />
					</div>
					<div ng-message="min">
						<s:text name="error.min" />
					</div>
					<div ng-message="max">
						<s:text name="error.max" />
					</div>
					<div ng-message="ognl">
						<s:text name="error.ognl" />
					</div>
					<div ng-message="pattern">
						<s:text name="error.pattern" />
					</div>
					<div ng-message="notBlank">
						<s:text name="error.notBlank" />
					</div>
					<div ng-message="qvpattern.message">
						<s:text name="error.qvpattern.message" />
					</div>
					<div ng-message="string.length">
						<s:text name="error.string.length" />
					</div>
				</div>
			</div>
		</div>
		<div class="qrow">
			<div ng-class="{'qhas-error': forms.soggettiEditForm.email.$invalid}">
				<label for="Email"><s:text name="soggetti.edit.email" /></label> <input
					type="text" ng-model="scopeController.result.email" id="email"
					name="email" class="qform-control" ng-pattern="emailFormat" required /> 
				<div ng-messages="forms.soggettiEditForm.email.$error" role="alert">
					<div ng-message="notNull">
						<s:text name="error.notNull" />
					</div>
					<div ng-message="invalidAK">
						<s:text name="error.invalidAK" />
					</div>
					<div ng-message="notValid">
						<s:text name="error.notValid" />
					</div>
					<div ng-message="lenght">
						<s:text name="error.lenght" />
					</div>
					<div ng-message="dateToBeforeDateFrom">
						<s:text name="error.dateToBeforeDateFrom" />
					</div>
					<div ng-message="fieldToBeforeFieldFrom">
						<s:text name="error.fieldToBeforeFieldFrom" />
					</div>
					<div ng-message="notUnique">
						<s:text name="error.notUnique" />
					</div>
					<div ng-message="min">
						<s:text name="error.min" />
					</div>
					<div ng-message="max">
						<s:text name="error.max" />
					</div>
					<div ng-message="ognl">
						<s:text name="error.ognl" />
					</div>
					<div ng-message="pattern">
						<s:text name="error.pattern" />
					</div>
					<div ng-message="notBlank">
						<s:text name="error.notBlank" />
					</div>
					<div ng-message="qvpattern.message">
						<s:text name="error.qvpattern.message" />
					</div>
					<div ng-message="string.length">
						<s:text name="error.string.length" />
					</div>
				</div>
			</div>
		</div>
		<div class="qrow">
			<div
				ng-class="{'qhas-error': forms.soggettiEditForm.immagine.$invalid}">
				<label for="immagine"><s:text name="soggetti.edit.immagine" /></label>
				<input type="text" ng-model="scopeController.result.immagine"
					id="immagine" name="immagine" class="qform-control" />
				<div ng-messages="forms.soggettiEditForm.immagine.$error"
					role="alert">
					<div ng-message="notNull">
						<s:text name="error.notNull" />
					</div>
					<div ng-message="invalidAK">
						<s:text name="error.invalidAK" />
					</div>
					<div ng-message="notValid">
						<s:text name="error.notValid" />
					</div>
					<div ng-message="lenght">
						<s:text name="error.lenght" />
					</div>
					<div ng-message="dateToBeforeDateFrom">
						<s:text name="error.dateToBeforeDateFrom" />
					</div>
					<div ng-message="fieldToBeforeFieldFrom">
						<s:text name="error.fieldToBeforeFieldFrom" />
					</div>
					<div ng-message="notUnique">
						<s:text name="error.notUnique" />
					</div>
					<div ng-message="min">
						<s:text name="error.min" />
					</div>
					<div ng-message="max">
						<s:text name="error.max" />
					</div>
					<div ng-message="ognl">
						<s:text name="error.ognl" />
					</div>
					<div ng-message="pattern">
						<s:text name="error.pattern" />
					</div>
					<div ng-message="notBlank">
						<s:text name="error.notBlank" />
					</div>
					<div ng-message="qvpattern.message">
						<s:text name="error.qvpattern.message" />
					</div>
					<div ng-message="string.length">
						<s:text name="error.string.length" />
					</div>
				</div>
			</div>
		</div>
		<!-- <pre>{{scopeController.result}}</pre> -->
		<div class="box-footer qtext-center">
			<button ng-click="saveSoggettiConDataCompleanno()"
				class="qbtn btn-framework-color" type="button">
				<i class="fa fa-floppy-o"></i>&nbsp;
				<s:text name="button.save" />
			</button>
		</div>
	</div>
</form>