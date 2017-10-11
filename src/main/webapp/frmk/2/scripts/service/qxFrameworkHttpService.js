var queryApp = angular.module('framework');

var qxFrameworkHttpService = function($http, frameworkConfig, $timeout, $log) {
	
	
	//Home
	this.countTemplate = function(scopeController){
		var success = function (data) {
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.templateNumber = data;
        };
    	
    	if(scopeController.search != null && scopeController.search != undefined){
    		//ok
    	} else {
    		scopeController.search = {};
    	}
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/template.action?task=count', 
        		data: quixParamSerializer(scopeController.search, 'search.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.countLock = function(scopeController){
		var success = function (data) {
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.lockNumber = data;
        };
    	
    	if(scopeController.search != null && scopeController.search != undefined){
    		//ok
    	} else {
    		scopeController.search = {};
    	}
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/lock.action?task=count', 
        		data: quixParamSerializer(scopeController.search, 'lockGroupSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.countException = function(scopeController){
		var success = function (data) {
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.exceptionNumber = data;
        };
    	
    	if(scopeController.search != null && scopeController.search != undefined){
    		//ok
    	} else {
    		scopeController.search = {};
    	}
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/exceptionLog.action?task=count', 
        		data: quixParamSerializer(scopeController.search, 'exceptionLogSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.countJobNotification = function(scopeController){
		var success = function (data) {
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.jobNotificationNumber = data;
        };
    	
    	if(scopeController.search != null && scopeController.search != undefined){
    		//ok
    	} else {
    		scopeController.search = {};
    	}
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/jobNotification.action?task=count', 
        		data: quixParamSerializer(scopeController.search, 'jobNotificationSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.countConfig = function(scopeController){
		var success = function (data) {
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.configNumber = data;
        };
    	
    	if(scopeController.search != null && scopeController.search != undefined){
    		//ok
    	} else {
    		scopeController.search = {};
    	}
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/config.action?task=count', 
        		data: quixParamSerializer(scopeController.search, 'configMetadataSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.countJob = function(scopeController){
		var success = function (data) {
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.jobNumber = data.jobCount;
        	scopeController.jobActive = data.jobActive;
        	scopeController.schedulerActive = data.schedulerActive;
        };
    	
    	if(scopeController.search != null && scopeController.search != undefined){
    		//ok
    	} else {
    		scopeController.search = {};
    	}
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=count', 
        		data: quixParamSerializer(scopeController.search, 'searchJob.')
        			  +quixParamSerializer(scopeController.search, 'searchJobRunning.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.countAttribute = function(scopeController){
		var success = function (data) {
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.attributeNumber = data;
        };
    	
    	if(scopeController.search != null && scopeController.search != undefined){
    		//ok
    	} else {
    		scopeController.search = {};
    	}
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attributeType.action?task=count', 
        		data: quixParamSerializer(scopeController.search, 'attributeTypeSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	// ** POPUP MODIFICA LABEL
	
	this.createNewLabel = function(scopeController) {
		var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	notValid = false;
        	newLabel = true;
        	scopeController.newLabel = data.newLabel;
        	scopeController.languageList = data.languageList;
        	scopeController.organizationList = data.organizationList;
        	
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=createNewLabel' + 
        			'&applicationCode=' + scopeController.application +
        			'&labelId=' + scopeController.labelId, 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	} 
	
	this.getLabelToUpdateList = function(scopeController) {
		_getLabelToUpdateList(scopeController);
	}
	
	function _getLabelToUpdateList(scopeController) {
		var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.labelId = data.labelId;
        	scopeController.application = data.application;
        	scopeController.viewList = data.viewList;
        	
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=searchLabelApplication' + 
        			'&applicationCode=' + scopeController.application +
        			'&labelId=' + scopeController.labelId, 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
		
	this.saveLabelToUpdateList = function(scopeController, modalInstance) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	if(data.message == 'KO') {
        		sweetAlert("Ops!","Non e' stato possibile salvare le label", "error");
        	} else {
        		modalInstance.close();
        	}
        };
    	    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=saveLabelList&applicationCode=' + scopeController.application, 
        		data: quixParamSerializer(scopeController.viewList, 'labelList'),
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
	
	// ** FINE POPUP MODIFICA LABEL
	// **LABEL 
	
	this.createLabelExcel = function(scopeController){
        document.location.href = frameworkConfig.baseUrl + '/framework/label.action?task=download&applicationCode=' + scopeController.application + '&organizationCode=' + scopeController.organization;
    }
	
	this.importLabelExcel = function(closeModal, scopeController){
		
		var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	sweetAlert({
 	 		   title: "Success",
 	 		   text: "File importato con successo",
 	 		   type: "success",
 	 		   confirmButtonText: "OK",
 	 		   closeOnConfirm: true}, 
 	 		function(){ 
 	 			$timeout(
 	 				function() {
 	 					_getApplicationLabelList(scopeController);
 	 				}, 60
 	 			);
 	 		});
        };
        
        var callUrl = frameworkConfig.baseUrl+'/label.action?task=upload';
        var fd = new FormData();
        fd.append('file', scopeController.file.content);
        scopeController.promise = $http.post(
        		callUrl, 
        		fd, {
	                transformRequest: angular.identity,
	                headers: {'Content-Type': undefined }//'multipart/form-data'}
        		}
        );
        scopeController.promise.success(success).error(_manageError);
        
	}
	
	this.resetLabelCache = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	sweetAlert("Empty", "Cache svuotata con successo", "success");
        	
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=resetLabelCache&reset=true', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
	
	this.countLabel = function(scopeController){
		var success = function (data) {
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.labelNumber = data.countLabel;
        	scopeController.labelActive = data.labelActive;
        };
    	
    	if(scopeController.search != null && scopeController.search != undefined){
    		//ok
    	} else {
    		scopeController.search = {};
    	}
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=count', 
        		data: quixParamSerializer(scopeController.search, 'labelSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.getApplicationLabelList = function(scopeController, form) {
    	_getApplicationLabelList(scopeController, form);
    }
    
    function _getApplicationLabelList(scopeController, form) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.result = data;
        	scopeController.applicationList = data.applicationList;
       		scopeController.application = scopeController.applicationList[0].applicationName;        		
       		_getOrganizationList(scopeController, form);
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=listApplication&reset=true', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
	
    this.getOrganizationList = function(scopeController, form) {
    	_getOrganizationList(scopeController, form);
    }
    
    function _getOrganizationList(scopeController, form) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.result = data;
        	scopeController.organizationList = data.organizationList;
            scopeController.organization = scopeController.organizationList[0].organizationName;        		        		
       		_getLabelList(scopeController, form);
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=listOrganization&reset=true&applicationCode=' + scopeController.application, 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.getLabelList = function(scopeController) {
    	_getLabelList(scopeController);
    }
    
    function _getLabelList(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.result = data;
        	scopeController.labelList = data.labelList;
        	scopeController.languagesList = data.languagesList;
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=listLabel&reset=true&applicationCode=' + scopeController.application + '&organizationCode=' + scopeController.organization, 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.deleteLabel = function(scopeController, index) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	var appl = scopeController.labelList[index].labelKey.application;
        	var org = scopeController.labelList[index].labelKey.organization;
        	for (var i = 0; i < scopeController.applicationList.length; i++) {
        		if (scopeController.applicationList[i].applicationName == appl) {
        			scopeController.applicationList[i].countLabel = scopeController.applicationList[i].countLabel - 1;
        		}
        	}
        	for (var i = 0; i < scopeController.organizationList.length; i++) {
        		if (scopeController.organizationList[i].organizationName == org) {
        			scopeController.organizationList[i].countLabel = scopeController.organizationList[i].countLabel - 1;
        		}
        	}
        	scopeController.labelList.splice(index,1);
        };
    	    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=deleteLabelJson', 
        		data: quixParamSerializer(scopeController.labelList[index], 'labelView.'),
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.saveLabelList = function(scopeController, form) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	if(data.message == 'KO') {
        		sweetAlert("Ops!","Non e' stato possibile salvare le label", "error");
        	} else {
        		sweetAlert("Successo","Le label sono state salvate con successo", "success");
        		_getApplicationLabelList(scopeController);
        	}
        };
    	    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/label.action?task=saveLabelList&applicationCode=' + scopeController.application + '&organizationCode=' + scopeController.organization, 
        		data: quixParamSerializer(scopeController.labelList, 'labelList'),
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    // ** FINE LABEL 
    // ** TEMPLATE
    this.createTemplateExcel = function(scopeController){
        document.location.href = frameworkConfig.baseUrl + '/framework/template.action?task=createExcel';
    }
    
    this.getTemplateList = function(scopeController) {
    	_getTemplateList(scopeController);
    }
    
    function _getTemplateList(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.templateList = data.templateList;
        	scopeController.applicationList = data.applicationList;
        	scopeController.languageList = data.languageList;
        	scopeController.count = data.count;
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/template.action?task=list&reset=true', 
        		data: quixParamSerializer(scopeController.search, 'search.'),
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.getTemplateApplicationList = function (scopeController) {
    	_getTemplateApplicationList(scopeController);
    }
    
    function _getTemplateApplicationList(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.templateApplicationList = data;
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/template.action?task=listApplication&reset=true', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.getTemplateOrganizationList = function (scopeController) {
    	_getTemplateOrganizationList(scopeController);
    }
    
    function _getTemplateOrganizationList(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.organizationList = data;
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/template.action?task=listOrganization&reset=true&application=' + scopeController.search.application, 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.deleteTemplate = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	_getTemplateList(scopeController);     	
        	
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/template.action?task=delete&templateId=' + scopeController.selectedRow.templateId, 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.editTemplate = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.selectedRow = data;
        	scopeController.selectedPage = "edit";     	
        	
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/template.action?task=edit&templateId=' + scopeController.selectedRow.templateId, 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.saveTemplate = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
    		sweetAlert("Successo","Template salvato con successo", "success");
    		scopeController.search= {};
    		scopeController.search.page = 1;
    		scopeController.selectedPage = 'list';
    		_getTemplateList(scopeController);
        	
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/template.action?task=save', 
        		data: quixParamSerializer(scopeController.selectedRow, 'template.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    // ** FINE TEMPLATE
    
	this.checkSystem = function(scopeController){
		if((typeof data) == 'string') {
    		// Not Managed Server error
    		_manageError(data, 0);
    		return;
    	}
		var success = function (data) {
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.warnMessage= data.warnMessage;
        	scopeController.errorMessage= data.errorMessage;
        	scopeController.checkSystemSpin = false;
        };
   
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/setting.action?task=checkSystem', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.getDatabaseVersion = function(scopeController){
		var success = function (data) {
			if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
			
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.databaseVersion = data;
        };
   
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/setting.action?task=getDatabaseVersion', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.getFrmkInfo = function(scopeController){
		var success = function (data) {
			if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
			
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.frameworkInfo = data;
        };
   
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/setting.action?task=getFrmkInfo', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
	}
	
	this.getContextScript = function(scopeController, name){
		var success = function (data) {
	    	if((typeof data) == 'string') {
	    		// Not Managed Server error
	    		_manageError(data, 0);
	    		
	    		return;
	    	}
	    	if(data.error == true) {
	    		_manageError(data, 0);
	    		
	    		return;
	    	}
	    	scopeController.migrationInfo = data;
		};
		
		var listPageUrl = frameworkConfig.baseUrl + '/framework/setting.action?task=migrationInfo&name=' + name;
		scopeController.logPopupListPromise = $http({ method: 'GET', url: listPageUrl});
		scopeController.logPopupListPromise.success(success).error(_manageError);
	}
	
	this.updateChecksum =function(scopeController, dbName, db){
		var success = function (data) {
	    	if((typeof data) == 'string') {
	    		// Not Managed Server error
	    		_manageError(data, 0);
	    		
	    		return;
	    	}
	    	if(data.error == true) {
	    		_manageError(data, 0);
	    		
	    		return;
	    	}
	    	$window.location.reload();
		};
		
	  	var listPageUrl = frameworkConfig.baseUrl +  '/admin/setting.action?task=updateChecksum&name=' + dbName + "&script=" + db.version + "&checksum=" + db.actualChecksum;
	  	scopeController.logPopupListPromise = $http({ method: 'GET', url: listPageUrl});
	  	scopeController.logPopupListPromise.success(success).error(_manageError);	
	}
	
	//Log
    this.getExceptionLogList = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.result = data;
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/exceptionLog.action?task=listJson&reset=true', 
        		data: quixParamSerializer(scopeController.search, 'exceptionLogSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    //Job
    this.getJobList = function(scopeController) {
    	 _getJobList(scopeController);
    }
    	
    function _getJobList(scopeController) {	
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.result = data;
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=listJson&reset=true', 
        		data: quixParamSerializer(scopeController.search, 'searchJob.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.deleteJob = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
    		sweetAlert("Successo","Il job è stato salvato con successo", "success");
    		_getJobRunningList(scopeController);
    		_getJobList(scopeController);     	
        	
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=delete&jobName=' + scopeController.selectedRow.name, 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.getContextList = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.contextList = data.list;
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=listJobContextJson', 
        		data: quixParamSerializer(scopeController.search, 'searchJobContext.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.deleteContext = function(scopeController, index){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.contextList.splice(index,1);
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=deleteContextJson', 
        		data: quixParamSerializer(scopeController.contextList[index], 'jobContext.')
        			  +"&"+quixParamSerializer(scopeController.search, 'searchJobContext.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.saveContext = function(scopeController, context){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	sweetAlert("Successo","Contesto Salvato", "success");
    		
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=saveContextJson', 
        		data: quixParamSerializer(context, 'jobContext.')
        			  +"&"+quixParamSerializer(scopeController.search, 'searchJobContext.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    
    this.getJobRunningList = function(scopeController) {
    	_getJobRunningList(scopeController);
    }
    
    function _getJobRunningList(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.resultRunning = data;
        	if(scopeController.lastCount != undefined && scopeController.lastCount != scopeController.resultRunning.count) {
        		// Un job e' partito o finito, ricarico la lista
        		_getJobList(scopeController); 
        	}
        	scopeController.lastCount = scopeController.resultRunning.count;
        	if(scopeController.resultRunning.count > 0) {
        		$timeout(
        			function() {
        				_getJobRunningList(scopeController);
        			}, 2500	
        		);
        	}
        };
    	
    	
        scopeController.promise2 = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=listRunningJson&reset=true', 
        		data: '', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise2.success(success).error(_manageError);
    }
    
    this.getJobContextList = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.resultContext = data;
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=listContextJson&reset=true', 
        		data: '', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.loadJobConfig = function(scopeController, form) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.resultConfig = data;
        	qxValidationError(data, form, $timeout, scopeController);
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=loadJobConfigJson&reset=true&job.name=' +  encodeURIComponent(scopeController.selectedRow.name), 
        		data: '', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.playJob = function(jobName, scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.message == 'KO') {
        		sweetAlert("Ops!","Non e' stato possibile avviare il job da questo contesto. Avviare il job dall'applicazione del framework", "error");
        	} else {
        		sweetAlert("Successo","Il sistema ha preso in carico la sua richiesta. Il Job verrà eseguito al più presto", "success");
        		$timeout(
        			function() {
        				_getJobRunningList(scopeController);
        			}, 1000	
        		);
        	}
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=playJob&jobName=' + encodeURIComponent(jobName) 
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.stopJob = function(jobName, context, scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.success == false) {
        		sweetAlert("Ops!","Non e' stato possibile fermare il job da questo contesto", "error");
        	} else {
        		sweetAlert("Successo","Il sistema ha preso in carico la sua richiesta. Il Job verrà fermato al più presto", "success");
        	}
        };
        scopeController.promise = $http({ 
    		method: 'POST', 
    		url: frameworkConfig.baseUrl + '/framework/job.action?task=stopJobRunning&jobName=' + encodeURIComponent(jobName) + '&jobRunningContext=' + encodeURIComponent(context)
	    });
	    scopeController.promise.success(success).error(_manageError);
	}
    
    
    this.saveJob = function(scopeController, form, modalInstance) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.message == 'KO') {
        		qxValidationError(data, form, $timeout, scopeController);
        		//sweetAlert("Ops!","Non e' stato possibile salvare il job", "error");
        	} else {
        		sweetAlert({
        			title: "Successo",
        			text: "Il job è stato salvato con successo", 
        			type: "success"},
        			function() {
        			 	modalInstance.dismiss("cancel");
                		scopeController.selectedRow.create = false;
        			}
        		);
        		
        	}
        };
    	
        var j = JSON.parse(JSON.stringify(scopeController.selectedRow));
		j.lastJobExecution = null;
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=saveJson&create=' + scopeController.selectedRow.create, 
        		data:  quixParamSerializer(j, 'job.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.getClusterList = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.clusterList = data;
    	}
    	scopeController.promise = $http({ 
    			method: 'POST', 
    			url: frameworkConfig.baseUrl + '/framework/config.action?task=getJsonClusterList&reset=true', 
    			data: '', 
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	    });
	    scopeController.promise.success(success).error(_manageError);
    }
    
    this.getCompanyList = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.companyList = data;
    	}
    	scopeController.promise = $http({ 
    			method: 'POST', 
    			url: frameworkConfig.baseUrl + '/framework/config.action?task=getJsonCompanyList&reset=true', 
    			data: '', 
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	    });
	    scopeController.promise.success(success).error(_manageError);
    }
    
    this.listJobHistory = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.jobHistoryCount = data.count;
        	scopeController.jobHistoryList = data.list;
        	scopeController.selectedPage='history';
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/job.action?task=listJobHistoryJson&reset=true', 
        		data: quixParamSerializer(scopeController.searchHistory, 'searchJobHistory.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    //SysConfig
    this.getConfigList = function(scopeController, form) {
    	_getConfigList(scopeController, form);
    }
    
    function _getConfigList(scopeController, form) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	qxValidationError(data, form, $timeout, scopeController);
        	scopeController.result = data;
        	
        	var value = data.list;
        	var out = [];
    		var i = 0;
    		for (i = 0; i < value.length; i++) { 
    			var config = value[i];
    			if(config.application == null) {
    				config.application = '';
    			}
    			if(config.section == null) {
    				config.section = '';
    			}
    			if(config.fieldset == null) {
    				config.fieldset = '';
    			}
    			
    			// Application
    			var find1 = false;
    			var aView = null;
    			for (k1 = 0; k1 < out.length; k1++) {
    				if(out[k1].application == config.application) {
    					find1 = true;
    					aView = out[k1];
    					aView.count ++;
    				}
    			}
    			if(!find1) {
    				aView = {};
    				aView.application = config.application;
    				aView.list = [];
    				aView.count = 1;
    				out.push(aView);
    			}
    			// Section
    			var find2 = false;
    			var sView = null;
    			for (k2 = 0; k2 < aView.list.length; k2++) {
    				if(aView.list[k2].section == config.section) {
    					find2 = true;
    					sView = aView.list[k2];
    					sView.count++;
    				}
    			}
    			if(!find2) {
    				sView = {};
    				sView.section = config.section;
    				sView.count = 1;
    				sView.list = [];
    				aView.list.push(sView);
    			}
    			// FieldSet
    			var find3 = false;
    			var fView = null;
    			for (k3 = 0; k3 < sView.list.length; k3++) {
    				if(sView.list[k3].fieldset == config.fieldset) {
    					find3 = true;
    					fView = sView.list[k3];
    				}
    			}
    			if(!find3) {
    				fView = {};
    				fView.fieldset = config.fieldset;
    				fView.list = [];
    				sView.list.push(fView);
    			}
    			fView.list.push(config);
    		}
    		scopeController.result.tree = out;
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/config.action?task=listJson&reset=true', 
        		data: quixParamSerializer(scopeController.search, 'configMetadataSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    
    
    this.saveConfig = function(scopeController, modalInstanceConfig, form) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.message == 'KO') {
        		
        		sweetAlert("Ops!","Non e' stato possibile salvare la config", "error");
        	} else {
        		sweetAlert("Successo","La configurazione è stata salvata con successo", "success");
        		if(modalInstanceConfig !=  undefined) {
        			modalInstanceConfig.dismiss('cancel');
        		}
        	}
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/config.action?task=saveJson', 
        		data:  quixParamSerializer(scopeController.selectedConfig, 'configMetadata.')+'&'+quixParamSerializer(scopeController.selectedConfig, ''), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.loadAttributeListForConfig = function(scopeController, typeDomain) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.error != null){
        		sweetAlert("Error", data.message, "error");
        	} else {
        		scopeController.attributeValuesList = data.list;
        	}
        	 
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attribute.action?task=listJson&reset=true', 
        		data: '&attributeSearch.page=-1&attributeSearch.type=' + encodeURIComponent(typeDomain),
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.deleteConfigMetadata = function(scopeController, row, listForm) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.error != null){
        		sweetAlert("Error", data.message, "error");
        	} else {
        		_getConfigList(scopeController, listForm);
        	}
        	 
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/config.action?task=deleteJson', 
        		data: '&configMetadataId=' + row.configMetadataId,
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    	
    	
    }
    
    this.saveConfigMetadata = function(scopeController, modalInstanceConfig, form, listForm) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	qxValidationError(data, form, $timeout, scopeController);
        	if(data.error == false && data.message=='OK'){
        		sweetAlert("Successo","La configurazione è stata salvata con successo", "success");
        		if(modalInstanceConfig !=  undefined) {
        			modalInstanceConfig.dismiss('cancel');
        		}
        		_getConfigList(scopeController, listForm);
        	}
        };
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/config.action?task=saveMetadataJson', 
        		data:  quixParamSerializer(scopeController.selectedRow, 'configMetadata.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.getAllAttributeType = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.allAttributeType = data.list;
        };
    	_getAllAttributeType(scopeController, success);
    }
    
    this.selectAllAttributeType = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	for(var i=0;i<data.list.length;i++){
        		data.list[i].select = true;
    			scopeController.selectedAttributeTypeList.push(data.list[i]);
    		}
        	for(var i=0;i<scopeController.result.length;i++){
    			scopeController.result[i].select = true;
    		}
        };
    	_getAllAttributeType(scopeController, success);
    }
    
    function _getAllAttributeType(scopeController, success){
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attributeType.action?task=listJson&reset=false&attributeTypeSearch.page=-1', 
        		data: '', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    function _getAttributeTypeList(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.result = data.list;
        	scopeController.count = data.count;
        	for(var i=0;i<scopeController.result.length;i++){
    			scopeController.result[i].select = false;
    		}
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attributeType.action?task=listJson&reset=false', 
        		data: quixParamSerializer(scopeController.search, 'attributeTypeSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    //SysAttribute
    this.getAttributeTypeList = function(scopeController){
    	_getAttributeTypeList(scopeController);
    }
    
    this.getAttributeValue = function(scopeController, name, index){
    	
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	scopeController.attributeValuesList[index]= data.attributeValuesList;
           
        };
        
      
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attribute.action?task=getAttributeValue', 
        		data: '&attributeName='+name, 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.editAttribute = function(scopeController, isNew){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	scopeController.selectedAttribute = data.attribute;
        	scopeController.attributeTypeAttributes = data.attributeTypeAttributes;
        	scopeController.descriptionInLanguage = data.descriptionInLanguage;
        	scopeController.attributeInLanguage = data.attributeInLanguage;
        	scopeController.labelsAndHelpersAttributes = data.labelsAndHelpersAttributes;
        	scopeController.companyList = data.companyList;
        	scopeController.attributeTypeCode = data.attributeTypeCode;
        };
        
      
    	var type = ((isNew)?scopeController.selectedAttributeType.tipo:scopeController.selectedAttribute.type);
    	var language = ((isNew)?'':scopeController.selectedAttribute.language.language);
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attribute.action?task=editJson', 
        		data: '&attribute.code='+scopeController.selectedAttribute.code+'&attribute.type='+type
        		+'&attribute.id='+scopeController.selectedAttribute.id+'&attribute.language='+language
        		+'&reset='+isNew,
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.editAttributeType = function(scopeController, isNew){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	scopeController.selectedAttributeType = data.attributeType;
        	scopeController.attributeTypeAttributes = data.attributeTypeAttributes;
//        	if(scopeController.attributeList == null || scopeController.attributeList == undefined){
        		scopeController.attributeList = [];
//        	}
        	for(var i=0; i<scopeController.attributeTypeAttributes.length;i++){
        		if(scopeController.attributeTypeAttributes[i].code != 'AT_CODE' && scopeController.attributeTypeAttributes[i].code != 'AT_DESCR'){
        			scopeController.attributeList.push(scopeController.attributeTypeAttributes[i]);
        		} else if (scopeController.attributeTypeAttributes[i].code == 'AT_CODE'){
        			scopeController.attributeTypeAttributeCode = scopeController.attributeTypeAttributes[i];
        		} else if (scopeController.attributeTypeAttributes[i].code == 'AT_DESCR'){
        			scopeController.attributeTypeAttributeDescr = scopeController.attributeTypeAttributes[i];
        		}
        	}
        	scopeController.codesLabelsAndHelpersMap = data.codesLabelsAndHelpersMap;
        	scopeController.descrsLabelsAndHelpersMap = data.descrsLabelsAndHelpersMap;
        	scopeController.attributesLabelsMap = data.attributesLabelsMap;
        	scopeController.attributesHelpersMap = data.attributesHelpersMap;
        	
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attributeType.action?task=editJson&reset='+isNew, 
        		data: quixParamSerializer(scopeController.selectedAttributeType, 'attributeType.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.getAttributeList = function(scopeController, attribute){
    	_getAttributeList(scopeController, attribute);
    }
    
    function _getAttributeList(scopeController, attribute){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.attributeList = data.list;
        	scopeController.countAttribute = data.count;
        	scopeController.searchAttribute = data.attributeSearch;
        	scopeController.selectedAttributeType = data.attributeType;
			scopeController.attributeTypeAttributeCode = data.attributeTypeCode;
			scopeController.attributeTypeAttributeDescr = data.attributeTypeDescr;
			scopeController.attributeTypeAttributes = data.attributeTypeAttributes;
			scopeController.labelsAndHelpersAttributes = data.labelsAndHelpersAttributes;
			scopeController.companyList = data.companyList;
        	scopeController.selectedPage = "attribute";
        	scopeController.resetAttribute = false;
        };
    	
        scopeController.searchAttribute.type = attribute.tipo;
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attribute.action?task=listJson&reset='+scopeController.resetAttribute, 
//        		data: '&attributeType='+JSON.stringify(attribute),
        		data: quixParamSerializer(attribute, 'attributeType.')+"&"+quixParamSerializer(scopeController.searchAttribute, 'attributeSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.restoreAttribute = function(scopeController, attribute){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.error != null){
        		sweetAlert("Error", data.message, "error");
        	} else {
        		attribute.activeFlag=1;
        	}
        	 
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attribute.action?task=restoreJson', 
        		data: '&attribute.code='+attribute.code+'&attribute.type='+attribute.type,
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    
    
    this.deleteAttribute = function(scopeController, attribute){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.error != null){
        		sweetAlert("Error", data.message, "error");
        	} else {
        		scopeController.attributeList = data.list;
        	}
        	 
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attribute.action?task=deleteJson', 
        		data: quixParamSerializer(attribute, 'attribute.'),
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.XLSAttributeList = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        };
        
     
        
        document.location.href = frameworkConfig.baseUrl + '/framework/attribute.action?task=downloadExcelTemplate';
        
    }
    
    this.saveAttribute = function(scopeController, form){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	qxValidationError(data, form, $timeout, scopeController);
        	if(data.error == false && data.message=='OK'){
        		sweetAlert("Saved", "attribute salvato con successo", "success");
            	scopeController.selectedPage = "attribute";
            	_getAttributeList(scopeController, scopeController.selectedAttributeType);
        	}
        	 
        };
        
        scopeController.selectedAttribute.activeFlag = true;
    
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attribute.action?task=saveJson', 
        		data: quixParamSerializer(scopeController.selectedAttribute, 'attribute.')
        			  +"&"+quixParamSerializer(scopeController.descriptionInLanguage, 'descriptionInLanguage.')
        			  +"&"+quixParamSerializer(scopeController.attributeInLanguage, 'attributeInLanguage.'),
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.saveAttributeType = function(scopeController, form){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	qxValidationError(data, form, $timeout, scopeController);
        	if(data.error == false && data.message=='OK'){
        		sweetAlert("Saved", "attribute type salvato con successo", "success");
        		scopeController.selectedPage = 'list';
        		_getAttributeTypeList(scopeController);
        	}
        	 
        };
        
        //scopeController.attributeList.push(scopeController.attributeTypeAttributeCode);
        //scopeController.attributeList.push(scopeController.attributeTypeAttributeDescr);
        
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attributeType.action?task=saveJson', 
        		data: quixParamSerializer(scopeController.selectedAttributeType, 'attributeType.')
        			  +'&'+quixParamSerializer(scopeController.attributeTypeAttributeCode, 'attributeTypeCode.')
        			  +'&'+quixParamSerializer(scopeController.attributeTypeAttributeDescr, 'attributeTypeDescr.')
        			  +'&'+quixParamSerializer(scopeController.codesLabelsAndHelpersMap, 'codesLabelsAndHelpersMap.')
        			  +'&'+quixParamSerializer(scopeController.descrsLabelsAndHelpersMap, 'descrsLabelsAndHelpersMap.')
        			  +'&'+quixParamSerializer(scopeController.attributeList, 'attributeTypeAttributes')
        			  +'&'+quixParamSerializer(scopeController.attributesLabelsMap, 'attributesLabelsMap.')
        			  +'&'+quixParamSerializer(scopeController.attributesHelpersMap, 'attributesHelpersMap.')
        			  , 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.createExcel = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        };
        
        var str = '';
        for(i = 0; i<scopeController.selectedAttributeTypeList.length; i++) {
        	var el = scopeController.selectedAttributeTypeList[i];
        	str = str + '&' + quixParamSerializer(el, 'selectedAttributeTypes[' + i + '].');
        }
        
        document.location.href = frameworkConfig.baseUrl + '/framework/attributeType.action?task=createExcel'+str;
    }
    
    this.createExcelConfig = function(scopeController){
        document.location.href = frameworkConfig.baseUrl + '/framework/config.action?task=createExcel';
    }
    
    this.generateScripts = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        };
        
        var str = '';
        for(i = 0; i<scopeController.selectedAttributeTypeList.length; i++) {
        	var el = scopeController.selectedAttributeTypeList[i];
        	str = str + '&' + quixParamSerializer(el, 'selectedAttributeTypes[' + i + '].');
        }
        
        document.location.href = frameworkConfig.baseUrl + '/framework/attributeType.action?task=generateScripts'+str;
    }
    
    this.generateScriptsConfig = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        };
        var str = '';
        for(i = 0; i<scopeController.selectedConfigList.length; i++) {
        	var el = scopeController.selectedConfigList[i];
        	str = str + '&selectedConfigMetadataList[' + i + ']=' + el.configMetadataId;
        }
        document.location.href = frameworkConfig.baseUrl + '/framework/config.action?task=generateScripts'+str;
    }
    
    this.exportToXml = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        };
        
        var str = '';
        for(i = 0; i<scopeController.selectedAttributeTypeList.length; i++) {
        	var el = scopeController.selectedAttributeTypeList[i];
        	str = str + '&' + quixParamSerializer(el, 'selectedAttributeTypes[' + i + '].');
        }
        
        document.location.href = frameworkConfig.baseUrl + '/framework/attributeType.action?task=exportToXml&exportAttributes=true'+str+'&'+quixParamSerializer(true, 'exportAttributes.');
