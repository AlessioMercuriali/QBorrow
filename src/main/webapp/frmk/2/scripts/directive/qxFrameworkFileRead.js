queryApp.directive("fileread", [function () {
    return {
    	/*
        scope: {
            fileread: '=',
            scopeController: '='
        }, */
    	 scope: false,
        link: function (scope, element, attributes) {
            element.bind("change", function (changeEvent) {
                var //reader = new FileReader(),
                	file = changeEvent.target.files[0];
                //reader.onload = function (loadEvent) {
                    scope.$apply(function () {
                        scope.fileread = {
                        		content: file,
                        		fileName: file.name,
                        		fileType: file.type,
                        		fileSize: file.dimens
                        };
                        scope.scopeController.file = scope.fileread;
                    });
                //}
                //TODO: verificare che la read restituisca il file che ci aspettiamo!!
                //Riferimento alle varie modalita' di read: https://developer.mozilla.org/en-US/docs/Web/API/File
               // reader.readAsBinaryString(file);
            });
        }
    }
}]);

