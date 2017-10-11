var frameworkApp = angular.module('framework');

frameworkApp.controller('qxAbstractEditConfigController', ['$scope', 'qxFrameworkHttpService', '$modal', function ($scope, qxFrameworkHttpService, $modal){

	$scope.editConfig = function(config) {
		$scope.scopeController.backupConfig = JSON.parse(JSON.stringify(config));
		$scope.scopeController.selectedConfig = config;
		$scope.modalInstanceConfig = $modal.open({
    		windowTemplateUrl: 'template/modal/window-quix.html',
    		templateUrl: 'editConfigContent.html',
    		size: 'lg',
    		scope: $scope
    	});
		if(config.type == 'SysAttribute') {
			qxFrameworkHttpService.loadAttributeListForConfig($scope.scopeController, config.typeDomain);
		}
	}
	
	$scope.cancelConfig = function() {
		for(key in $scope.scopeController.backupConfig) {
			$scope.scopeController.selectedConfig[key] = $scope.scopeController.backupConfig[key];
		}
		$scope.modalInstanceConfig.dismiss('cancel');
	}
	
	$scope.saveConfigMetadata = function() {
		qxFrameworkHttpService.saveConfigMetadata($scope.scopeController, $scope.modalInstanceConfig, $scope.forms.configMetadataForm, $scope.forms.configListForm);
	}
	
	$scope.FR001_ConfigApplicationList = function () {
		return FR001_ConfigApplicationList;
	}
	
	$scope.FR002_ConfigSectionList = function () {
		return FR002_ConfigSectionList;
	}
	
	$scope.FR003_ConfigFieldsetList = function () {
		return FR003_ConfigFieldsetList;
	}
	
	$scope.FR005_KindConfigMetadata = function () {
		return FR005_KindConfigMetadata;
	}
	
	$scope.removeConfig = function(config) {
		var index = $scope.scopeController.selectedConfig.configList.indexOf(config);
		$scope.scopeController.selectedConfig.configList.splice(index, 1);
	}
	
	$scope.saveConfig = function () {
		qxFrameworkHttpService.saveConfig($scope.scopeController, $scope.modalInstanceConfig);
	}
	
	$scope.clusterList = function() {
		qxFrameworkHttpService.getClusterList($scope.scopeController);
	}
	
	$scope.companyList = function() {
		qxFrameworkHttpService.getCompanyList($scope.scopeController);
	}
	
	$scope.configList = function(config) {
		qxFrameworkHttpService.getConfigList($scope.scopeController);
	}
	
	$scope.addConfig = function() {
		var config = {'company': 'DEFAULT', 'code': $scope.scopeController.selectedConfig.code, 'configMetadataId': $scope.scopeController.selectedConfig.configMetadataId};
		$scope.scopeController.selectedConfig.configList.push(config);
	}
	
	 $scope.addToExportList = function(row){
    	if($scope.scopeController.selectedConfigList != null && $scope.scopeController.selectedConfigList != undefined && $scope.scopeController.selectedConfigList.length>0){
    		//ok
    	} else {
    		$scope.scopeController.selectedConfigList = [];
    	}
    	$scope.scopeController.selectedConfigList.push(row);
    }
	 
	$scope.selectAll = function(selectAll){
		if($scope.scopeController.selectedConfigList != null && $scope.scopeController.selectedConfigList != undefined && $scope.scopeController.selectedConfigList.length>0){
    		//ok
    	} else {
    		$scope.scopeController.selectedConfigList = [];
    	}
		for(var i=0;i<$scope.scopeController.result.list.length;i++){
			$scope.scopeController.result.list[i].select = selectAll;
			$scope.scopeController.selectedConfigList.push($scope.scopeController.result.list[i]);
		}
		$scope.scopeController.selectAll = selectAll;
	}
	
	$scope.showMainMenu = function(){
	    $scope.scopeController.openMobileMenu=true;
	}
	   
	$scope.clusterList();
	$scope.companyList();
	
}]);