//        scopeController.promise = $http({ 
//        		method: 'POST', 
//        		url: frameworkConfig.baseUrl + '/framework/attributeType.action?task=exportToXml', 
//        		data: str+'&'+quixParamSerializer(true, 'exportAttributes.'), 
//        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
//        });
//        scopeController.promise.success(success).error(_manageError);
    }
    
	this.importXml = function(closeModal, scopeController){
		
		var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.success){
        		scopeController.importPerc = 1;
        		scopeController.startImport=true;
        		$timeout(function(){ getProgress(closeModal, scopeController)}, 50);
        	}
        };
        
        var callUrl = frameworkConfig.baseUrl+'/attributeType.action?task=importFromXmlJson';
        var fd = new FormData();
        fd.append('file', scopeController.file.content);
        scopeController.promise = $http.post(
        		callUrl, 
        		fd, {
	                transformRequest: angular.identity,
	                headers: {'Content-Type': undefined }//'multipart/form-data'}
        		}
        );
        scopeController.promise.success(success).error(_manageError);
        
	}
    
	function getProgress(closeModal, scopeController){
		
		var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.success != true){
	        	var pAttr = data.pAttr;
	        	var pType = data.pType;
	        	var tAttr = data.tAttr;
	        	var tType = data.tType;
	        	scopeController.importPerc = ((pAttr+pType)/(tAttr+tType))*100;
	        	$log.log(pAttr + ' ' + pType + ' ' + tAttr + ' ' + tType);
	        	$timeout(function(){ getProgress(closeModal, scopeController)}, 1000);
        	} else {
        		scopeController.importPerc = 100;
        		scopeController.startImport=false;
        		sweetAlert("Import", "File importato con successo", "success");
        		_getApplicationLabelList(scopeController);
        		closeModal();
        	}
      
        };
        
        scopeController.promise = $http({ 
    		method: 'POST', 
    		url: frameworkConfig.baseUrl + '/framework/label.action?task=progress', 
    		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	    });
	    scopeController.promise.success(success).error(_manageError);
	
	}
    
	
    this.emptyCacheJson = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.search.page = 1;
        	scopeController.result = data.list;
        	for(var i=0;i<scopeController.result.length;i++){
    			scopeController.result[i].select = false;
    		}
        	sweetAlert("Empty", "Cache svuotata con successo", "success");
        	
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/attributeType.action?task=emptyCacheJson&reset=true', 
        		data: quixParamSerializer(scopeController.search, 'attributeTypeSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.emptyCacheJsonConfig = function(scopeController, form){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.result = data.list;
        	for(var i=0;i<scopeController.result.length;i++){
    			scopeController.result[i].select = false;
    		}
        	sweetAlert("Empty", "Cache svuotata con successo", "success");
        	_getConfigList(scopeController, form);
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/config.action?task=emptyCacheJson&reset=true', 
        		data: quixParamSerializer(scopeController.search, 'attributeTypeSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    //Lock
    this.getLockList = function(scopeController, reset){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.lockList = data.list;
        	scopeController.lockItemMap = data.lockGroupItemsMap;
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/lock.action?task=listJson&reset='+reset, 
        		data: quixParamSerializer(scopeController.search, 'lockGroupSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    this.unlockJson = function(scopeController, id){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.lockList = data.list;
        	scopeController.lockItemMap = data.lockGroupItemsMap;
        	sweetAlert("Success", "Lock eliminato e sbloccato", "success");
        	
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/lock.action?task=unlockJson&lockGroupId='+id, 
        		data: quixParamSerializer(scopeController.search, 'lockGroupSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    };
    
    this.getJobNotificationList = function(scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	scopeController.result = data;
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/jobNotification.action?task=listJson&reset=true', 
        		data: quixParamSerializer(scopeController.jobNotificationSearch, 'jobNotificationSearch.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    };
    
    this.saveJobNotification = function($scope, scopeController) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		_manageError(data, 0);
        		return;
        	}
        	
        	if(data.message == 'KO') {
        		sweetAlert("Ops!","Non e' stato possibile salvare il job notification", "error");
        	} else {
        		sweetAlert("Successo","Il job notification e' stato salvato con successo", "success");
        		if (scopeController.jobNotification.create) {
        			$scope.list();
        		}
        		scopeController.jobNotification.create = false;
        		$scope.cancel();
        	}
        };
    	
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/jobNotification.action?task=saveJson&create=' + scopeController.jobNotification.create, 
        		data:  quixParamSerializer(scopeController.jobNotification, 'jobNotification.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    };
    
    this.deleteJobNotification = function($scope, scopeController, jobNotification) {
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		sweetAlert("Error", data.message, "error");
        		return;
        	}
        	$scope.list();
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/jobNotification.action?task=deleteJson', 
        		data: '&jobNotificationId=' + jobNotification.id,
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    };
    
    //DEBUG - MAIL
    this.sendMail = function(scopeController){
    	var success = function (data) {
        	if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		sweetAlert("Errore nell'invio della mail", data.message, "error");
        		return;
        	}
        	sweetAlert("Successo","Mail inviata con successo", "success");
        	scopeController.mail = {};
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/debug.action?task=sendMail', 
        		data: quixParamSerializer(scopeController.mail, 'mailToSend.'), 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
  //DEBUG - SYSTEM
    this.getSystemProperties = function(scopeController){
    	var success = function (data) {
    		if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		sweetAlert("Error", data.message, "error");
        		return;
        	}
        	scopeController.systemProperties = data;
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/debug.action?task=getSystemProperties', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    //DEBUG - MEMORY
    this.getMemoryProperties = function(scopeController){
    	var success = function (data) {
    		if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		sweetAlert("Error", data.message, "error");
        		return;
        	}
        	scopeController.heapMemory = data.heapMemory;
        	scopeController.nonHeapMemory = data.nonHeapMemory;
        	scopeController.memoryPoolMXBeanList = data.memoryPoolMXBeanList;
        	
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/debug.action?task=getMemoryProperties', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
    //DEBUG - THREAD
    this.getThreadList = function(scopeController){
    	var success = function (data) {
    		if((typeof data) == 'string') {
        		// Not Managed Server error
        		_manageError(data, 0);
        		return;
        	}
        	if(data.error == true) {
        		sweetAlert("Error", data.message, "error");
        		return;
        	}
        	scopeController.threadList = data;
        };
    	
        scopeController.promise = $http({ 
        		method: 'POST', 
        		url: frameworkConfig.baseUrl + '/framework/debug.action?task=getThreadList', 
        		headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
        scopeController.promise.success(success).error(_manageError);
    }
    
};

queryApp.service('qxFrameworkHttpService', ['$http', 'frameworkConfig', '$timeout', '$log', qxFrameworkHttpService]);