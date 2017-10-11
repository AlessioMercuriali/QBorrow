var qborrowApp = angular.module('qborrow');


qborrowApp.directive('dateformat', ['$filter', '$locale', function ($filter, $locale) {
    return {
        require: '?ngModel',
        link: function (scope, elem, attrs, ctrl) {
            if (!ctrl) return;


            ctrl.$formatters.unshift(function (a) {
                var format = attrs.dateformat;
                //return $filter('date')(ctrl.$modelValue, format)
                if (ctrl.$modelValue == null) {
                	if (attrs.presetdate) {
                		ctrl.$setViewValue(moment().startOf('day'));
                	} else {
                		return '';
                	}
                }
                var d = moment(ctrl.$modelValue).format(format);
                if(d == 'Invalid date') {
                	return ctrl.$modelValue;
                } else {
                	return d;
                }
            });


            ctrl.$parsers.unshift(function (viewValue) {
            	var format = attrs.dateformat;
            	if(/^[0]+$/.test(viewValue)) {
            		return null;
            	}
            	try {
            		var d = moment(viewValue, format);
            		if(isNaN(d.toDate().getTime())) {
            			return null;
            		}
            		return d.toDate().getTime();
            	} catch(e) {
            		return null;
            	}
            });
        }
    };
}]);