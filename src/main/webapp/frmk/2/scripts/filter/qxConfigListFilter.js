var frameworkApp = angular.module('framework');

frameworkApp.filter('configList', function () {
    return function(value) {
    	if(value == null || value == undefined) {
    		return value;
    	}
		
		return out;
    };
});