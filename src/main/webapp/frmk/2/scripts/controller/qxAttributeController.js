var frameworkApp = angular.module('framework');

frameworkApp.controller('qxAttributeController', ['$scope', '$controller', 'SweetAlert', 'qxFrameworkHttpService', '$modal',  function ($scope, $controller, SweetAlert, qxFrameworkHttpService, $modal){
	
	$scope.forms = [];
	$scope.scopeController = {} ;
	$scope.scopeController.selectedPage = 'list';
	$scope.scopeController.search= {};
	$scope.scopeController.searchAttribute = {};
	$scope.scopeController.search.page = 1;
	$scope.scopeController.searchAttribute.page = 1;

	angular.extend(this, $controller('qxAbstractLabelController', {$scope: $scope}));

	$scope.search = function () {
		$scope.scopeController.search.order = 0;
		$scope.scopeController.search.page = 1;
		$scope.list();
	}
	
	$scope.searchAttribute = function () {
		$scope.scopeController.searchAttribute.order = 0;
		$scope.scopeController.searchAttribute.page = 1;
		$scope.scopeController.searchAttribute.total = 0;
		$scope.attributeList($scope.scopeController.selectedAttributeType, false);
	}
	
	$scope.orderBy = function(orderBy) {
		$scope.scopeController.search.order = orderBy;
		$scope.scopeController.search.page = 1;
		$scope.list();
	}
	
	$scope.orderByAttribute = function(orderBy) {
		$scope.scopeController.searchAttribute.order = orderBy;
		$scope.scopeController.searchAttribute.page = 1;
		$scope.attributeList($scope.scopeController.selectedAttributeType, false);
	}
	
	$scope.removeFilter = function(filtername) {
		$scope.scopeController.search[filtername] = null;
		$scope.scopeController.search.page = 1;
		$scope.list();
	}
	
	$scope.removeFilterAttribute = function(filtername) {
		$scope.scopeController.searchAttribute[filtername] = null;
		$scope.scopeController.searchAttribute.page = 1;
		$scope.scopeController.searchAttribute.total = 0;
		$scope.attributeList($scope.scopeController.selectedAttributeType, false);
	}
	
	$scope.list = function () {
		qxFrameworkHttpService.getAttributeTypeList($scope.scopeController);
	}
	
	$scope.resetSearch = function () {
		$scope.scopeController.search= {};
		$scope.scopeController.search.page = 1;
	}
	
	$scope.resetSearchAttribute = function () {
		$scope.scopeController.searchAttribute = {};
		$scope.scopeController.searchAttribute.page = 1;
		$scope.attributeList($scope.scopeController.selectedAttributeType, true);
	}
	
	$scope.attributeList = function(row, reset){
		$scope.scopeController.selectedAttributeType = row;
		$scope.scopeController.resetAttribute = reset;
		qxFrameworkHttpService.getAttributeList($scope.scopeController, row);
	}
	
	$scope.attributeListPage = function() {
		qxFrameworkHttpService.getAttributeList($scope.scopeController, $scope.scopeController.selectedAttributeType);
	}
	
	$scope.edit = function(row, isNew){
		$scope.scopeController.selectedAttributeType = row;
		qxFrameworkHttpService.editAttributeType($scope.scopeController, isNew);
		$scope.scopeController.selectedPage = "edit";
	}
	
	$scope.detail = function(row){
		$scope.scopeController.selectedAttributeType = row;
		$scope.scopeController.selectedPage = "detail";
	}
	
	$scope.editAttribute = function(row, isNew){
		$scope.scopeController.selectedAttribute = row;
		
		qxFrameworkHttpService.editAttribute($scope.scopeController, isNew);
		
		$scope.scopeController.selectedPage = "editAttribute";
	}
	
	$scope.detailAttribute = function(row){
		$scope.scopeController.selectedAttribute = row;
		qxFrameworkHttpService.editAttribute($scope.scopeController);
		$scope.scopeController.selectedPage = "detailAttribute";
	}
	
	$scope.selectAll = function(selectAll){
		
		if($scope.scopeController.selectedAttributeTypeList != null && $scope.scopeController.selectedAttributeTypeList != undefined && $scope.scopeController.selectedAttributeTypeList.length>0){
    		//ok
    	} else {
    		$scope.scopeController.selectedAttributeTypeList = [];
    	}
		if(!selectAll) {
			for(var i=0;i<$scope.scopeController.result.length;i++){
				$scope.scopeController.result[i].select = false;
    		}
			$scope.scopeController.selectedAttributeTypeList = [];
		} else {
			qxFrameworkHttpService.selectAllAttributeType($scope.scopeController);
		}
		$scope.scopeController.selectAll = selectAll;
	}
	
	$scope.addNewAttribute = function(){
		if($scope.scopeController.attributeList == null || $scope.scopeController.attributeList == undefined){
			$scope.scopeController.attributeList = [];
		}
		var attribute = {
				'visibileYN': true,
				'code': 'AT_ATT_' + ($scope.scopeController.attributeList.length + 1),
				'posizioneInLista': $scope.scopeController.attributeList.length + 1
		};
		$scope.scopeController.attributeList.push(attribute);
	}
	
	$scope.newAttributeType = function(){
		var attrType = {};
		$scope.scopeController.attributeList = [];
		$scope.edit(attrType, true);
	}
	
	$scope.newAttribute = function(){
		var attr = {};
		$scope.scopeController.descriptionInLanguage = {};
		$scope.scopeController.attributeInLanguage = {};
		$scope.scopeController.calendar = [];
		$scope.editAttribute(attr, true);
	}
	
	$scope.setTipo = function(attribute, value){
		attribute = value;
	}
	
    $scope.openCalendar = function(name, $event) {
        $event.preventDefault();
        $event.stopPropagation();
        if($scope.scopeController.calendar == null) {
        	$scope.scopeController.calendar = [];
        }
        $scope.scopeController.calendar[name] = {};
        $scope.scopeController.calendar[name].opened = true;
    }
    
    $scope.dateOptions = {
	    startingDay: 1
	};
    
    $scope.convertDate = function(name) {
    	var date = new Date($scope.scopeController.calendar[name].date);
    	//FIXME convertire nel modo piu' opportuno, questo e' solo per non incappare nell'errore di validazione
    	$scope.scopeController.selectedAttribute[name] = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    }
    
    $scope.scopeController.openAttrValueMenu = [];
    $scope.scopeController.attributeValuesList = [];
    $scope.initAttribute = function(attributeName, index){
    	$scope.scopeController.openAttrValueMenu[index]=false;
    	qxFrameworkHttpService.getAttributeValue($scope.scopeController, attributeName, index);
    }
    
    $scope.saveAttribute = function(){
    	qxFrameworkHttpService.saveAttribute($scope.scopeController, $scope.forms.attributeForm);
    }
    
    $scope.restoreAttribute = function(row){
    	qxFrameworkHttpService.restoreAttribute($scope.scopeController, row);
    }
    
    $scope.XLSAttributeList = function(row){
    	qxFrameworkHttpService.XLSAttributeList($scope.scopeController);
    }
    
    $scope.deleteAttribute = function(row){
    	SweetAlert.swal({
 		   title: "Are you sure?",
 		   text: "Delete " + row.code + " Attribute of " + $scope.scopeController.selectedAttributeType.tipo +" ?",
 		   type: "warning",
 		   showCancelButton: true,
 		   confirmButtonColor: "#DD6B55",
 		   confirmButtonText: "Yes, delete it!",
 		   closeOnConfirm: true}, 
 		function(){ 
 			   qxFrameworkHttpService.deleteAttribute($scope.scopeController, row);
 		});
 	
    } 
    

    
    $scope.saveAttributeType = function(){
    	qxFrameworkHttpService.saveAttributeType($scope.scopeController, $scope.forms.attributeTypeForm);
    }
    
    $scope.createExcel = function(){
    	if($scope.scopeController.selectedAttributeTypeList != null && $scope.scopeController.selectedAttributeTypeList != undefined && $scope.scopeController.selectedAttributeTypeList.length>0){
    		qxFrameworkHttpService.createExcel($scope.scopeController);
    	} else {
    		sweetAlert("XLS Export", "Seleziona almeno un attribute per l'export", "warning");
    	}
    	
    }
    
    $scope.generateScripts = function(){
    	if($scope.scopeController.selectedAttributeTypeList != null && $scope.scopeController.selectedAttributeTypeList != undefined && $scope.scopeController.selectedAttributeTypeList.length>0){
    		qxFrameworkHttpService.generateScripts($scope.scopeController);
    	} else {
    		sweetAlert("SQL Script Export", "Seleziona almeno un attribute per l'export", "warning");
    	}
    }
    
    $scope.exportToXml = function(){
    	if($scope.scopeController.selectedAttributeTypeList != null && $scope.scopeController.selectedAttributeTypeList != undefined && $scope.scopeController.selectedAttributeTypeList.length>0){
    		qxFrameworkHttpService.exportToXml($scope.scopeController);
    	} else {
    		sweetAlert("XML Export", "Seleziona almeno un attribute per l'export", "warning");
    	}
    }
    

	$scope.importXML = function(){
    	$scope.modalInstance = $modal.open({
    		windowTemplateUrl: 'template/modal/window-quix.html',
    		templateUrl: 'importXML.html',
    		size: 'lg',
    		scope: $scope
    	});
    	
	}
	
	$scope.closeModal = function () {
		$scope.modalInstance.dismiss('cancel');
	}
	
    $scope.emptyCacheJson = function(){
    	qxFrameworkHttpService.emptyCacheJson($scope.scopeController);
    }
    
    $scope.addToExportList = function(row){
    	if($scope.scopeController.selectedAttributeTypeList != null && $scope.scopeController.selectedAttributeTypeList != undefined && $scope.scopeController.selectedAttributeTypeList.length>0){
    		//ok
    	} else {
    		$scope.scopeController.selectedAttributeTypeList = [];
    	}
    	if(row.select == true) {
    		//row.select = false;
    		var index = 0;
    		for(var i=0; i<$scope.scopeController.selectedAttributeTypeList.length; i++ ) {
    			if($scope.scopeController.selectedAttributeTypeList[i].tipo == row.tipo) {
    				index=i;
    				break;
    			}
    		}
    		$scope.scopeController.selectedAttributeTypeList.splice(index, 1);
    	} else {
    		//row.select = true;
    		$scope.scopeController.selectedAttributeTypeList.push(row);
    	}
    }
    
    $scope.importXml = function(){
    	qxFrameworkHttpService.importXml($scope.closeModal, $scope.scopeController);
    }
	
	$scope.getStyle = function (perc) {
		return {'width': perc+'%'};
	} 
	
	$scope.getPerc = function (perc) {
		return (Math.round(perc * 100) / 100) + ' %'
	} 
	
	$scope.list();
	
}]);