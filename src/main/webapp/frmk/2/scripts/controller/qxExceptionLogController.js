var frameworkApp = angular.module('framework');

frameworkApp.controller('qxExceptionLogController', ['$scope', 'qxFrameworkHttpService', '$modal', '$controller', function ($scope, qxFrameworkHttpService, $modal, $controller){
	
	$scope.scopeController = {} 
	$scope.scopeController.selectedPage = 'list';
	$scope.scopeController.search= {};
	$scope.scopeController.search.page = 1;
	$scope.dateAndTimeFrom = {};
	$scope.dateAndTimeTo = {};

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
		qxFrameworkHttpService.getExceptionLogList($scope.scopeController);
	}
	
	$scope.resetSearch = function () {
		$scope.scopeController.search= {};
		$scope.scopeController.search.page = 1;
	}
	
	$scope.list();
	
    $scope.initCalendar = function(obj, id) {
    	if ( $('#' + id)[0].type != 'date' )  {
    		obj.oldCalendar = true;
    	}
    }
    $scope.openCalendar = function(obj, $event) {
        $event.preventDefault();
        $event.stopPropagation();
    	obj.opened = true;
    	return obj.opened;
    }	
    
    $scope.detail = function(row) {
    	$scope.selectedRow = row;
    	$scope.modalInstance = $modal.open({
    		windowTemplateUrl: 'template/modal/window-quix.html',
    		templateUrl: 'detailModalContent.html',
    		size: 'lg',
    		scope: $scope
    	});
    }
    
    $scope.addData = function(row) {
    	$scope.selectedRow = row;
    	if($scope.selectedRow.additionalData == null || $scope.selectedRow.additionalData == undefined || $scope.selectedRow.additionalData == '') {
    		$scope.selectedRow.addData = {};
    	} else {
    		$scope.selectedRow.addData = JSON.parse($scope.selectedRow.additionalData);
    	}
    	$scope.modalInstance = $modal.open({
    		windowTemplateUrl: 'template/modal/window-quix.html',
    		templateUrl: 'addDataModalContent.html',
    		size: 'lg',
    		scope: $scope
    	});
    }
    
    $scope.userData = function(row) {
    	$scope.selectedRow = row;
    	if($scope.selectedRow.userContextData == null || $scope.selectedRow.userContextData == undefined || $scope.selectedRow.userContextData == '') {
    		$scope.selectedRow.userData = {};
    	} else {
    		$scope.selectedRow.userData = JSON.parse(row.userContextData);
    	}
    	$scope.modalInstance = $modal.open({
    		windowTemplateUrl: 'template/modal/window-quix.html',
    		templateUrl: 'userModalContent.html',
    		size: 'lg',
    		scope: $scope
    	});
    }
    
    $scope.cancel = function () {
    	$scope.modalInstance.dismiss('cancel');
    }
}]);