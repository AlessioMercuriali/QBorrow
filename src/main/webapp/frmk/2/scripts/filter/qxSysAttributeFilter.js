var myApp = angular.module('framework');

myApp.filter('sysattribute', function() {
	return function(input, type) {
	    input = input || '';
	    var out = input;
	    var list = eval(type);
	    for (var i = 0; i < list.length; i++) {
	      if(list[i].code == input) {
	    	  out = list[i].description;
	    	  break;
	      }
	    }
	    return out;
	};
});