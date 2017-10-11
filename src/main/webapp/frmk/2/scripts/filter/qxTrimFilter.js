var frameworkApp = angular.module('framework');

frameworkApp.filter('trim', function () {
    return function(value) {
    	if(value == null || value == undefined) {
    		return value;
    	}
        if(!angular.isString(value)) {
            return value;
        }  
        //return value.replace(/^\s+|\s+$/g, ''); // you could use .trim, but it's not going to work in IE<9
        return $.trim(value);
    };
});