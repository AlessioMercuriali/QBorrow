var frameworkApp = angular.module('framework');

frameworkApp.directive('stringToInt', function() {
	return {
		require: 'ngModel',
		link: function(scope, element, attrs, ngModel) {
			ngModel.$parsers.push(function(value) {
				if(value != null) {
					return '' + value;
				} else {
					return '';
				}
			});
			ngModel.$formatters.push(function(value) {
				if(value != null) {
					return parseInt(value);
				} else {
					return null;
				}
			});
		}
	};
});

frameworkApp.directive('stringToDecimal', function() {
	return {
		require: 'ngModel',
		link: function(scope, element, attrs, ngModel) {
			ngModel.$parsers.push(function(value) {
				if(value != null) {
					return '' + value;
				} else {
					return '';
				}
			});
			ngModel.$formatters.push(function(value) {
				if(value != null) {
					return parseFloat(value);
				} else {
					return null;
				}
			});
		}
	};
});