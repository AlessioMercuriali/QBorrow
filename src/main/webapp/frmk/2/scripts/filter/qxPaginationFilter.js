var myApp = angular.module('framework');

myApp.filter('pagination', function() {
	return function(input, start) {
		// start = +start;
		return input.slice(start);
	};
});