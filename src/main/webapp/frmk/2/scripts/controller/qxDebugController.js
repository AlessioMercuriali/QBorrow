var frameworkApp = angular.module('framework');

frameworkApp.controller('qxDebugController', ['$scope', 'qxFrameworkHttpService', '$modal', '$controller', '$timeout', function ($scope, qxFrameworkHttpService, $modal, $controller, $timeout){
	
	$scope.forms = [];
	$scope.scopeController = {}; 
	$scope.scopeController.selectedPage = 'mail';
	$scope.scopeController.search = {};
	$scope.scopeController.search.page = 1;
    $scope.scopeController.mail = {};
    $scope.scopeController.smtp = {};

    angular.extend(this, $controller('qxAbstractLabelController', {$scope: $scope}));
    
	$scope.send = function(){
		qxFrameworkHttpService.sendMail($scope.scopeController);
	}
	
	$scope.systemProperties = function(){
		qxFrameworkHttpService.getSystemProperties($scope.scopeController);
	}
	
	$scope.memoryProperties = function(){
		qxFrameworkHttpService.getMemoryProperties($scope.scopeController);
	}
	
	$scope.threadProperties = function(){
		qxFrameworkHttpService.getThreadList($scope.scopeController);
	}
	
	$scope.changePage = function(page){
		
		if(page=='system')
			$scope.systemProperties();
		
		if(page =='memory')
			$scope.memoryProperties();
		
		if(page =='thread')
			$scope.threadProperties();
		
		$scope.scopeController.selectedPage = page;
		
	}
	
	
	
	
	
}]);