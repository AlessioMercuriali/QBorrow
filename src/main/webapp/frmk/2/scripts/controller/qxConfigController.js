var frameworkApp = angular.module('framework');

frameworkApp.controller('qxConfigController', ['$scope', 'qxFrameworkHttpService', '$modal', '$controller', '$timeout', function ($scope, qxFrameworkHttpService, $modal, $controller, $timeout){
	
	$scope.forms = [];
	$scope.scopeController = {}; 
	$scope.scopeController.selectedPage = 'list';
	$scope.scopeController.search = {};
	$scope.scopeController.search.page = 1;
	
	angular.extend(this, $controller('qxAbstractEditConfigController', {$scope: $scope}));
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
		$timeout(function() {
			qxFrameworkHttpService.getConfigList($scope.scopeController, $scope.forms.configForm);
		},1);
	}
	
	$scope.resetSearch = function () {
		$scope.scopeController.search= {};
		$scope.scopeController.search.page = 1;
	}
	
    $scope.cancel = function () {
    	$scope.modalInstance.dismiss('cancel');
    }
    
    $scope.countConfigApplication = function (application) {
    	var i = 0;
    	for(k = 0; k < application.list.length; k++) {
    		i += $scope.countConfigSection(application.list[k]);
    	}
    	return i;
    }
    
    $scope.countConfigSection = function (section) {
    	var i = 0;
    	for(k = 0; k < section.list.length; k++) {
    		i += section.list[k].list.length;
    	}
    	return i;
    }
    
    $scope.emptyCacheJson = function(){
    	qxFrameworkHttpService.emptyCacheJsonConfig($scope.scopeController, $scope.forms.configForm);
    }
    
    $scope.createExcel = function(){
    	qxFrameworkHttpService.createExcelConfig($scope.scopeController);
    }
    
    $scope.generateScripts = function(){
    	if($scope.scopeController.selectedConfigList != null && $scope.scopeController.selectedConfigList != undefined && $scope.scopeController.selectedConfigList.length>0){
    		qxFrameworkHttpService.generateScriptsConfig($scope.scopeController);
    	} else {
    		sweetAlert("SQL Script Export", "Seleziona almeno una configurazione per l'export", "warning");
    	}
    }
    
    $scope.create = function() {
		$scope.edit({create: true, configurableValuesYN: true});
	}
	
	$scope.edit = function(row) {
		$scope.scopeController.selectedRow = row;
    	$scope.modalInstance = $modal.open({
    		windowTemplateUrl: 'template/modal/window-quix.html',
    		templateUrl: 'editConfigMetadata.html',
    		size: 'lg',
    		scope: $scope
    	});
    }
	
	$scope.cancelEditConfigMetadata = function() {
		$scope.modalInstance.dismiss('cancel');
		$scope.list();
	}
	
	$scope.deleteConfigMetadata = function(row){
    	SweetAlert.swal({
 		   title: "Are you sure?",
 		   text: "Delete " + row.code + " Config ?",
 		   type: "warning",
 		   showCancelButton: true,
 		   confirmButtonColor: "#DD6B55",
 		   confirmButtonText: "Yes, delete it!",
 		   closeOnConfirm: true}, 
 		function(){ 
 			   qxFrameworkHttpService.deleteConfigMetadata($scope.scopeController, row, $scope.forms.configForm);
 		});
 	
    } 
	
	$scope.getAllAttributeType = function() {
		qxFrameworkHttpService.getAllAttributeType($scope.scopeController);
	}
	
	$scope.getAllAttributeType();
	$scope.list();
}]);