var frameworkApp = angular.module('framework');

frameworkApp.controller('qxTemplateController', ['$scope', 'SweetAlert', 'qxFrameworkHttpService', '$modal', '$controller', '$timeout', function ($scope, SweetAlert, qxFrameworkHttpService, $modal, $controller, $timeout){
	
	$scope.scopeController = {} 
	$scope.scopeController.selectedPage = 'list';
	$scope.scopeController.search= {};
	$scope.scopeController.search.page = 1;

	angular.extend(this, $controller('qxAbstractLabelController', {$scope: $scope}));

	$scope.search = function () {
		$scope.scopeController.search.order = 0;
		$scope.scopeController.search.page = 1;
		$scope.list();
	}
	
	$scope.orderBy = function(orderBy) {
		$scope.scopeController.search.order = orderBy;
		$scope.scopeController.search.page = 1;
		$scope.list();
	}
	
	$scope.removeFilter = function(filtername) {
		$scope.scopeController.search[filtername] = null;
		$scope.scopeController.search.page = 1;
		$scope.list();
	}
	
	$scope.list = function () {
    	qxFrameworkHttpService.getTemplateList($scope.scopeController);
	}
	
	$scope.getApplicationList = function () {
    	qxFrameworkHttpService.getTemplateApplicationList($scope.scopeController);		
	}
	
	$scope.getOrganizationList = function () {
    	qxFrameworkHttpService.getTemplateOrganizationList($scope.scopeController);		
	}
		
	$scope.resetSearch = function () {
		$scope.scopeController.search= {};
		$scope.scopeController.search.page = 1;
		$scope.search();
	}
	
	$scope.deleteTemplate = function (row) {
		$scope.scopeController.selectedRow = row;
		SweetAlert.swal({
	 		   title: "Are you sure?",
	 		   text: "Delete the template ?",
	 		   type: "warning",
	 		   showCancelButton: true,
	 		   confirmButtonColor: "#DD6B55",
	 		   confirmButtonText: "Yes, delete it!",
	 		   closeOnConfirm: true}, 
	 		function(){ 
	 			  qxFrameworkHttpService.deleteTemplate($scope.scopeController);
	 		});
	}
	
	$scope.create = function () {
		$scope.scopeController.selectedRow = {};
		$scope.scopeController.selectedPage = 'edit';
	}
	
	$scope.save = function () {
		if ($scope.scopeController.selectedRow.language != null && $scope.scopeController.selectedRow.language != undefined && $scope.scopeController.selectedRow.language != '') {
			$scope.scopeController.selectedRow.language = $scope.scopeController.selectedRow.language.toUpperCase();
		}
		if ($scope.scopeController.selectedRow.name != null && $scope.scopeController.selectedRow.name != undefined && $scope.scopeController.selectedRow.name != '') {
			if ($scope.scopeController.selectedRow.templateId == null || $scope.scopeController.selectedRow.templateId == undefined && $scope.scopeController.selectedRow.templateId == '' )
			$scope.scopeController.selectedRow.name = $scope.scopeController.selectedRow.name + '.ftl';			
		}
		qxFrameworkHttpService.saveTemplate($scope.scopeController);
	}
		
	$scope.edit = function(row) {
		$scope.scopeController.selectedRow = row;
		qxFrameworkHttpService.editTemplate($scope.scopeController);
	}
		
	$scope.createExcel = function(){
    	qxFrameworkHttpService.createTemplateExcel($scope.scopeController);
    }
	
	$scope.getOptionForCodeMirror = function() {
		
		return {
			lineNumbers: true,
		    theme:'mdn-like',
		    lineWrapping : true,
		    matchBrackets : true,
		    autoCloseBrackets: true,
		    matchTags: true,
		    autoCloseTags: true,
		    mode: 'text/x-freemarker',
		    text: 'freemarker',
		    extraKeys: {
		    	"F11": function(cm) {
		            		cm.setOption("fullScreen", !cm.getOption("fullScreen"));
		           		},
		        "Esc": function(cm) {
		        			if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
		            	}
		    }
		};
	}
	
	$scope.back = function() {
		$scope.scopeController.search= {};
		$scope.scopeController.search.page = 1;
		$scope.scopeController.selectedPage = 'list';
	}
	
	$scope.list();
	
}]);
