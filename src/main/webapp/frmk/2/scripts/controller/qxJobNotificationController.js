var frameworkApp = angular.module('framework');

frameworkApp.controller('qxJobNotificationController', ['$scope', 'SweetAlert', 'qxFrameworkHttpService', '$modal', '$controller', function ($scope, SweetAlert, qxFrameworkHttpService, $modal, $controller){
	
	$scope.scopeController = {};
	$scope.scopeController.selectedPage = 'list';
	$scope.scopeController.jobNotificationSearch= {};
	$scope.scopeController.jobNotificationSearch.enableYN = 'A';
	$scope.scopeController.jobNotificationSearch.page = 1;
	$scope.scopeController.hideConfigAdvancedOperation = true;

	angular.extend(this, $controller('qxAbstractLabelController', {$scope: $scope}));

	$scope.search = function () {
		$scope.scopeController.jobNotificationSearch.order = 0;
		$scope.scopeController.jobNotificationSearch.page = 1;
		$scope.list();
	};
	
	$scope.orderBy = function(orderBy) {
		$scope.scopeController.jobNotificationSearch.order = orderBy;
		$scope.scopeController.jobNotificationSearch.page = 1;
		$scope.list();
	};
	
	$scope.removeFilter = function(filtername) {
		$scope.scopeController.jobNotificationSearch[filtername] = null;
		if (filtername == 'enableYN') {
			$scope.scopeController.jobNotificationSearch[filtername] = 'A';
		}
		$scope.scopeController.jobNotificationSearch.page = 1;
		$scope.list();
	};
	
	$scope.list = function () {
		qxFrameworkHttpService.getJobNotificationList($scope.scopeController);
	};
	
	$scope.resetSearch = function () {
		$scope.scopeController.jobNotificationSearch= {};
		$scope.scopeController.jobNotificationSearch.enableYN = 'A';
		$scope.scopeController.jobNotificationSearch.page = 1;
	};
	
	$scope.list();
	
	$scope.create = function() {
		$scope.edit({create: true, enableYN: 'Y', querySqlAsRSYN: 'N', notifyYN: 'N', notifyFromRSYN: 'N'});
	};
	
	$scope.edit = function(job) {
		$scope.scopeController.jobNotification = job;
//		$scope.scopeController.jobNotification.enableYN = 'N';
//		$scope.scopeController.jobNotification.querySqlAsRSYN = 'N';
//		$scope.scopeController.jobNotification.notifyYN = 'N';
//		$scope.scopeController.jobNotification.notifyFromRSYN = 'N';
		// $scope.scopeController.resultConfig = {};
    	$scope.modalInstance = $modal.open({
    		windowTemplateUrl: 'template/modal/window-quix.html',
    		templateUrl: 'editJobNotification.html',
    		size: 'lg',
    		scope: $scope
    	});
    };
	    
	$scope.cancel = function () {
		$scope.modalInstance.dismiss('cancel');
	};
	
	$scope.save = function () {
		qxFrameworkHttpService.saveJobNotification($scope, $scope.scopeController);
	};
	
	$scope.deleteJobNotification = function(job){
    	SweetAlert.swal({
 		   title: "Are you sure?",
 		   text: "Delete " + job.name + " (" + job.execOrder + ") job notification?",
 		   type: "warning",
 		   showCancelButton: true,
 		   confirmButtonColor: "#DD6B55",
 		   confirmButtonText: "Yes, delete it!",
 		   closeOnConfirm: true}, 
 		function(){ 
 			   qxFrameworkHttpService.deleteJobNotification($scope, $scope.scopeController, job);
 		});
    };
	
}]);

frameworkApp.directive('ynvalue', [ function () {
    return {
        require: '?ngModel',
        link: function (scope, elem, attrs, ctrl) {
            if (!ctrl) return;


            ctrl.$formatters.unshift(function (a) {
              if(ctrl.$modelValue == 'Y')
                  return true;
              else 
                  return false;
               
            });


            ctrl.$parsers.unshift(function (viewValue) {
                if(viewValue == true)
                	return 'Y';
                else
                    return 'N';
            });
        }
    };
}]);