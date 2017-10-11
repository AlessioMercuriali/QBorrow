
if(typeof frameworkPresent == 'undefined'){
	// Variabile globale dove registrare la lista dei viewer presenti nella pagina.
	frameworkPresent = new Array();
    // Creazione del modulo e delle relative dipendenze
    var dependencyArray = ['ui.bootstrap','ngAnimate', 'ngMessages', 'angular-icheck', 'colorpicker.module', 'oitozero.ngSweetAlert', 'cgBusy', 'angular-duration-format', 'ui.codemirror', 'ngSanitize', 'ngWYSIWYG', 'summernote'];
    
    var frameworkApp = angular.module('framework', dependencyArray);
    
    function qxForEachSorted(obj, iterator, context) {
    	  var keys = Object.keys(obj).sort();
    	  for (var i = 0; i < keys.length; i++) {
    	    iterator.call(context, obj[keys[i]], keys[i]);
    	  }
    	  return keys;
    }
    
    function qxSerializeValue(v) {
    	  if (v !== null && typeof v === 'object') {
    	    return (toString.call(v) === '[object Date]') ? v.toISOString() : JSON.stringify(v);
    	  }
    	  return v;
    }
    
    function quixParamSerializer(params, prefix) {
        if (!params) return '';
        var parts = [];
        if(Array.isArray(params)) {
        	 for (var i = 0; i < params.length; i++) {
       		  if (params[i] !== null && typeof params[i] === 'object') {
       			  parts.push(quixParamSerializer(params[i], prefix + '[' + i + '].'));
       		  } else {
       			  parts.push(quixParamSerializer(params[i], prefix + '[' + i + ']'));
       		  }
       	  }
        } else {
	        qxForEachSorted(params, function(value, key) {
	          if (value === null || value == undefined) return;
	          if (Array.isArray(value)) {
	        	  for (var i = 0; i < value.length; i++) {
	        		  if (value[i] !== null && typeof value[i] === 'object') {
	        			  parts.push(quixParamSerializer(value[i], prefix + key + '[' + i + '].'));
	        		  } else {
	        			  parts.push(quixParamSerializer(value[i], prefix + key + '[' + i + ']'));
	        		  }
	        		  //parts.push(encodeURIComponent(prefix + key)  + '=' + encodeURIComponent(qxSerializeValue(v)));
	        	  }
	          } else {
	        	  if (value !== null && typeof value === 'object') {
	        		  parts.push(quixParamSerializer(value, prefix + key + '.'));
	        	  } else {
	        		  parts.push(encodeURIComponent(prefix + key) + '=' + encodeURIComponent(qxSerializeValue(value)));
	        	  }
	          }
	        });
        }
        return parts.join('&');
      };

      function qxValidationError(data, form, $timeout, scopeController) {
      	$timeout( function() {
  			scopeController.notManagedErrors = [];
  			for (var property in form) {
  				if(form[property] != undefined && form[property].$setValidity != null) {
  					for (var error in form[property].$error) {
  						form[property].$setValidity(error, true); 
  					}
  				}
  			}
      		form.$setPristine();
      		if(data.errors != null) {
	          	for (i = 0; i < data.errors.length; i++) { 
	          		var err = data.errors[i];
	          		var p = err.property;
	          		p = p.replace('.', '_');
	          		p = p.replace('[', '_');
	          		p = p.replace(']', '_');
	          		if(form[p] != undefined) {
	          			form[p].$setValidity(err.message, false); 
	          		} else {
	          			scopeController.notManagedErrors.push(err);
	          		}
	          	}
      		}
      	}, 100);
    }  
      
    function _manageError (data, status, fnc, httpObj){
    	var testoErrore = '';
    	if((typeof data) == 'string') {
        	if(data.indexOf('Struts Problem Report')>0) {
        		var str = data.substring(data.indexOf('<strong>Messages</strong>') + '<strong>Messages</strong>'.length, data.length);
        		str = str.substring(str.indexOf('<li>') + 4, str.indexOf('</li>'));
        		testoErrore = str;
        	} else if(data.indexOf('html><head><title>Apache Tomcat/') > 0) {
        		var str = data.substring(data.indexOf('<body>') + '<body>'.length, data.length);
        		testoErrore = str.substring(str.indexOf('<h1>') + 4, str.indexOf('</h1>'));
        		str = str.substring(str.indexOf('<b>description</b>') + '<b>description</b>'.length, str.length);
        		testoErrore = testoErrore + str.substring(str.indexOf('<u>') + 3, str.indexOf('</u>'));
        	} else if(data.indexOf('id="errorJson"') > 0) {
        		// Pagina di errore framework
        		var str = data.substring(data.indexOf('id="errorJson"') + 'id="errorJson"'.length, data.length);
        		str = str.substring(str.indexOf('>') + 1, str.indexOf('<'));
        		str = str.trim();
        		var o = JSON.parse(str);
        		testoErrore = o.errorText;
        	}else {
        		testoErrore = data;
        	}
    	} else {
    		if(data != null) {
    			testoErrore = data.message;
    		} else {
    			testoErrore = data;
    		}
    	}
    	var messageTitle = 'Ops!';
    	if(data != null && data.title != undefined && data.title != null) {
    		messageTitle = data.title;
    	}
    	swal({title: messageTitle, text: testoErrore, type: "error", confirmButtonText: "Close", allowOutsideClick: true});
    }

    function _createIdString(str){
    	str = str.replace(/ /g, '_');
    	return str;
    }
  
    frameworkApp.run(["$templateCache", function($templateCache) {
    	  $templateCache.put("template/modal/backdrop.html",
    	    "<div style=\"background-color: rgba(0, 0, 0, 0.85); opacity: initial; position: fixed; top: 0; right: 0; bottom: 0; left: 0; overflow-y: visible; overflow-x: hidden;\" class=\"qmodal-backdrop fade {{ backdropClass }}\"\n" +
    	    "     ng-class=\"{in: animate}\"\n" +
    	    "     ng-style=\"{'z-index': 1540 + (index && 1 || 0) + index*10}\"\n" +
    	    "></div>\n" +
    	    "");
    	}]);
    
    frameworkApp.run(["$templateCache", function($templateCache) {
    	$templateCache.put("template/modal/window.html",
    		"<div tabindex=\"-1\" role=\"dialog\" class=\"qmodal qfade\" ng-class=\"{qin: animate}\" ng-style=\"{'z-index': 3000 + index*10, display: 'block'}\" ng-click=\"close($event)\">\n" +
	    	" <div class=\"qmodal-dialog\" ng-class=\"{'qmodal-sm': size == 'sm', 'qmodal-lg': size == 'lg'}\"><div class=\"qmodal-content\" modal-transclude></div></div>\n" +
	    	"</div>" +
	    	"");
   	}]);
    
    frameworkApp.run(["$templateCache", function($templateCache) {
  	  	$templateCache.put("template/modal/window-quix.html",
	  	    "<div style=\"width: 96%; top: 2%; left: 2%; margin-left: 0; position: absolute;overflow: initial;\" tabindex=\"-1\" role=\"dialog\" class=\"qmodal fade\" ng-class=\"{in: animate}\" ng-style=\"{'z-index': 1550 + index*10, display: 'block'}\" ng-click=\"close($event)\">\n" +
	  	    "    <div class=\"qmodal-dialog\" style=\"overflow: visible;\" ng-class=\"{'qmodal-sm': size == 'sm', 'qmodal-lg': size == 'lg'}\"><div class=\"qmodal-content\" style=\"padding: 5px; overflow: visible;background-color: white;\" modal-transclude></div></div>\n" +
	  	    "</div>");
    }]);
    
    frameworkApp.run(["$templateCache", function($templateCache) {
    	 $templateCache.put("template/modal/window-quix-small.html",
	  	    "<div style=\"width: 96%; top: 2%; left: 2%; margin-left: 0; position: absolute;overflow: initial;\" tabindex=\"-1\" role=\"dialog\" class=\"qmodal fade\" ng-class=\"{in: animate}\" ng-style=\"{'z-index': 1550 + index*10, display: 'block'}\" ng-click=\"close($event)\">\n" +
	  	    "    <div class=\"qmodal-dialog\" style=\"width: 600px; overflow: visible;\" ng-class=\"{'qmodal-sm': size == 'sm', 'qmodal-lg': size == 'lg'}\"><div class=\"qmodal-content\" style=\"padding: 5px; overflow: visible;background-color: white;\" modal-transclude></div></div>\n" +
	  	    "</div>");
     }]);
    
    frameworkApp.run(["$templateCache", function($templateCache) {
   	 $templateCache.put("template/modal/window-quix-action.html",
	  	    "<div style=\"width: 96%; top: 2%; left: 2%; margin-left: 0; position: absolute;overflow: initial;\" tabindex=\"-1\" role=\"dialog\" class=\"qmodal fade\" ng-class=\"{in: animate}\" ng-style=\"{'z-index': 1550 + index*10, display: 'block'}\" ng-click=\"close($event)\">\n" +
	  	    "    <div class=\"qmodal-dialog\" style=\"width: 95%; overflow: visible;\" ng-class=\"{'qmodal-sm': size == 'sm', 'qmodal-lg': size == 'lg'}\"><div class=\"qmodal-content\" style=\"padding: 5px; overflow: visible;background-color: white;\" modal-transclude></div></div>\n" +
	  	    "</div>");
     }]);
     
    
    frameworkApp.run(["$templateCache", function($templateCache) {
	  $templateCache.put("template/pagination/pager.html",
	    "<ul class=\"qpager\">\n" +
	    "  <li ng-class=\"{disabled: noPrevious(), previous: align}\"><a href ng-click=\"selectPage(page - 1)\">{{getText('previous')}}</a></li>\n" +
	    "  <li ng-class=\"{disabled: noNext(), next: align}\"><a href ng-click=\"selectPage(page + 1)\">{{getText('next')}}</a></li>\n" +
	    "</ul>");
	}]);

    frameworkApp.run(["$templateCache", function($templateCache) {
    	  $templateCache.put("template/pagination/pagination.html",
    	    "<ul class=\"qpagination qpagination-sm\">\n" +
    	    "  <li ng-if=\"boundaryLinks\" ng-class=\"{qdisabled: noPrevious()}\"><a href ng-click=\"selectPage(1)\">{{getText('first')}}</a></li>\n" +
    	    "  <li ng-if=\"directionLinks\" ng-class=\"{qdisabled: noPrevious()}\"><a href ng-click=\"selectPage(page - 1)\">{{getText('previous')}}</a></li>\n" +
    	    "  <li ng-repeat=\"page in pages track by $index\" ng-class=\"{qactive: page.active}\"><a href ng-click=\"selectPage(page.number)\">{{page.text}}</a></li>\n" +
    	    "  <li ng-if=\"directionLinks\" ng-class=\"{qdisabled: noNext()}\"><a href ng-click=\"selectPage(page + 1)\">{{getText('next')}}</a></li>\n" +
    	    "  <li ng-if=\"boundaryLinks\" ng-class=\"{qdisabled: noNext()}\"><a href ng-click=\"selectPage(totalPages)\">{{getText('last')}}</a></li>\n" +
    	    "</ul>");
    }]);
    
    frameworkApp.run(["$templateCache", function($templateCache) {
    	  $templateCache.put("template/tabs/tab.html",
    	    "<li ng-class=\"{qactive: active, qdisabled: disabled}\">\n" +
    	    "  <a style=\"color: #555;\" href ng-click=\"select()\" tab-heading-transclude>{{heading}}</a>\n" +
    	    "</li>\n" +
    	    "");
    }]);

    frameworkApp.run(["$templateCache", function($templateCache) {
    	  $templateCache.put("template/tabs/tabset.html",
    	    "<div>\n" +
    	    "  <ul class=\"qnav qnav-{{type || 'tabs'}}\" ng-class=\"{'qnav-stacked': vertical, 'qnav-justified': justified}\" style=\"margin-top: 0px;\" ng-transclude></ul>\n" +
    	    "  <div class=\"qtab-content\" style=\"overflow: visible;\">\n" +
    	    "    <div class=\"qtab-pane\" \n" +
    	    "         ng-repeat=\"tab in tabs\" \n" +
    	    "         ng-class=\"{qactive: tab.active}\"\n" +
    	    "         tab-content-transclude=\"tab\">\n" +
    	    "    </div>\n" +
    	    "  </div>\n" +
    	    "</div>\n" +
    	    "");
    }]);
    
    frameworkApp.run(["$templateCache", function($templateCache) {
    	  $templateCache.put("template/datepicker/day.html",
    	    "<table role=\"grid\" aria-labelledby=\"{{uniqueId}}-title\" aria-activedescendant=\"{{activeDateId}}\" class=\"qtablecal\">\n" +
    	    "  <thead>\n" +
    	    "    <tr>\n" +
    	    "      <th><button type=\"button\" style=\"width: 34px;\" class=\"qbtn qbtn-default qbtn-sm qpull-left\" ng-click=\"move(-1)\" tabindex=\"-1\"><i class=\"fa fa-chevron-left\"></i></button></th>\n" +
    	    "      <th colspan=\"{{5 + showWeeks}}\"><button id=\"{{uniqueId}}-title\" role=\"heading\" aria-live=\"assertive\" aria-atomic=\"true\" type=\"button\" class=\"qbtn qbtn-default qbtn-sm force-font\" ng-click=\"toggleMode()\" tabindex=\"-1\" style=\"width:100%;\"><strong>{{title}}</strong></button></th>\n" +
    	    "      <th><button type=\"button\" style=\"width: 34px;\" class=\"qbtn qbtn-default qbtn-sm qpull-right\" ng-click=\"move(1)\" tabindex=\"-1\"><i class=\"fa fa-chevron-right\"></i></button></th>\n" +
    	    "    </tr>\n" +
    	    "    <tr>\n" +
    	    "      <th ng-show=\"showWeeks\" class=\"qtext-center\"></th>\n" +
    	    "      <th ng-repeat=\"label in labels track by $index\" class=\"qtext-center force-font\"><small aria-label=\"{{label.full}}\">{{label.abbr}}</small></th>\n" +
    	    "    </tr>\n" +
    	    "  </thead>\n" +
    	    "  <tbody>\n" +
    	    "    <tr ng-repeat=\"row in rows track by $index\">\n" +
    	    "      <td ng-show=\"showWeeks\" class=\"qtext-center qh6 force-font\"><em>{{ weekNumbers[$index] }}</em></td>\n" +
    	    "      <td ng-repeat=\"dt in row track by dt.date\" class=\"qtext-center force-font\" role=\"gridcell\" id=\"{{dt.uid}}\" aria-disabled=\"{{!!dt.disabled}}\">\n" +
    	    "        <button type=\"button\" class=\"qbtn qbtn-default qbtn-sm force-font\" ng-class=\"{'qbtn-info': dt.selected, qactive: isActive(dt)}\" ng-click=\"select(dt.date)\" ng-disabled=\"dt.disabled\" tabindex=\"-1\"><span ng-class=\"{'qtext-muted': dt.secondary, 'qtext-info': dt.current}\">{{dt.label}}</span></button>\n" +
    	    "      </td>\n" +
    	    "    </tr>\n" +
    	    "  </tbody>\n" +
    	    "</table>\n" +
    	    "");
    	}]);

    frameworkApp.run(["$templateCache", function($templateCache) {
    	  $templateCache.put("template/datepicker/month.html",
    	    "<table role=\"grid\" aria-labelledby=\"{{uniqueId}}-title\" aria-activedescendant=\"{{activeDateId}}\"  class=\"qtablecal\">\n" +
    	    "  <thead>\n" +
    	    "    <tr>\n" +
    	    "      <th><button type=\"button\" class=\"qbtn qbtn-default qbtn-sm qpull-right\" ng-click=\"move(-1)\" tabindex=\"-1\"><i class=\"fa fa-chevron-left\"></i></button></th>\n" +
    	    "      <th><button id=\"{{uniqueId}}-title\" role=\"heading\" aria-live=\"assertive\" aria-atomic=\"true\" type=\"button\" class=\"qbtn qbtn-default qbtn-sm force-font\" ng-click=\"toggleMode()\" tabindex=\"-1\" style=\"width:100%;\"><strong>{{title}}</strong></button></th>\n" +
    	    "      <th><button type=\"button\" class=\"qbtn qbtn-default qbtn-sm qpull-left\" ng-click=\"move(1)\" tabindex=\"-1\"><i class=\"fa fa-chevron-right\"></i></button></th>\n" +
    	    "    </tr>\n" +
    	    "  </thead>\n" +
    	    "  <tbody>\n" +
    	    "    <tr ng-repeat=\"row in rows track by $index\">\n" +
    	    "      <td ng-repeat=\"dt in row track by dt.date\" class=\"qtext-center\" role=\"gridcell\" id=\"{{dt.uid}}\" aria-disabled=\"{{!!dt.disabled}}\">\n" +
    	    "        <button type=\"button\" style=\"width:82px;padding: 3px 6px;\" class=\"qbtn qbtn-default force-font\" ng-class=\"{'qbtn-info': dt.selected, qactive: isActive(dt)}\" ng-click=\"select(dt.date)\" ng-disabled=\"dt.disabled\" tabindex=\"-1\"><span ng-class=\"{'qtext-info': dt.current}\">{{dt.label}}</span></button>\n" +
    	    "      </td>\n" +
    	    "    </tr>\n" +
    	    "  </tbody>\n" +
    	    "</table>\n" +
    	    "");
    	}]);

    frameworkApp.run(["$templateCache", function($templateCache) {
    	  $templateCache.put("template/datepicker/popup.html",
    	    "<ul class=\"qdropdown-menu\" ng-style=\"{display: (isOpen && 'block') || 'none', top: position.top+'px', left: position.left+'px'}\" ng-keydown=\"keydown($event)\">\n" +
    	    "	<li ng-transclude></li>\n" +
    	    "	<li ng-if=\"showButtonBar\" style=\"padding:10px 9px 2px\">\n" +
    	    "		<span class=\"qbtn-group qpull-left\">\n" +
    	    "			<button type=\"button\" class=\"qbtn qbtn-sm qbtn-info force-font\" ng-click=\"select('today')\">{{ getText('current') }}</button>\n" +
    	    "			<button type=\"button\" class=\"qbtn qbtn-sm qbtn-danger force-font\" ng-click=\"select(null)\">{{ getText('clear') }}</button>\n" +
    	    "		</span>\n" +
    	    "		<button type=\"button\" class=\"qbtn qbtn-sm qbtn-success qpull-right force-font\" ng-click=\"close()\">{{ getText('close') }}</button>\n" +
    	    "	</li>\n" +
    	    "</ul>\n" +
    	    "");
    	}]);

    frameworkApp.run(["$templateCache", function($templateCache) {
    	  $templateCache.put("template/datepicker/year.html",
    	    "<table role=\"grid\" aria-labelledby=\"{{uniqueId}}-title\" aria-activedescendant=\"{{activeDateId}}\"  class=\"qtablecal\">\n" +
    	    "  <thead>\n" +
    	    "    <tr>\n" +
    	    "      <th><button type=\"button\" class=\"qbtn qbtn-default qbtn-sm qpull-right\" ng-click=\"move(-1)\" tabindex=\"-1\"><i class=\"fa fa-chevron-left\"></i></button></th>\n" +
    	    "      <th colspan=\"3\"><button id=\"{{uniqueId}}-title\" role=\"heading\" aria-live=\"assertive\" aria-atomic=\"true\" type=\"button\" class=\"qbtn qbtn-default qbtn-sm force-font\" ng-click=\"toggleMode()\" tabindex=\"-1\" style=\"width:100%;\"><strong>{{title}}</strong></button></th>\n" +
    	    "      <th><button type=\"button\" class=\"qbtn qbtn-default qbtn-sm qpull-left\" ng-click=\"move(1)\" tabindex=\"-1\"><i class=\"fa fa-chevron-right\"></i></button></th>\n" +
    	    "    </tr>\n" +
    	    "  </thead>\n" +
    	    "  <tbody>\n" +
    	    "    <tr ng-repeat=\"row in rows track by $index\">\n" +
    	    "      <td ng-repeat=\"dt in row track by dt.date\" class=\"qtext-center\" role=\"gridcell\" id=\"{{dt.uid}}\" aria-disabled=\"{{!!dt.disabled}}\">\n" +
    	    "        <button type=\"button\" style=\"width:49px;padding: 3px 6px;\" class=\"qbtn qbtn-default force-font\" ng-class=\"{'qbtn-info': dt.selected, qactive: isActive(dt)}\" ng-click=\"select(dt.date)\" ng-disabled=\"dt.disabled\" tabindex=\"-1\"><span ng-class=\"{'qtext-info': dt.current}\">{{dt.label}}</span></button>\n" +
    	    "      </td>\n" +
    	    "    </tr>\n" +
    	    "  </tbody>\n" +
    	    "</table>\n" +
    	    "");
    	}]);
    
    frameworkApp.run(["$templateCache", function($templateCache) {
    	$templateCache.put("template/popover/popover.html",
    	    "<div class=\"qpopover {{placement}}\" ng-class=\"{ in: isOpen(), fade: animation() }\">\n" +
    	    "  <div class=\"qarrow\"></div>\n" +
    	    "\n" +
    	    "  <div class=\"qpopover-inner\">\n" +
    	    "      <h3 class=\"qpopover-title\" ng-bind=\"title\" ng-show=\"title\"></h3>\n" +
    	    "      <div class=\"qpopover-content\" ng-bind=\"content\"></div>\n" +
    	    "  </div>\n" +
    	    "</div>\n" +
    	    "");
    	}]);
    
} 