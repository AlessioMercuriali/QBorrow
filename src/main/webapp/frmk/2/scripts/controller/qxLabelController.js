var frameworkApp = angular.module('framework');

frameworkApp.controller('qxLabelController', ['$scope', 'SweetAlert', 'qxFrameworkHttpService', '$modal', '$controller', '$timeout', function ($scope, SweetAlert, qxFrameworkHttpService, $modal, $controller, $timeout){
	
	$scope.scopeController = {} 
	$scope.scopeController.selectedPage = 'list';
	$scope.scopeController.search= {};
	$scope.scopeController.search.page = 1;
	$scope.scopeController.application = '';
	$scope.scopeController.organization = '';

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
    	qxFrameworkHttpService.getApplicationLabelList($scope.scopeController);
	}
	
	$scope.listLabel = function (application, organization) {
		$scope.scopeController.application = application;
		$scope.scopeController.organization = organization;
   		qxFrameworkHttpService.getLabelList($scope.scopeController);
	}
	
	$scope.listOrganization = function (application) {
		$scope.scopeController.application = application;
   		qxFrameworkHttpService.getOrganizationList($scope.scopeController);
	}
	
	$scope.resetSearch = function () {
		$scope.scopeController.search= {};
		$scope.scopeController.search.page = 1;
	}
	
	$scope.deleteLabel = function (index) {
		SweetAlert.swal({
	 		   title: "Are you sure?",
	 		   text: "Delete the label ?",
	 		   type: "warning",
	 		   showCancelButton: true,
	 		   confirmButtonColor: "#DD6B55",
	 		   confirmButtonText: "Yes, delete it!",
	 		   closeOnConfirm: true}, 
	 		function(){ 
	 			   qxFrameworkHttpService.deleteLabel($scope.scopeController, index);
	 		});
	}
	
	$scope.createLabel = function () {
		var size = $scope.scopeController.labelList.length;
		var label = {};
		label.labelKey = {};
		label.labelKey.labelId = '';
		label.labelKey.nuovo = true;
		label.translationMap = {};
		var list = [];
		list.push(label);
		for (var i = 0; i < size; i++) {
			list.push($scope.scopeController.labelList[i]);
		}
		$scope.scopeController.labelList = [];
		for (var i = 0; i < size + 1; i++) {
			$scope.scopeController.labelList.push(list[i]);
		}
	}
	
	$scope.saveLabelList = function () {
		SweetAlert.swal({
	 		   title: "Are you sure?",
	 		   text: "Save all changes ?",
	 		   type: "warning",
	 		   showCancelButton: true,
	 		   confirmButtonColor: "#DD6B55",
	 		   confirmButtonText: "Yes, save them!",
	 		   closeOnConfirm: true}, 
	 		function(){ 
	 			   qxFrameworkHttpService.saveLabelList($scope.scopeController);
	 		});
	}
	
	$scope.resetLabelCache = function() {
		   qxFrameworkHttpService.resetLabelCache($scope.scopeController);		
	}
	
	$scope.openPopupImportExcel = function(){
		var modalInstance = $modal.open({
		    templateUrl: 'modalImportLabelFromExcel.html',
		    windowTemplateUrl: 'template/modal/window-quix.html',
		    controller: 'modalImportLabelFromExcelCtrl',
		    size: 'lg',
		    scope:$scope
		});
	}
	
	$scope.createExcel = function(){
    	qxFrameworkHttpService.createLabelExcel($scope.scopeController);
    }
	
	$scope.list();
	
}]);

frameworkApp.controller('modalImportLabelFromExcelCtrl', ['$scope', 'qxFrameworkHttpService', '$modal', '$modalInstance', '$timeout', function ($scope, qxFrameworkHttpService, $modal, $modalInstance, $timeout) {
	$scope.popup = true;
	$scope.scopeController.search.page = 1;
    
    $scope.close = function () {
    	$modalInstance.close();
	}
    
    $scope.importLabelExcel = function(){
    	qxFrameworkHttpService.importLabelExcel($scope.closeModal, $scope.scopeController);
    	$modalInstance.close();
    }
}]);