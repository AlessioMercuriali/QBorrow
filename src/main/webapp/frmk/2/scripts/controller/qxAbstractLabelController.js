var frameworkApp = angular.module('framework');
frameworkApp.controller('qxAbstractLabelController', ['$scope', 'SweetAlert', 'qxFrameworkHttpService', '$modal', '$timeout', '$window', function ($scope, SweetAlert, qxFrameworkHttpService, $modal, $timeout, $window){
	
	$scope.openPopupUpdateLabel = function(labelId, application, mode){
		var modalInstance = $modal.open({
		    templateUrl: 'modalUpdateLabel.html',
		    windowTemplateUrl: 'template/modal/window-quix.html',
		    controller: 'qxAbstractLabelPopupController',
		    size: 'lg',
		    resolve: {
		    	application: function() {
		    		return application;
		    	},
		    	labelId: function() {
		    		return labelId;
		    	},
		    	mode: function() {
		    		return mode;
		    	}
            }
		});
		modalInstance.result.then(
			function() {
				$window.location.reload();
			}
		)
	}
}]);

frameworkApp.controller('qxAbstractLabelPopupController', ['$scope', 'SweetAlert', 'qxFrameworkHttpService', '$modal', '$modalInstance', '$timeout', 'labelId', 'application', 'mode', function ($scope, SweetAlert, qxFrameworkHttpService, $modal, $modalInstance, $timeout, labelId, application, mode){
		
	$scope.forms = [];
	$scope.scopeController = {};
	$scope.scopeController.labelId = labelId;
	$scope.scopeController.application = application;
	$scope.scopeController.mode = mode;
	$scope.newLabel = false;
	$scope.notValid = false;
	
	$scope.labelToUpdateList = function () {
		qxFrameworkHttpService.getLabelToUpdateList($scope.scopeController);
	}
	
	$scope.getKeys = function(row) {
		return Object.keys(row.translationMap);
	}
		
	$scope.toLowerCase = function(language) {
		return language.toLowerCase();
	}
	
	$scope.createLabelToUpdate = function () {
		$scope.notValid = false;
		$scope.newLabel = true;
		$scope.scopeController.newLabel = {};
		qxFrameworkHttpService.createNewLabel($scope.scopeController);

//		$scope.scopeController.languageList = ['ad','ae','af','ag','ai','al','am','an','ao','ar',
//		                                       ,'as','at','au','aw','ax','az','ba','bb','bd','be'
//		                                       ,'bf','bg','bh','bi','bj','bm','bn','bo','br','bs'
//		                                       ,'bt','bv','bw','by','bz','ca','catalonia','cc','cd','cf'
//		                                       ,'cg','ch','ci','ck','cl','cm','cn','co','cr','cs'
//		                                       ,'cu','cv','cx','cy','cz','de','dj','dk','dm','do'
//		                                       ,'dz','ec','ee','eg','eh','en','en32','england','er','es'
//		                                       ,'et','europeanunion','fam','fi','fj','fk','fm','fo','fr','ga'
//		                                       ,'gb','gd','ge','gf','gh','gi','gl','gm','gn','gp'
//		                                       ,'gq','gr','gs','gt','gu','gw','gy','hk','hm','hn'
//		                                       ,'hr','ht','hu','id','ie','il','in','io','iq','ir'
//		                                       ,'is','it','it32','jm','jo','jp','ke','kg','kh','ki'
//		                                       ,'km','kn','kp','kr','kw','ky','kz','la','lb','lc'
//		                                       ,'li','lk','lr','ls','lt','lu','lv','ly','ma','mc'
//		                                       ,'md','me','mg','mh','mk','ml','mm','mn','mo','mp'
//		                                       ,'mq','mr','ms','mt','mu','mv','mw','mx','my','mz'
//		                                       ,'na','nc','ne','nf','ng','ni','nl','no','np','nr'
//		                                       ,'nu','nz','om','pa','pe','pf','pg','ph','pk','pl'
//		                                       ,'pm','pn','pr','ps','pt','pw','py','qa','re','ro'
//		                                       ,'rs','ru','rw','sa','sb','sc','scotland','sd','se','sg'
//		                                       ,'sh','si','sj','sk','sl','sm','sn','so','sr','st'
//		                                       ,'sv','sy','sz','tc','td','tf','tg','th','tj','tk'
//		                                       ,'tl','tm','tn','to','tr','tt','tv','tw','tz','ua'
//		                                       ,'ug','um','us','uy','uz','va','vc','ve','vg','vi'
//		                                       ,'vn','vu','wales','wf','ws','ye','yt','za','zm','zw','default'
//		                                       ]
		
	}
	
	$scope.annullaInsert = function() {
		$scope.newLabel = false;
	}
	
	$scope.toUpper = function(text) {
		return text.toUpperCase();
	}
	
	$scope.saveLabelToUpdateList = function () {
		qxFrameworkHttpService.saveLabelToUpdateList($scope.scopeController, $modalInstance);
	}
	
	$scope.getOptionsForSummernote = function() {
		return {
			height: 300,
			focus: true,
			airMode: true,
			toolbar: [
			            ['edit',['undo','redo']],
			            ['headline', ['style']],
			            ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
			            ['fontface', ['fontname']],
			            ['textsize', ['fontsize']],
			            ['fontclr', ['color']],
			            ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
			            ['height', ['height']],
			            ['table', ['table']],
			            ['insert', ['link','picture','video','hr']],
			            ['view', ['fullscreen', 'codeview']],
			            ['help', ['help']]
			         ]
		} 
    };
	
	$scope.getOptionForCodeMirror = function() {
			return {
				lineNumbers: true,
			    theme:'mdn-like',
			    lineWrapping : true,
			    matchBrackets : true,
			    autoCloseBrackets: true,
			    matchTags: true,
			    autoCloseTags: true,
			    mode: 'text/x-freemarker',
			    text: 'freemarker',
			    extraKeys: {
			    	"F11": function(cm) {
			            		cm.setOption("fullScreen", !cm.getOption("fullScreen"));
			           		},
			        "Esc": function(cm) {
			        			if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
			            	}
			    }
			};		
	}
	
	$scope.configForEditor = 
			{
			    sanitize: false,
			    toolbar: [
					{ name: 'basicStyling', items: ['bold', 'italic', 'underline', 'strikethrough', 'subscript', 'superscript', '-', 'leftAlign', 'centerAlign', 'rightAlign', 'blockJustify', '-'] },
					{ name: 'paragraph', items: ['orderedList', 'unorderedList', 'outdent', 'indent', '-'] },
					{ name: 'doers', items: ['removeFormatting', 'undo', 'redo', '-'] },
					{ name: 'colors', items: ['fontColor', 'backgroundColor', '-'] },
	//				{ name: 'links', items: ['image', 'hr', 'symbols', 'link', 'unlink', '-'] },
	//				{ name: 'tools', items: ['print', '-'] },
					{ name: 'styling', items: ['font', 'size', 'format'] }
			    ]
			};
	
	
	$scope.closeLabelToUpdate = function () {
    	$modalInstance.close();
	}
	
	$scope.isValidLabel = function(label) {
		var list = $scope.scopeController.viewList;
		for (var i = 0; i < list.length; i++) {
			if (list[i].labelKey.organization == label.organization) {
				if (list[i].translationMap[label.language] != null &&
					list[i].translationMap[label.language] != undefined) {
					return false;
				}
			}
		}
		return true;
	}
	
	$scope.isValidItem = function(field) {
		if (field != undefined && field != null && field != '' && field != {} && field != []) {
			return true;
		}
		return false;
	}
	
	$scope.setValidity = function(field, validity) {
		field.$setValidity("notNull", validity);
	}
	
	$scope.addLabelToUpdateList = function () {
		$scope.notValid = false;
		if ($scope.isValidLabel($scope.scopeController.newLabel)) {
			for (var i = 0; i < $scope.scopeController.viewList.length; i++) {
				if ($scope.scopeController.newLabel.organization == $scope.scopeController.viewList[i].labelKey.organization) {
					$scope.scopeController.viewList[i].translationMap[$scope.scopeController.newLabel.language.toUpperCase()] = $scope.scopeController.newLabel.translation;
					$scope.newLabel = false;
					return;
				}
			}
			if (!$scope.isValidItem($scope.scopeController.newLabel.organization)) {
				$scope.setValidity($scope.forms.newLabelForm.organization, false);
			}
			if (!$scope.isValidItem($scope.scopeController.newLabel.language)) {
				$scope.setValidity($scope.forms.newLabelForm.language, false);
			}
			if (!$scope.isValidItem($scope.scopeController.newLabel.translation)) {
				$scope.setValidity($scope.forms.newLabelForm.translation, false);
			}
			if (!$scope.isValidItem($scope.scopeController.newLabel.organization) || !$scope.isValidItem($scope.scopeController.newLabel.language) || !$scope.isValidItem($scope.scopeController.newLabel.translation) || !$scope.notValid) {
				var labelKey = {};
				labelKey.organization = $scope.scopeController.newLabel.organization;
				labelKey.labelId = $scope.scopeController.labelId;
				labelKey.application = $scope.scopeController.application;
				labelKey.language = null;
				var translationMap = {};
				translationMap[$scope.scopeController.newLabel.language.toUpperCase()] = $scope.scopeController.newLabel.translation;
				var nuova = {};
				nuova.labelKey = labelKey;
				nuova.translationMap = [];
				nuova.translationMap = translationMap;
				var list = [];
				list.push(nuova);
				for (var i = 0; i < $scope.scopeController.viewList.length; i++) {
					list.push($scope.scopeController.viewList[i]);
				}
				$scope.scopeController.viewList = [];
				$scope.scopeController.viewList = list;
				$scope.newLabel = false;
			}
		} else {
			$scope.newLabel = false;
			$scope.notValid = true;
		}
	}
	
	$scope.labelToUpdateList();
	
}]);
