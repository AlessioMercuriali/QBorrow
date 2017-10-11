var frameworkApp = angular.module('framework');

frameworkApp.controller('qxJobController', ['$scope', 'SweetAlert', 'qxFrameworkHttpService', '$modal', '$controller', function ($scope, SweetAlert, qxFrameworkHttpService, $modal, $controller){
	
	$scope.forms = [];
	$scope.scopeController = {} 
	$scope.scopeController.selectedPage = 'list';
	$scope.scopeController.search= {};
	$scope.scopeController.searchHistory= {};
	$scope.scopeController.search.page = 1;
	$scope.scopeController.searchHistory.page = 1;
	$scope.scopeController.hideConfigAdvancedOperation = true;
	$scope.scopeController.openHelp = false;
	
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
		qxFrameworkHttpService.getJobList($scope.scopeController);
	}
	
	$scope.listRunning = function () {
		qxFrameworkHttpService.getJobRunningList($scope.scopeController);
	}
	
	$scope.listContext = function () {
		qxFrameworkHttpService.getJobContextList($scope.scopeController);
	}
	
	$scope.resetSearch = function () {
		$scope.scopeController.search= {};
		$scope.scopeController.search.page = 1;
	}
	
	$scope.play = function (row) {
		qxFrameworkHttpService.playJob(row.name, $scope.scopeController);
	}
	
	$scope.stop = function (row) {
		qxFrameworkHttpService.stopJob(row.name, row.context, $scope.scopeController);
	}
	
	$scope.getRunnableStyle = function (row) {
		if(row.state == 'RUNNABLE') {
			return {'width': '5%'};
		} else {
			return  {'width': '10%'};
		}
	} 
	
	$scope.getRunnableText = function (row) {
		if(row.state == 'RUNNABLE') {
			return ''
		} else {
			return '';
		}
	} 
	
	$scope.getStartingStyle = function (row) {
		if(row.state == 'RUNNABLE') {
			return {'width': '0%'};
		} else if(row.state == 'STARTING') {
			return {'width': '5%'};
		} else {
			return  {'width': '10%'};
		}
	} 
	
	$scope.getStartingText = function (row) {
		if(row.state == 'RUNNABLE') {
			return '';
		} else if(row.state == 'STARTING') {
			return '';
		} else {
			return  '';
		}
	} 
	
	$scope.getRunngingStyle = function (row) {
		if(row.state == 'RUNNABLE' || row.state == 'STARTING') {
			return {'width': '0%'};
		} else if(row.state == 'RUNNING') {
			if(row.percentage < 0 ) {
				return {'width': '1%'};
			} else {
				return {'width': (row.percentage * 0.65) + '%'};
			}
		} else {
			return  {'width': '65%'};
		}
	} 
	
	$scope.getRunngingText = function (row) {
		if(row.state == 'RUNNABLE' || row.state == 'STARTING') {
			return '';
		} else if(row.state == 'RUNNING') {
			if(row.percentage < 0 ) {
				return 'N/A';
			} else {
				return (row.percentage) + '%';
			}
		} else {
			return  '';
		}
	} 
	
	$scope.getFinishedStyle = function (row) {
		if(row.state == 'FINISHED') {
			return {'width': '5%'};
		} else {
			return  {'width': '0%'};
		}
	}
	
	$scope.getFinishedText = function (row) {
		if(row.state == 'FINISHED') {
			return '';
		} else {
			return '';
		}
	}
	
	$scope.list();
	$scope.listRunning();
	$scope.listContext();
	
	$scope.create = function() {
		$scope.scopeController.openHelp = false;
		$scope.edit({create: true, recoveryYN: false, statefulYN: false});
	}
	
	$scope.edit = function(row) {
		$scope.scopeController.openHelp = false;
		$scope.scopeController.selectedRow = row;
		$scope.scopeController.resultConfig = {};
    	$scope.modalInstance = $modal.open({
    		windowTemplateUrl: 'template/modal/window-quix.html',
    		templateUrl: 'editJobContent.html',
    		size: 'lg',
    		scope: $scope
    	});
    }
	    
	$scope.cancel = function () {
		$scope.modalInstance.dismiss('cancel');
		$scope.list();
	}
	
	$scope.save = function () {
		qxFrameworkHttpService.saveJob($scope.scopeController, $scope.forms.editJobForm, $scope.modalInstance);
	}
	
	$scope.loadJobConfig = function (configForm) {
		$scope.scopeController.openHelp = false;
		qxFrameworkHttpService.loadJobConfig($scope.scopeController, configForm);
	}
	
	$scope.getContextList = function(){
		qxFrameworkHttpService.getContextList($scope.scopeController);
    	$scope.modalInstance = $modal.open({
    		windowTemplateUrl: 'template/modal/window-quix.html',
    		templateUrl: 'jobContextList.html',
    		size: 'lg',
    		scope: $scope
    	});
    	
	}
	
	$scope.addContext = function(){
		var context = {name:'', url:'', modifyName:true, modifyUrl:true, isNew:true};
		$scope.scopeController.contextList.push(context);
	}
	
	$scope.saveContext = function(context){
		context.modifyUrl=false;
		context.modifyName=false;
		qxFrameworkHttpService.saveContext($scope.scopeController, context);
	}
	
	$scope.removeContext = function(index){
		
		  SweetAlert.swal({
	          title: "Sei sicuro?",
	          text: "Vuoi Eliminare "+$scope.scopeController.contextList[index].name+"?",
	          type: "warning",
	          showCancelButton: true,
	          confirmButtonColor: "#DD6B55",
	          confirmButtonText: "Sì",
	          closeOnConfirm: true,
	          closeOnCancel: true,
	          html: false
	      }, function(isConfirm){
	          if(isConfirm){
				for(var i=0;i<$scope.scopeController.contextList.length;i++){
					$scope.scopeController.contextList[i].modifyUrl=false;
					$scope.scopeController.contextList[i].modifyName=false;
				}
				if(!($scope.scopeController.contextList[index].isNew)){
					qxFrameworkHttpService.deleteContext($scope.scopeController, index);
				} else {
					$scope.scopeController.contextList.splice(index,1);
				}
				
	          }
	      });
		
		
	}
	
	$scope.history = function(){
		qxFrameworkHttpService.listJobHistory($scope.scopeController);
	}
	
	$scope.emptyCacheJson = function(){
    	qxFrameworkHttpService.emptyCacheJsonConfig($scope.scopeController, $scope.forms.editJobForm);
    }
	
	$scope.deleteJob = function(row) {
		$scope.scopeController.selectedRow = row;
		SweetAlert.swal({
	 		   title: "Are you sure?",
	 		   text: "Delete thi job ?",
	 		   type: "warning",
	 		   showCancelButton: true,
	 		   confirmButtonColor: "#DD6B55",
	 		   confirmButtonText: "Yes, delete it!",
	 		   closeOnConfirm: true}, 
	 		function(){ 
	 			  qxFrameworkHttpService.deleteJob($scope.scopeController);
	 		});
	}
	
}]);
	
    