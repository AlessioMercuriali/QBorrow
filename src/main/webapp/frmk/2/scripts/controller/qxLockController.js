var frameworkApp = angular.module('framework');

frameworkApp.controller('qxLockController', ['$scope', 'qxFrameworkHttpService', '$modal', '$controller', function ($scope, qxFrameworkHttpService, $modal, $controller){
	
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
	
	$scope.list = function (reset) {
		qxFrameworkHttpService.getLockList($scope.scopeController, reset);
	}
	
	$scope.resetSearch = function () {
		$scope.scopeController.search= {};
		$scope.scopeController.search.page = 1;
	}
	
	$scope.unlockJson = function(row){
		qxFrameworkHttpService.unlockJson($scope.scopeController,row.id);
	}
	
	$scope.list(true);
	
}]);