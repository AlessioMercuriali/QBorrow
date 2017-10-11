var frameworkApp = angular.module('framework');

frameworkApp.controller('qxHomeController', ['$scope', 'qxFrameworkHttpService', '$modal','$controller', function ($scope, qxFrameworkHttpService, $modal, $controller){

	$scope.scopeController = {};
	$scope.pageSize = 10;
	
	angular.extend(this, $controller('qxAbstractLabelController', {$scope: $scope}));
	angular.extend(this, $controller('qxAbstractLabelController', {$scope: $scope}));
	
	$scope.countTemplate = function(){
		qxFrameworkHttpService.countTemplate($scope.scopeController);
	}
	
	$scope.countLock = function(){
		qxFrameworkHttpService.countLock($scope.scopeController);
	}
	
	$scope.countConfig = function(){
		qxFrameworkHttpService.countConfig($scope.scopeController);
	}
	
	$scope.countJob = function(){
		qxFrameworkHttpService.countJob($scope.scopeController);
	}
	
	$scope.countAttribute = function(){
		qxFrameworkHttpService.countAttribute($scope.scopeController);
	}
	
	$scope.countLabel = function(){
		qxFrameworkHttpService.countLabel($scope.scopeController);
	}
	
	$scope.countException = function(){
		qxFrameworkHttpService.countException($scope.scopeController);
	}

	$scope.countJobNotification = function(){
		qxFrameworkHttpService.countJobNotification($scope.scopeController);
	}
	
	$scope.checkSystem = function(){
		$scope.scopeController.checkSystemSpin = true;
		qxFrameworkHttpService.checkSystem($scope.scopeController);
	}
	
	$scope.init = function(){
		$scope.countLock();
		$scope.countConfig();
		$scope.countJob();
		$scope.countAttribute();
		$scope.countLabel();
		$scope.countException();
		$scope.countJobNotification();
		$scope.countTemplate();
		qxFrameworkHttpService.getDatabaseVersion($scope.scopeController);
		qxFrameworkHttpService.getFrmkInfo($scope.scopeController);
	}
	$scope.init();
	

	
	 $scope.getScriptList = function(name) {
			$scope.scopeController.migrationInfo = [];
			$scope.curPage = 1;
			$scope.scopeController.dbName=name;
			
			qxFrameworkHttpService.getContextScript($scope.scopeController, name);
			
		 	$scope.modalInstance = $modal.open({
	    		windowTemplateUrl: 'template/modal/window-quix.html',
	    		templateUrl: 'script.html',
	    		size: 'lg',
	    		scope: $scope
	    	});
		}
	    
	    $scope.updateDbChecksum = function(db) {
	    	
	    	
	    	SweetAlert.swal({
	    		   title: "Are you sure?",
	    		   text: "Update " + db.script + " checksum from " + db.checksum + " to " + db.actualChecksum,
	    		   type: "warning",
	    		   showCancelButton: true,
	    		   confirmButtonColor: "#DD6B55",
	    		   confirmButtonText: "Yes, update it!",
	    		   closeOnConfirm: false}, 
	    		function(){ 
	    			   $timeout(function() {
	    				   qxFrameworkHttpService.updateChecksum(scopeController, $scope.scopeController.dbName, db);
	    			    }, 50);
	    		});
	    	
	    	
	    }
	    
	$scope.closeModal = function () {
		$scope.modalInstance.dismiss('cancel');
	}
	
}]);